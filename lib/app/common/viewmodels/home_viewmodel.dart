import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:agro_info/app/common/models/market/get_commodity_data_response_model.dart';
import 'package:agro_info/app/common/models/news/news_model.dart';
import 'package:agro_info/app/common/models/news/news_response_model.dart';
import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/location_service.dart';
import 'package:agro_info/app/common/services/market_service.dart';
import 'package:agro_info/app/common/services/news_service.dart';
import 'package:agro_info/app/common/services/weather_service.dart';
import 'package:agro_info/app/common/states/market_state.dart';
import 'package:agro_info/app/common/states/news_state.dart';
import 'package:agro_info/app/common/states/weather_state.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  final IWeatherService _weatherService;
  final ILocationService _locationService;
  final INewsService _newsService;
  final IMarketservice _marketService;

  IWeatherState _weatherState = LoadingWeatherState();
  IWeatherState get weatherState => _weatherState;

  INewsState _newsState = LoadingNewsState();
  INewsState get newsState => _newsState;

  IMarketState _marketState = LoadingMarketState();
  IMarketState get marketState => _marketState;

  HomeViewmodel({
    required IWeatherService weatherService,
    required ILocationService locationService,
    required INewsService newsService,
    required IMarketservice marketService,
  }) : _weatherService = weatherService,
       _locationService = locationService,
       _newsService = newsService,
       _marketService = marketService {
    _fetchForecasts();
    _initFetchNews();
    _fetchMarketData();
  }

  void _emit({
    IWeatherState? weatherState,
    INewsState? newsState,
    IMarketState? marketState,
  }) {
    if (weatherState != null) {
      _weatherState = weatherState;
    }

    if (newsState != null) {
      _newsState = newsState;
    }

    if (marketState != null) {
      _marketState = marketState;
    }

    notifyListeners();
  }

  void _fetchForecasts() async {
    _emit(weatherState: LoadingWeatherState());

    Result positionResult = await _locationService.determinePosition();

    if (positionResult is Failure) {
      _emit(weatherState: FailureWeatherState(positionResult.error.toString()));
      return;
    }

    var forecastResult = await _weatherService.getForecast(
      position: (positionResult as Success).value,
    );

    switch (forecastResult) {
      case Success(value: var weather):
        _emit(weatherState: LoadedWeatherState(weather));
        break;
      case Failure(error: var error):
        _emit(weatherState: FailureWeatherState(error.toString()));
        break;
    }
  }

  void loadNewNews() async {
    INewsState state = _newsState;

    if (state is! LoadedNewsState) {
      _emit(
        newsState: FailureNewsState(
          "Não é possível aumentar uma lista sem nada.",
        ),
      );
      return;
    }

    if (state.isLoadingMore) {
      return;
    }

    if (state.page == state.quantityOfPages) {
      return;
    }

    int nextPage = state.page + 1;

    _emit(newsState: state.copyWith(isLoadingMore: true));

    Result newsResult = await _newsService.getAggricultureLastNews(
      page: nextPage,
      pageSize: INewsState.pageSize,
    );

    if (newsResult is Success) {
      int quantityOfPages =
          (newsResult.value.totalResults / INewsState.pageSize).ceil();

      List<NewsModel> newsList = [
        ...state.newsList,
        ...newsResult.value.articles,
      ];

      _emit(
        newsState: LoadedNewsState(
          newsList,
          page: nextPage,
          quantityOfPages: quantityOfPages,
        ),
      );
    }
  }

  void _getAggricultureLastNews(
    int page, [
    List<NewsModel>? preexistingList,
  ]) async {
    Result newsResult = await _newsService.getAggricultureLastNews(
      page: 1,
      pageSize: INewsState.pageSize,
    );

    switch (newsResult) {
      case Success(value: var newsData):
        int quantityOfPages =
            ((newsData as NewsResponseModel).totalResults / INewsState.pageSize)
                .ceil();
        List<NewsModel>? newList = preexistingList == null
            ? newsData.articles
            : [...preexistingList, ...newsData.articles];
        _emit(
          newsState: LoadedNewsState(
            newList,
            page: 1,
            quantityOfPages: quantityOfPages,
          ),
        );
        break;
      case Failure(error: var error):
        _emit(newsState: FailureNewsState(error.toString()));
        break;
    }
  }

  void _initFetchNews() async {
    _emit(newsState: LoadingNewsState());
    _getAggricultureLastNews(1);
  }

  void _fetchMarketData() async {
    _emit(marketState: LoadingMarketState());

    List<CommoditiesEnum> commoditiesToFetch = [
      CommoditiesEnum.aluminum,
      // CommoditiesEnum.coffee,
      // CommoditiesEnum.wheat,
    ];

    for (CommoditiesEnum commodity in commoditiesToFetch) {
      _marketService
          .getCommodityData(commodity)
          .then(
            (commodityResult) =>
                _processCommodityResponse(commodity, commodityResult),
          );

      // Tempo de espera pois a api gratuita só aceita 1 requisição por segundo
      await Future.delayed(Duration(milliseconds: 2100));
    }
  }

  void _processCommodityResponse(
    CommoditiesEnum commodity,
    Result<GetCommodityDataResponseModel, Exception> commodityResult,
  ) {
    switch (commodityResult) {
      case Success(value: var data):
        Map<CommoditiesEnum, GetCommodityDataResponseModel> commodities = {};

        if (_marketState is LoadedMarketState) {
          commodities = (_marketState as LoadedMarketState).commodities;
        }

        commodities[commodity] = data;

        _emit(marketState: LoadedMarketState(commodities: commodities));
        break;
      case Failure(error: var error):
        _emit(marketState: FailureMarketState(error.toString()));
        break;
    }
  }
}
