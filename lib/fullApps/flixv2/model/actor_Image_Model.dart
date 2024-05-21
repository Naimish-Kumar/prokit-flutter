class ActorImageModel {
  String? name;
  List? imageList = [];
  List? reviewsList = [];

  ActorImageModel({this.name, this.imageList});
}

List<ActorImageModel> getActorsImageList() {
  List<ActorImageModel> actorImageList = [];
  actorImageList.add(ActorImageModel(name: 'Hirthik Roshan', imageList: []));
  actorImageList.add(ActorImageModel(name: ''));
  actorImageList.add(ActorImageModel());
  actorImageList.add(ActorImageModel());
  actorImageList.add(ActorImageModel());
  actorImageList.add(ActorImageModel());

  return actorImageList;
}
