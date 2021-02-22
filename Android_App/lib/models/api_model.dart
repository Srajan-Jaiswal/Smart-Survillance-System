class Crime {

  String location;
  String crowddensity;
  String traffic;
  String rise;
 

  Crime(
    this.location,
    this.crowddensity,
    this.traffic,
    this.rise,
  );

     Crime.fromJson(Map<String, dynamic> json) {
      location = json['location'];
      crowddensity = json['crowddensity'];
      traffic = json['traffic'];
      rise = json['rise'];
  }

}