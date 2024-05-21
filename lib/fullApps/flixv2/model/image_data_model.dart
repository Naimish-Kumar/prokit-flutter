import '../utils/constants.dart';

class ImageDataModel {
  String? imageName;
  String? title;
  String? releaseYear;
  String? ratings;
  String? view;
  String? duration;
  String? about;
  List? genere = [];

  ImageDataModel({
    this.imageName,
    this.title,
    this.genere,
    this.releaseYear,
    this.duration,
    this.ratings,
    this.about,
    this.view,
  });
}

List<ImageDataModel> signInImageList = [
  ImageDataModel(
    imageName: FACEBOOK_LOGO,
  ),
  ImageDataModel(imageName: GOOGLE_LOGO),
  ImageDataModel(imageName: APPLE_LOGO),
];

List<ImageDataModel> getPoster() {
  List<ImageDataModel> posterList = [];
  posterList.add(
    ImageDataModel(
      imageName: MULAN_POSTER,
      title: 'Mulan',
      genere: ['Action', 'Drama', 'Adventure'],
      ratings: '4.5',
      view: '78.2m',
      releaseYear: '2021',
      about:
          'This retelling of the old Chinese folktale is about the story of a young Chinese maiden who learns that her weakened and lame father is to be called up into the army in order to fight the invading Huns. Knowing that he would never survive the rigours of war in his state, she decides to disguise herself and join in his place. Unknown to her, her ancestors are aware of this and to prevent it, they order a tiny disgraced dragon, Mushu to join her in order to force her to abandon her plan. He agrees, but when he meets Mulan, he learns that she cannot be dissuaded and so decides to help her in the perilous times ahead.',
      duration: '2h 49m',
    ),
  );
  posterList.add(
    ImageDataModel(
        title: 'A Quite Place',
        imageName: A_QUITE_PLACE,
        genere: [
          'Horror',
          'Drama',
        ],
        ratings: '4.9',
        releaseYear: '2019',
        about:
            "In a devastated Earth overrun by invincible predators of a possible extraterrestrial origin, the Abbotts are struggling to survive in the desolate urban jungle of New York City: a death trap defined by a new era of utter silence. Indeed, as noise attracts this new type of invader, even the slightest of sounds can be deadly. However, even though it's already been twelve months since the powerful monsters' first sightings, the resilient Abbott family still stands strong. In this muted dystopia, learning the rules of survival is crucial. And now, more than ever, the Abbotts must not make a sound.",
        view: '98.2m'),
  );
  posterList.add(
    ImageDataModel(
        title: 'Doctor Strange',
        imageName: DOCTOR_STRANGE,
        genere: [
          'Action',
          'Drama',
        ],
        ratings: '3.3',
        releaseYear: '2022',
        about:
            "Marvel's 'Doctor Strange' follows the story of the talented neurosurgeon Doctor Stephen Strange who, after a tragic car accident, must put ego aside and learn the secrets of a hidden world of mysticism and alternate dimensions. Based in New York City's Greenwich Village, Doctor Strange must act as an intermediary between the real world and what lies beyond, utilising a vast array of metaphysical abilities and artifacts to protect the Marvel Cinematic Universe",
        view: '32.2m'),
  );
  posterList.add(
    ImageDataModel(
        title: 'Oblivion',
        imageName: OBLIVION,
        genere: ['Thriller'],
        ratings: '4.3',
        releaseYear: '2018',
        about:
            "One of the few remaining drone repairmen assigned to Earth, its surface devastated after decades of war with the alien Scavs, discovers a crashed spacecraft with contents that bring into question everything he believed about the war, and may even put the fate of mankind in his hands.",
        view: '89k'),
  );
  return posterList;
}

