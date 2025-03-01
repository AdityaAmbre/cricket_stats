class CricketModel {
  CricketModel({
    required this.matchdetail,
    required this.nuggets,
    required this.innings,
    required this.teams,
    required this.notes,
  });

  final Matchdetail? matchdetail;
  final List<String> nuggets;
  final List<Inning> innings;
  final Map<String, Team> teams;
  final Map<String, List<String>> notes;

  factory CricketModel.fromJson(Map<String, dynamic> json) {
    return CricketModel(
      matchdetail: json["Matchdetail"] == null
          ? null
          : Matchdetail.fromJson(json["Matchdetail"]),
      nuggets: json["Nuggets"] == null
          ? []
          : List<String>.from(json["Nuggets"]!.map((x) => x)),
      innings: json["Innings"] == null
          ? []
          : List<Inning>.from(json["Innings"]!.map((x) => Inning.fromJson(x))),
      teams: Map.from(json["Teams"])
          .map((k, v) => MapEntry<String, Team>(k, Team.fromJson(v))),
      notes: Map.from(json["Notes"]).map((k, v) =>
          MapEntry<String, List<String>>(
              k, v == null ? [] : List<String>.from(v!.map((x) => x)))),
    );
  }

  @override
  String toString() {
    return "$matchdetail, $nuggets, $innings, $teams, $notes, ";
  }
}

class Inning {
  Inning({
    required this.number,
    required this.battingteam,
    required this.total,
    required this.wickets,
    required this.overs,
    required this.runrate,
    required this.byes,
    required this.legbyes,
    required this.wides,
    required this.noballs,
    required this.penalty,
    required this.allottedOvers,
    required this.batsmen,
    required this.partnershipCurrent,
    required this.bowlers,
    required this.fallofWickets,
    required this.powerPlay,
    required this.target,
  });

  final String? number;
  final String? battingteam;
  final String? total;
  final String? wickets;
  final String? overs;
  final String? runrate;
  final String? byes;
  final String? legbyes;
  final String? wides;
  final String? noballs;
  final String? penalty;
  final String? allottedOvers;
  final List<InningBatsman> batsmen;
  final PartnershipCurrent? partnershipCurrent;
  final List<Bowler> bowlers;
  final List<FallofWicket> fallofWickets;
  final PowerPlay? powerPlay;
  final String? target;

  factory Inning.fromJson(Map<String, dynamic> json) {
    return Inning(
      number: json["Number"],
      battingteam: json["Battingteam"],
      total: json["Total"],
      wickets: json["Wickets"],
      overs: json["Overs"],
      runrate: json["Runrate"],
      byes: json["Byes"],
      legbyes: json["Legbyes"],
      wides: json["Wides"],
      noballs: json["Noballs"],
      penalty: json["Penalty"],
      allottedOvers: json["AllottedOvers"],
      batsmen: json["Batsmen"] == null
          ? []
          : List<InningBatsman>.from(
              json["Batsmen"]!.map((x) => InningBatsman.fromJson(x))),
      partnershipCurrent: json["Partnership_Current"] == null
          ? null
          : PartnershipCurrent.fromJson(json["Partnership_Current"]),
      bowlers: json["Bowlers"] == null
          ? []
          : List<Bowler>.from(json["Bowlers"]!.map((x) => Bowler.fromJson(x))),
      fallofWickets: json["FallofWickets"] == null
          ? []
          : List<FallofWicket>.from(
              json["FallofWickets"]!.map((x) => FallofWicket.fromJson(x))),
      powerPlay: json["PowerPlay"] == null
          ? null
          : PowerPlay.fromJson(json["PowerPlay"]),
      target: json["Target"],
    );
  }

  @override
  String toString() {
    return "$number, $battingteam, $total, $wickets, $overs, $runrate, $byes, $legbyes, $wides, $noballs, $penalty, $allottedOvers, $batsmen, $partnershipCurrent, $bowlers, $fallofWickets, $powerPlay, $target, ";
  }
}

class InningBatsman {
  InningBatsman({
    required this.batsman,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.dots,
    required this.strikerate,
    required this.dismissal,
    required this.howout,
    required this.bowler,
    required this.fielder,
    required this.isonstrike,
  });

  final String? batsman;
  final String? runs;
  final String? balls;
  final String? fours;
  final String? sixes;
  final String? dots;
  final String? strikerate;
  final String? dismissal;
  final String? howout;
  final String? bowler;
  final String? fielder;
  final bool? isonstrike;

  factory InningBatsman.fromJson(Map<String, dynamic> json) {
    return InningBatsman(
      batsman: json["Batsman"],
      runs: json["Runs"],
      balls: json["Balls"],
      fours: json["Fours"],
      sixes: json["Sixes"],
      dots: json["Dots"],
      strikerate: json["Strikerate"],
      dismissal: json["Dismissal"],
      howout: json["Howout"],
      bowler: json["Bowler"],
      fielder: json["Fielder"],
      isonstrike: json["Isonstrike"],
    );
  }

