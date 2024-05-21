import '../utils/constants.dart';

class ActorDataModel {
  String? imageName;
  String? title;
  String? about;
  List<String>? workAs = [];
  List<String>? imageList = [];

  ActorDataModel({this.title, this.imageName, this.about, this.workAs, this.imageList});
}

List<ActorDataModel> getActorsDetail() {
  List<ActorDataModel> actorsDetails = [];
  actorsDetails.add(ActorDataModel(
      title: 'Hrithik Roshan',
      imageName: ACTOR_HRITHIK_ROSHAN,
      workAs: ['Actor', 'Producer', 'Director'],
      imageList: [ACTOR_HR1, ACTOR_HR2, ACTOR_HR3, ACTOR_HR4, ACTOR_HR5, ACTOR_HR6, ACTOR_HR7],
      about:
          '''Hrithik Roshan is an Indian actor, born on 10th January 1974, well known globally for his versatile roles, unmatchable dancing skills and attractive looks.After having appeared in films as a child actor in the 1980s, Roshan made his film debut in a leading role in Kaho Naa... Pyaar Hai (2000) for which he earned Filmfare Awards for Best Actor and Best Male Debut. It was not just a new actor on the block, but a star was born. He became a romantic hero, an action hero and revolutionized the Hindi film industry in significant ways.'''));
  actorsDetails.add(ActorDataModel(
      title: 'Andrew Garfield',
      imageName: ACTOR_ANDREW_GARFIEL,
      workAs: [
        'Actor'
      ],
      imageList: [
        ACTOR_AG1,
        ACTOR_AG2,
        ACTOR_AG3,
        ACTOR_AG4,
        ACTOR_AG5,
        ACTOR_AG6,
        ACTOR_AG7,
        ACTOR_AG8,
        ACTOR_AG9,
        ACTOR_AG10
      ],
      about:
          '''Andrew Russell Garfield was born in Los Angeles, California, to a British mother, Lynn, and American father, Richard Garfield. When he was three, he moved to Surrey, U.K., with his parents and older brother. He is of English and Polish Jewish heritage. Andrew was raised in a middle class family, and attended a private school, the City of London Freemen's School. He began acting in youth theatre productions while he was still at school. At age 19, he went to the Royal Central School of Speech and Drama.'''));
  actorsDetails.add(ActorDataModel(
      title: 'Robert Downey Jr.',
      imageName: ACTOR_ROBERT_DOWNEY,
      workAs: [
        'Actor',
        'Director'
      ],
      imageList: [
        ACTOR_RBJ1,
        ACTOR_RBJ2,
        ACTOR_RBJ3,
        ACTOR_RBJ4,
        ACTOR_RBJ5,
        ACTOR_RBJ6,
        ACTOR_RBJ7,
        ACTOR_RBJ8,
        ACTOR_RBJ9,
        ACTOR_RBJ10,
        ACTOR_RBJ11,
        ACTOR_RBJ12
      ],
      about:
          '''Downey was born April 4, 1965 in Manhattan, New York, the son of writer, director and filmographer Robert Downey Sr. and actress Elsie Downey (née Elsie Ann Ford). Robert's father is of half Lithuanian Jewish, one quarter Hungarian Jewish, and one quarter Irish, descent, while Robert's mother was of English, Scottish, German, and Swiss-German ancestry. Robert and his sister, Allyson Downey, were immersed in film and the performing arts from a very young age, leading Downey Jr. to study at the Stagedoor Manor Performing Arts Training Center in upstate New York, before moving to California with his father following his parents' 1978 divorce.'''));
  actorsDetails.add(ActorDataModel(
      title: 'Emma Watson',
      imageName: ACTRESS_EMMA_WATSON,
      workAs: [
        'Actress',
        'Director',
        'Producer'
      ],
      imageList: [
        ACTRESS_EW1,
        ACTRESS_EW2,
        ACTRESS_EW3,
        ACTRESS_EW4,
        ACTRESS_EW5,
        ACTRESS_EW6,
        ACTRESS_EW7,
        ACTRESS_EW8,
        ACTRESS_EW9,
        ACTRESS_EW10,
        ACTRESS_EW11,
        ACTRESS_EW12,
        ACTRESS_EW13
      ],
      about:
          '''Emma Charlotte Duerre Watson was born in Paris, France, to British parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School. From the age of six, Emma knew that she wanted to be an actress and, for a number of years, she trained at the Oxford branch of Stagecoach Theatre Arts, a part-time theatre school where she studied singing, dancing and acting. By the age of ten, she had performed and taken the lead in various Stagecoach productions and school plays.'''));
  actorsDetails.add(ActorDataModel(
      title: 'Tom Holland',
      imageName: ACTOR_TOM_HOLLAND,
      workAs: ['Actor', 'Producer'],
      imageList: [ACTOR_TH1, ACTOR_TH2, ACTOR_TH3, ACTOR_TH4, ACTOR_TH5],
      about:
          '''Thomas Stanley Holland was born in Kingston-upon-Thames, Surrey, to Nicola Elizabeth (Frost), a photographer, and Dominic Holland (Dominic Anthony Holland), who is a comedian and author. His paternal grandparents were from the Isle of Man and Ireland, respectively. He lives with his parents and three younger brothers - Paddy and twins Sam and Harry. Tom attended Donhead Prep School. Then, after a successful eleven plus exam, he became a pupil at Wimbledon College. Having successfully completed his GCSEs, in September 2012 Tom started a two-year course in the BRIT School for Performing Arts & Technology notable for its numerous famous alumni.'''));
  actorsDetails.add(ActorDataModel(
      title: 'Chris Evans',
      imageName: ACTOR_CHRIS_EVANS,
      workAs: [
        'Actor',
        'Producer'
      ],
      imageList: [
        ACTOR_CE1,
        ACTOR_CE2,
        ACTOR_CE3,
        ACTOR_CE4,
        ACTOR_CE5,
        ACTOR_CE6,
        ACTOR_CE7,
        ACTOR_CE8,
        ACTOR_CE9,
        ACTOR_CE10,
        ACTOR_CE11,
        ACTOR_CE12,
        ACTOR_CE13
      ],
      about:
          '''Christopher Robert Evans is an American actor, film producer, and director. Evans began his acting career in typical fashion: performing in school productions and community theatre.
He was born in Boston, Massachusetts, the son of Lisa (Capuano), who worked at the Concord Youth Theatre, and G. Robert Evans III, a dentist. His uncle is former U.S. Representative Mike Capuano. Chris's father is of half German and half Welsh/English/Scottish ancestry, while Chris's mother is of half Italian and half Irish descent. He has an older sister, Carly Evans, and two younger siblings, a brother named Scott Evans, who is also an actor, and a sister named Shana Evans. '''));
  actorsDetails.add(ActorDataModel(
      title: 'Chris Hemsworth',
      imageName: ACTOR_CHRIS_HEMSWORTH,
      workAs: [
        'Actor'
      ],
      imageList: [
        ACTOR_CH1,
        ACTOR_CH2,
        ACTOR_CH3,
        ACTOR_CH4,
        ACTOR_CH5,
        ACTOR_CH6,
        ACTOR_CH7,
        ACTOR_CH8,
        ACTOR_CH9,
        ACTOR_CH10,
        ACTOR_CH11
      ],
      about:
          '''Christopher "Chris" Hemsworth was born on August 11, 1983 in Melbourne, Victoria, Australia to Leonie Hemsworth (née van Os), an English teacher & Craig Hemsworth, a social-services counselor. His brothers are actors, Liam Hemsworth & Luke Hemsworth; he is of Dutch (from his immigrant maternal grandfather), Irish, English, Scottish, and German ancestry. His uncle, by marriage, was Rod Ansell, the bushman who inspired the comedy film Crocodile Dundee (1986).
'''));
  return actorsDetails;
}
