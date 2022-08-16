abstract class NewsAppStates{}
class IinitState extends NewsAppStates{}

class BottomNavstates extends NewsAppStates{}

class GetBusinessDataStateLoading extends NewsAppStates{}

class GetBusinessDataStateSuccess extends NewsAppStates{}

class GetBusinessDataStateError extends NewsAppStates {
   String? error;
   GetBusinessDataStateError(this.error);
}

class GetSportsDataStateSuccess extends NewsAppStates{}

class GetSportsDataStateLoading extends NewsAppStates{}

class GetSportsDataStateError extends NewsAppStates{
  String? error;
  GetSportsDataStateError(this.error);
}

class GetScienceDataStateSuccess extends NewsAppStates{}

class GetScienceDataStateLoading extends NewsAppStates{}

class GetScienceDataStateError extends NewsAppStates{
  String? error;
  GetScienceDataStateError(this.error);
}

class GetSearchDataStateLoading extends NewsAppStates{}
class GetSearchDataStateSuccess extends NewsAppStates{}
class GetSearchDataStateError extends NewsAppStates{
   String? error;
   GetSearchDataStateError(this.error);
}





abstract class MasterAppcubitstate{}
class Initstate extends MasterAppcubitstate{}
class ChangethememodeState extends MasterAppcubitstate{}