  @override
  String toString() {
    return "$batsman, $runs, $balls, $fours, $sixes, $dots, $strikerate, $dismissal, $howout, $bowler, $fielder, $isonstrike, ";
  }
}

class Bowler {
  Bowler({
    required this.bowler,
    required this.overs,
    required this.maidens,
    required this.runs,
    required this.wickets,
    required this.economyrate,
    required this.noballs,
    required this.wides,
    required this.dots,
    required this.isbowlingtandem,
    required this.isbowlingnow,
    required this.thisOver,
  });

  final String? bowler;
  final String? overs;
  final String? maidens;
  final String? runs;
  final String? wickets;
  final String? economyrate;
  final String? noballs;
  final String? wides;
  final String? dots;
  final bool? isbowlingtandem;
  final bool? isbowlingnow;
  final List<ThisOver> thisOver;

  factory Bowler.fromJson(Map<String, dynamic> json) {
    return Bowler(
      bowler: json["Bowler"],
      overs: json["Overs"],
      maidens: json["Maidens"],
      runs: json["Runs"],
      wickets: json["Wickets"],
      economyrate: json["Economyrate"],
      noballs: json["Noballs"],
      wides: json["Wides"],
      dots: json["Dots"],
      isbowlingtandem: json["Isbowlingtandem"],
      isbowlingnow: json["Isbowlingnow"],
      thisOver: json["ThisOver"] == null
          ? []
          : List<ThisOver>.from(
              json["ThisOver"]!.map((x) => ThisOver.fromJson(x))),
    );
  }

  @override
  String toString() {
    return "$bowler, $overs, $maidens, $runs, $wickets, $economyrate, $noballs, $wides, $dots, $isbowlingtandem, $isbowlingnow, $thisOver, ";
  }
}

class ThisOver {
  ThisOver({
    required this.t,
    required this.b,
  });

  final String? t;
  final String? b;

  factory ThisOver.fromJson(Map<String, dynamic> json) {
    return ThisOver(
      t: json["T"],
      b: json["B"],
    );
  }

  @override
  String toString() {
    return "$t, $b, ";
  }
}

class FallofWicket {
  FallofWicket({
    required this.batsman,
    required this.score,
    required this.overs,
  });

  final String? batsman;
  final String? score;
  final String? overs;

  factory FallofWicket.fromJson(Map<String, dynamic> json) {
    return FallofWicket(
      batsman: json["Batsman"],
      score: json["Score"],
      overs: json["Overs"],
    );
  }

  @override
  String toString() {
    return "$batsman, $score, $overs, ";
  }
}

class PartnershipCurrent {
  PartnershipCurrent({
    required this.runs,
    required this.balls,
    required this.batsmen,
  });

  final String? runs;
  final String? balls;
  final List<PartnershipCurrentBatsman> batsmen;

  factory PartnershipCurrent.fromJson(Map<String, dynamic> json) {
    return PartnershipCurrent(
      runs: json["Runs"],
      balls: json["Balls"],
      batsmen: json["Batsmen"] == null
          ? []
          : List<PartnershipCurrentBatsman>.from(json["Batsmen"]!
              .map((x) => PartnershipCurrentBatsman.fromJson(x))),
    );
  }

  @override
  String toString() {
    return "$runs, $balls, $batsmen, ";
  }
}

class PartnershipCurrentBatsman {
  PartnershipCurrentBatsman({
    required this.batsman,
    required this.runs,
    required this.balls,
  });

  final String? batsman;
  final String? runs;
  final String? balls;

  factory PartnershipCurrentBatsman.fromJson(Map<String, dynamic> json) {
    return PartnershipCurrentBatsman(
      batsman: json["Batsman"],
      runs: json["Runs"],
      balls: json["Balls"],
    );
  }

  @override
  String toString() {
    return "$batsman, $runs, $balls, ";
  }
}

class PowerPlay {
  PowerPlay({
    required this.pp1,
    required this.pp2,
  });

  final String? pp1;
  final String? pp2;

  factory PowerPlay.fromJson(Map<String, dynamic> json) {
    return PowerPlay(
      pp1: json["PP1"],
      pp2: json["PP2"],
    );
  }

  @override
  String toString() {
    return "$pp1, $pp2, ";
  }
}

class Matchdetail {
  Matchdetail({
    required this.teamHome,
    required this.teamAway,
    required this.match,
    required this.series,
    required this.venue,
    required this.officials,
    required this.weather,
    required this.tosswonby,
    required this.status,
    required this.statusId,
    required this.playerMatch,
    required this.result,
    required this.winningteam,
    required this.winmargin,
    required this.equation,
  });

  final String? teamHome;
  final String? teamAway;
  final Match? match;
  final Series? series;
  final Venue? venue;
  final Officials? officials;
  final String? weather;
  final String? tosswonby;
  final String? status;
  final String? statusId;
  final String? playerMatch;
  final String? result;
  final String? winningteam;
  final String? winmargin;
  final String? equation;