List<ImageDataModel> getlatestMovies() {
  List<ImageDataModel> latestmoviesList = [];
  latestmoviesList.add(
    ImageDataModel(
      imageName: MULAN_POSTER,
      title: 'Mulan',
      genere: ['Action', 'Drama', 'Adventure'],
      ratings: '4.5',
      view: '78.2m',
      releaseYear: '2019',
      duration: '2h 49m',
      about:
          "This retelling of the old Chinese folktale is about the story of a young Chinese maiden who learns that her weakened and lame father is to be called up into the army in order to fight the invading Huns. Knowing that he would never survive the rigours of war in his state, she decides to disguise herself and join in his place. Unknown to her, her ancestors are aware of this and to prevent it, they order a tiny disgraced dragon, Mushu to join her in order to force her to abandon her plan. He agrees, but when he meets Mulan, he learns that she cannot be dissuaded and so decides to help her in the perilous times ahead.",
    ),
  );
  latestmoviesList.add(
    ImageDataModel(
      imageName: CAPTAIN_AMERICA_POSTER,
      title: 'Captain America',
      genere: ['Thriller', 'Drama', 'Adventure'],
      ratings: '2.3',
      view: '32.2k',
      releaseYear: '2017',
      about:
          "It is 1942, America has entered World War II, and sickly but determined Steve Rogers is frustrated at being rejected yet again for military service. Everything changes when Dr. Erskine recruits him for the secret Project Rebirth. Proving his extraordinary courage, wits and conscience, Rogers undergoes the experiment and his weak body is suddenly enhanced into the maximum human potential. When Dr. Erskine is then immediately assassinated by an agent of Nazi Germany's secret HYDRA research department (headed by Johann Schmidt, a.k.a. the Red Skull), Rogers is left as a unique man who is initially misused as a propaganda mascot; however, when his comrades need him, Rogers goes on a successful adventure that truly makes him Captain America, and his war against Schmidt begins.",
      duration: '2h 30m',
    ),
  );
  latestmoviesList.add(
    ImageDataModel(
      imageName: TITANIC_POSTER,
      title: 'Titanic',
      genere: ['Romantic', 'Drama', 'Adventure'],
      ratings: '3.9',
      view: '49.2m',
      releaseYear: '2020',
      duration: '2h 20m',
      about:
          "84 years later, a 100 year-old woman named Rose DeWitt Bukater tells the story to her granddaughter Lizzy Calvert, Brock Lovett, Lewis Bodine, Bobby Buell and Anatoly Mikailavich on the Keldysh about her life set in April 10th 1912, on a ship called Titanic when young Rose boards the departing ship with the upper-class passengers and her mother, Ruth DeWitt Bukater, and her fiancé, Caledon Hockley. Meanwhile, a drifter and artist named Jack Dawson and his best friend Fabrizio De Rossi win third-class tickets to the ship in a game. And she explains the whole story from departure until the death of Titanic on its first and last voyage April 15th, 1912 at 2:20 in the morning",
    ),
  );
  latestmoviesList.add(
    ImageDataModel(
      imageName: AVATAR_POSTER,
      title: 'Avatar',
      genere: ['Adventure', 'Thriller'],
      ratings: '4.2',
      view: '52.8k',
      releaseYear: '2019',
      duration: '2h 35m',
      about:
          "Jake Sully lives with his newfound family formed on the extrasolar moon Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na'vi race to protect their home.",
    ),
  );
  latestmoviesList.add(
    ImageDataModel(
      imageName: WAKANDA_VISION_POSTER,
      title: 'Wakanda Vision',
      genere: ['Thriller', 'Adventure'],
      ratings: '5',
      view: '82.3k',
      releaseYear: '2022',
      duration: '2h 30m',
      about:
          "Blends the style of classic sitcoms with the MCU, in which Wanda Maximoff and Vision - two super-powered beings living their ideal suburban lives - begin to suspect that everything is not as it seems",
    ),
  );
  latestmoviesList.add(
    ImageDataModel(
      imageName: STAR_WARS_POSTER,
      title: 'Star Wars',
      genere: ['Thriller'],
      ratings: '4.8',
      releaseYear: '2018',
      view: '118.1m',
      duration: '1h 30m',
      about:
          "While the First Order continues to ravage the galaxy, Rey finalizes her training as a Jedi. But danger suddenly rises from the ashes as the evil Emperor Palpatine mysteriously returns from the dead. While working with Finn and Poe Dameron to fulfill a new mission, Rey will not only face Kylo Ren once more, but she will also finally discover the truth about her parents as well as a deadly secret that could determine her future and the fate of the ultimate final showdown that is to come",
    ),
  );
  return latestmoviesList;
}
