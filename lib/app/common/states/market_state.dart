sealed class IMarketState {}

class LoadingMarketState implements IMarketState {}

class LoadedMarketState implements IMarketState {}

class FailureMarketState implements IMarketState {}