  factory Matchdetail.fromJson(Map<String, dynamic> json) {
    return Matchdetail(
      teamHome: json["Team_Home"],
      teamAway: json["Team_Away"],
      match: json["Match"] == null ? null : Match.fromJson(json["Match"]),
      series: json["Series"] == null ? null : Series.fromJson(json["Series"]),
      venue: json["Venue"] == null ? null : Venue.fromJson(json["Venue"]),
      officials: json["Officials"] == null
          ? null
          : Officials.fromJson(json["Officials"]),
      weather: json["Weather"],
      tosswonby: json["Tosswonby"],
      status: json["Status"],
      statusId: json["Status_Id"],
      playerMatch: json["Player_Match"],
      result: json["Result"],
      winningteam: json["Winningteam"],
      winmargin: json["Winmargin"],
      equation: json["Equation"],
    );
  }

  @override
  String toString() {
    return "$teamHome, $teamAway, $match, $series, $venue, $officials, $weather, $tosswonby, $status, $statusId, $playerMatch, $result, $winningteam, $winmargin, $equation, ";
  }
}

class Match {
  Match({
    required this.livecoverage,
    required this.id,
    required this.code,
    required this.league,
    required this.number,
    required this.type,
    required this.date,
    required this.time,
    required this.offset,
    required this.daynight,
  });

  final String? livecoverage;
  final String? id;
  final String? code;
  final String? league;
  final String? number;
  final String? type;
  final String? date;
  final String? time;
  final String? offset;
  final String? daynight;

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      livecoverage: json["Livecoverage"],
      id: json["Id"],
      code: json["Code"],
      league: json["League"],
      number: json["Number"],
      type: json["Type"],
      date: json["Date"],
      time: json["Time"],
      offset: json["Offset"],
      daynight: json["Daynight"],
    );
  }

  @override
  String toString() {
    return "$livecoverage, $id, $code, $league, $number, $type, $date, $time, $offset, $daynight, ";
  }
}

class Officials {
  Officials({
    required this.umpires,
    required this.referee,
  });

  final String? umpires;
  final String? referee;

  factory Officials.fromJson(Map<String, dynamic> json) {
    return Officials(
      umpires: json["Umpires"],
      referee: json["Referee"],
    );
  }

  @override
  String toString() {
    return "$umpires, $referee, ";
  }
}

class Series {
  Series({
    required this.id,
    required this.name,
    required this.status,
    required this.tour,
    required this.tourName,
  });

  final String? id;
  final String? name;
  final String? status;
  final String? tour;
  final String? tourName;

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json["Id"],
      name: json["Name"],
      status: json["Status"],
      tour: json["Tour"],
      tourName: json["Tour_Name"],
    );
  }

  @override
  String toString() {
    return "$id, $name, $status, $tour, $tourName, ";
  }
}

class Venue {
  Venue({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["Id"],
      name: json["Name"],
    );
  }

  @override
  String toString() {
    return "$id, $name, ";
  }
}

class Team {
  Team({
    required this.nameFull,
    required this.nameShort,
    required this.players,
  });

  final String? nameFull;
  final String? nameShort;
  final Map<String, Player> players;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      nameFull: json["Name_Full"],
      nameShort: json["Name_Short"],
      players: Map.from(json["Players"])
          .map((k, v) => MapEntry<String, Player>(k, Player.fromJson(v))),
    );
  }

  @override
  String toString() {
    return "$nameFull, $nameShort, $players, ";
  }
}

class Player {
  Player({
    required this.position,
    required this.nameFull,
    required this.iskeeper,
    required this.batting,
    required this.bowling,
    required this.iscaptain,
  });

  final String? position;
  final String? nameFull;
  final bool? iskeeper;
  final Batting? batting;
  final Bowling? bowling;
  final bool? iscaptain;

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      position: json["Position"],
      nameFull: json["Name_Full"],
      iskeeper: json["Iskeeper"],
      batting:
          json["Batting"] == null ? null : Batting.fromJson(json["Batting"]),
      bowling:
          json["Bowling"] == null ? null : Bowling.fromJson(json["Bowling"]),
      iscaptain: json["Iscaptain"],
    );
  }

  @override
  String toString() {
    return "$position, $nameFull, $iskeeper, $batting, $bowling, $iscaptain, ";
  }
}

class Batting {
  Batting({
    required this.style,
    required this.average,
    required this.strikerate,
    required this.runs,
  });

  final String? style;
  final String? average;
  final String? strikerate;
  final String? runs;

  factory Batting.fromJson(Map<String, dynamic> json) {
    return Batting(
      style: json["Style"],
      average: json["Average"],
      strikerate: json["Strikerate"],
      runs: json["Runs"],
    );
  }

  @override
  String toString() {
    return "$style, $average, $strikerate, $runs, ";
  }
}

class Bowling {
  Bowling({
    required this.style,
    required this.average,
    required this.economyrate,
    required this.wickets,
  });

  final String? style;
  final String? average;
  final String? economyrate;
  final String? wickets;

  factory Bowling.fromJson(Map<String, dynamic> json) {
    return Bowling(
      style: json["Style"],
      average: json["Average"],
      economyrate: json["Economyrate"],
      wickets: json["Wickets"],
    );
  }

  @override
  String toString() {
    return "$style, $average, $economyrate, $wickets, ";
  }
}