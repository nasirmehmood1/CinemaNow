import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MoviecardModel {
  String backGroundImage;
  String movieTitile;
  String movieImbdRating;
  String movieType;
  String movieDescription;
  MoviecardModel({
    required this.backGroundImage,
    required this.movieTitile,
    required this.movieImbdRating,
    required this.movieType,
    required this.movieDescription,
  });

  MoviecardModel copyWith({
    String? backGroundImage,
    String? movieTitile,
    String? movieImbdRating,
    String? movieType,
    String? movieDescription,
  }) {
    return MoviecardModel(
      backGroundImage: backGroundImage ?? this.backGroundImage,
      movieTitile: movieTitile ?? this.movieTitile,
      movieImbdRating: movieImbdRating ?? this.movieImbdRating,
      movieType: movieType ?? this.movieType,
      movieDescription: movieDescription ?? this.movieDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backGroundImage': backGroundImage,
      'movieTitile': movieTitile,
      'movieImbdRating': movieImbdRating,
      'movieType': movieType,
      'movieDescription': movieDescription,
    };
  }

  factory MoviecardModel.fromMap(Map<String, dynamic> map) {
    return MoviecardModel(
      backGroundImage: map['backGroundImage'] as String,
      movieTitile: map['movieTitile'] as String,
      movieImbdRating: map['movieImbdRating'] as String,
      movieType: map['movieType'] as String,
      movieDescription: map['movieDescription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviecardModel.fromJson(String source) =>
      MoviecardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MoviecardModel(backGroundImage: $backGroundImage, movieTitile: $movieTitile, movieImbdRating: $movieImbdRating, movieType: $movieType, movieDescription: $movieDescription)';
  }

  @override
  bool operator ==(covariant MoviecardModel other) {
    if (identical(this, other)) return true;

    return other.backGroundImage == backGroundImage &&
        other.movieTitile == movieTitile &&
        other.movieImbdRating == movieImbdRating &&
        other.movieType == movieType &&
        other.movieDescription == movieDescription;
  }

  @override
  int get hashCode {
    return backGroundImage.hashCode ^
        movieTitile.hashCode ^
        movieImbdRating.hashCode ^
        movieType.hashCode ^
        movieDescription.hashCode;
  }
}

List<MoviecardModel> listOfMovieCards = [
  MoviecardModel(
      backGroundImage: 'assets/images/americansniper.png',
      movieTitile: 'American Sniper',
      movieImbdRating: '9.4',
      movieType: 'Action',
      movieDescription:
          'American Sniper" is a gripping biographical war drama directed by Clint Eastwood, portraying the life of Navy SEAL sniper Chris Kyle. It explores Kyles intense military career, his struggles with PTSD, and the moral complexities of warfare.'),
  MoviecardModel(
      backGroundImage: 'assets/images/banks.png',
      movieTitile: 'Banks blood',
      movieImbdRating: '8.0',
      movieType: 'Busniss',
      movieDescription:
          'Brian Banks" is a poignant biographical drama based on the true story of Brian Banks, a promising high school football player whose dreams are shattered when he is wrongly convicted of a crime he didnt commit.'),
  MoviecardModel(
      backGroundImage: 'assets/images/batman.jpeg',
      movieTitile: 'Batman night',
      movieImbdRating: '9.1',
      movieType: 'Action',
      movieDescription:
          'Batman" is a seminal superhero film directed by Tim Burton, portraying the iconic DC Comics character as he battles crime in Gotham City. Michael Keaton stars as the brooding Bruce Wayne/Batman, navigating his dual identity while facing off against the villainous Joker, played by Jack Nicholson.'),
  MoviecardModel(
      backGroundImage: 'assets/images/blackswan.png',
      movieTitile: 'Black Swan',
      movieImbdRating: '7.0',
      movieType: 'Action/Horror',
      movieDescription:
          'Black Swan" is a psychological thriller directed by Darren Aronofsky, exploring the intense pressures of professional ballet through the story of Nina, a talented but fragile dancer. Portrayed by Natalie Portman in an Oscar-winning role.'),
  MoviecardModel(
      backGroundImage: 'assets/images/casinoroyale.png',
      movieTitile: 'Casino Royale',
      movieImbdRating: '8.4',
      movieType: 'Action',
      movieDescription:
          'Casino Royale" is a thrilling James Bond film reboot starring Daniel Craig as the iconic MI6 agent. In his first mission, Bond must defeat a terrorist financier in a high-stakes poker game at Casino Royale, while navigating a web of deceit and betrayal.'),
  MoviecardModel(
      backGroundImage: 'assets/images/dirtyharry.png',
      movieTitile: 'Dirty Harry',
      movieImbdRating: '9.0',
      movieType: 'Action',
      movieDescription:
          'Dirty Harry" is a classic crime thriller starring Clint Eastwood as Inspector Harry Callahan, a tough San Francisco cop known for his unorthodox methods. The film follows Callahans relentless pursuit of a deranged sniper terrorizing the city.,'),
  MoviecardModel(
      backGroundImage: 'assets/images/forrestgump.png',
      movieTitile: 'Forrest Gump',
      movieImbdRating: '9.0',
      movieType: 'Action',
      movieDescription:
          'Forrest Gump" is a beloved American drama starring Tom Hanks as a kind-hearted man with a low IQ who inadvertently becomes involved in pivotal moments of 20th-century history. Through his extraordinary journey.,'),
  MoviecardModel(
      backGroundImage: 'assets/images/freewilly.jpg',
      movieTitile: 'Free Willy',
      movieImbdRating: '6.0',
      movieType: 'Adventure',
      movieDescription:
          'Free Willy" is a heartwarming family film about a troubled young boy who forms a special bond with an orca whale named Willy. Together, they embark on a journey to set Willy free from captivity, teaching valuable lessons about friendship.'),
  MoviecardModel(
      backGroundImage: 'assets/images/Gladiator.png',
      movieTitile: 'The Gladiator',
      movieImbdRating: '9.7',
      movieType: 'Action',
      movieDescription:
          'Gladiator" is an epic historical drama directed by Ridley Scott, starring Russell Crowe as Maximus Decimus Meridius, a betrayed Roman general who rises as a gladiator to seek revenge against the corrupt emperor Commodus.'),
  MoviecardModel(
      backGroundImage: 'assets/images/guardians.jpeg',
      movieTitile: ' The Guardians',
      movieImbdRating: '8.1',
      movieType: 'Action',
      movieDescription:
          'Guardians of the Galaxy" is a Marvel superhero film directed by James Gunn, featuring a ragtag group of intergalactic misfits—Star-Lord, Gamora, Drax, Rocket, and Groot—who must unite to protect a powerful orb from falling into the wrong hands.'),
  MoviecardModel(
      backGroundImage: 'assets/images/titanic.png',
      movieTitile: 'The Titanic',
      movieImbdRating: '7.1',
      movieType: 'Romance',
      movieDescription:
          'Titanic" is a romantic disaster epic directed by James Cameron, depicting the ill-fated voyage of the RMS Titanic. The film intertwines the love story of Jack Dawson, played by Leonardo DiCaprio, and Rose DeWitt Bukater, portrayed by Kate Winslet.'),
  MoviecardModel(
      backGroundImage: 'assets/images/training-day.png',
      movieTitile: 'Training Day',
      movieImbdRating: '8.1',
      movieType: 'Action/Adventure',
      movieDescription:
          'The Training Day" is a gritty crime thriller starring Denzel Washington as corrupt narcotics detective Alonzo Harris, who takes rookie cop Jake Hoyt, played by Ethan Hawke, on a perilous 24-hour training mission through the streets of Los Angeles.'),
  MoviecardModel(
      backGroundImage: 'assets/images/harrypotter.png',
      movieTitile: 'Harry Potter',
      movieImbdRating: '9.0',
      movieType: 'Action/Adventure',
      movieDescription:
          'The Harry Potter series" is a beloved fantasy film franchise based on J.K. Rowlings novels, following the magical journey of a young wizard named Harry Potter, played by Daniel Radcliffe, and his friends Hermione Granger and Ron Weasley.'),
  MoviecardModel(
      backGroundImage: 'assets/images/imitationgame.jpg',
      movieTitile: 'Imitation Game',
      movieImbdRating: '8.0',
      movieType: 'War',
      movieDescription:
          'The Imitation Game" is a historical drama starring Benedict Cumberbatch as Alan Turing, a brilliant mathematician who leads a team to crack the Enigma code during World War II, saving countless lives.'),
  MoviecardModel(
      backGroundImage: 'assets/images/missionimpossible.png',
      movieTitile: 'Mission Impossible',
      movieImbdRating: '8.1',
      movieType: 'Action',
      movieDescription:
          'The Mission Impossible series" is a thrilling action franchise starring Tom Cruise as Ethan Hunt, a skilled IMF agent who undertakes daring undercover missions to thwart global threats. Known for its high-octane stunts, intricate plots.'),
  MoviecardModel(
      backGroundImage: 'assets/images/moonrisekingdom.png',
      movieTitile: 'Moonrise kingdom',
      movieImbdRating: '7.0',
      movieType: 'Action/Horror',
      movieDescription:
          'The Moonrise Kingdom" is a whimsical coming-of-age film directed by Wes Anderson, following two young lovers who run away from their New England town, sparking a search party and causing a stir among the quirky residents.'),
  MoviecardModel(
      backGroundImage: 'assets/images/nightcrawler.png',
      movieTitile: 'Night crawler',
      movieImbdRating: '8.1',
      movieType: 'Adventure',
      movieDescription:
          'The Nightcrawler" is a gripping thriller starring Jake Gyllenhaal as Lou Bloom, a driven and morally ambiguous freelance videographer who chases crime scenes in Los Angeles to sell footage to news stations. '),
  MoviecardModel(
      backGroundImage: 'assets/images/pulpfiction.png',
      movieTitile: 'Pulp Fiction',
      movieImbdRating: '6.9',
      movieType: 'Adventure',
      movieDescription:
          'Pulp Fiction" is a groundbreaking crime film directed by Quentin Tarantino, weaving interconnected stories of mobsters, hitmen, and small-time criminals in Los Angeles. Known for its non-linear narrative.'),
  MoviecardModel(
      backGroundImage: 'assets/images/quantumofsolace.png',
      movieTitile: 'Quantum Solace',
      movieImbdRating: '9.0',
      movieType: 'Action',
      movieDescription:
          'Quantum of Solace" is a James Bond film starring Daniel Craig as Agent 007, continuing the story from "Casino Royale." Bond seeks revenge for the death of his lover while uncovering a global conspiracy. '),
  MoviecardModel(
      backGroundImage: 'assets/images/ragingbull.png',
      movieTitile: 'Raging bull',
      movieImbdRating: '6.0',
      movieType: 'Adventure',
      movieDescription:
          'Raging Bull it is a biographical sports drama directed by Martin Scorsese, starring Robert De Niro as Jake LaMotta, a talented but self-destructive boxer whose turbulent life both in and out of the ring defines his career.'),
  MoviecardModel(
      backGroundImage: 'assets/images/rainman.png',
      movieTitile: 'Rain man',
      movieImbdRating: '6.7',
      movieType: 'Action',
      movieDescription:
          '"Rain Man" is a heartfelt drama starring Tom Cruise as Charlie Babbitt, who discovers his autistic savant brother Raymond, played by Dustin Hoffman, inherits their fathers fortune. Through a road trip across the United States.,'),
  MoviecardModel(
      backGroundImage: 'assets/images/rockybalboa.png',
      movieTitile: 'rocky balboa',
      movieImbdRating: '8.1',
      movieType: 'Action',
      movieDescription:
          '"Rocky Balboa" is a comeback sports drama starring Sylvester Stallone as the titular underdog boxer, now retired and facing personal loss. When given a chance to prove himself against the reigning champion.'),
  MoviecardModel(
      backGroundImage: 'assets/images/theexorcist.png',
      movieTitile: 'The Exorcist',
      movieImbdRating: '8.1',
      movieType: 'Action',
      movieDescription:
          '"The Exorcist" is a classic horror film directed by William Friedkin, based on the novel by William Peter Blatty. It follows the harrowing ordeal of a young girl possessed by a malevolent entity, and the desperate attempts. '),
  MoviecardModel(
      backGroundImage: 'assets/images/thegirlwiththedragontattoo.png',
      movieTitile: 'Dragon tattoo',
      movieImbdRating: '7.1',
      movieType: 'Action',
      movieDescription:
          '"The Girl with the Dragon Tattoo" is a gripping mystery thriller based on Stieg Larssons novel, featuring journalist Mikael Blomkvist and hacker Lisbeth Salander investigating a decades-old disappearance in Swedens elite circles.'),
  MoviecardModel(
      backGroundImage: 'assets/images/thesoundofmusic.png',
      movieTitile: 'Sound of music',
      movieImbdRating: '6.1',
      movieType: 'Action',
      movieDescription:
          '"The Sound of Music" is a beloved musical drama set in Austria during World War II, following Maria, a spirited young woman who becomes a governess to the seven children of a widowed naval captain. Through music and love.'),
];
