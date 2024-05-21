class UserDataModel {
  String? name;
  String? username;
  String? premiumplan;
  String? imageName;
  List? reviews = [];
  Set? usernames = {};

  UserDataModel({
    this.name,
    this.username,
    this.reviews,
    this.premiumplan,
    this.imageName,
    this.usernames,
  });
}

List<Map<String, dynamic>> getUserData() {
  List<Map<String, dynamic>> userdata = [];
  String name = '';
  String username = '';
  String premiumplan = '';
  String imageName = '';
  List reviews = [];
  Map<String, dynamic> user = {};
  user[username] = {
    username: {
      {name: 'Foram'},
      {imageName: ' '},
      {premiumplan: ''},
      {
        'reviews': [
          "2020 was a year full of difficult moments, none of these painful moments, however were as agonizing as the 90-minutes that one has to endure to get to the roll of credits of this sad-sad reboot of what otherwise would have been remembered as a Disney all-time favourite.",
          "The cinematography is absolutely gorgeous .Filming taking place in New Zealand and China. With a production budget of \$200 million, it is the most expensive film ever made by a female director. "
              "Excellent character development that leads with a strong new story line, delivering an amazing and fresh take on the original classic animated version while still making numerous iconic references!! (You’ll undoubtedly appreciate the subtle Easter eggs)."
              "I feel like this was one of Disney’s BEST movies to date! Let’s not forget that I grew up watching the Cartoon/Animated version of this so I felt there was a LOT to follow up to."
        ]
      }
    }
  };
  userdata.add(user);

  return userdata;
}
