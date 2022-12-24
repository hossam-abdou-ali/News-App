abstract class Newsstate {}

class Newsintial extends Newsstate{}

class changestLoading extends Newsstate{}
class changest extends Newsstate{}


class GetBusinessLoading extends Newsstate{}
class GetBusinessSuc extends Newsstate{}
class GetBusinessError extends Newsstate{

  final String? error;

  GetBusinessError(this.error);

}


class GetScienceLoading extends Newsstate{}
class GetScienceSuc extends Newsstate{}
class GetScienceError extends Newsstate{

  final String? error;

  GetScienceError(this.error);

}

class GetSportLoading extends Newsstate{}
class GetSportSuc extends Newsstate{}
class GetSportError extends Newsstate{

  final String? error;

  GetSportError(this.error);
}

class searchloading extends Newsstate{}
class searchSuc extends Newsstate{}
class searchError extends Newsstate {

  final String? error;

  searchError(this.error);
}

abstract class modestate{}
class modeinitial extends modestate{}
class Modecubit extends modestate{}









