class PlanetModel {
  String? name, description, img, land;
  dynamic mass, radius, period, distance_light_year, semi_major_axis;
  int? temperature, host_star_mass, host_star_temperature;

  PlanetModel(
      {this.name,
      this.description,
      this.land,
      this.img,
      this.mass,
      this.radius,
      this.period,
      this.semi_major_axis,
      this.temperature,
      this.distance_light_year,
      this.host_star_mass,
      this.host_star_temperature});

  factory PlanetModel.mapToModel(Map m1) {
    return PlanetModel(
      name: m1['name'],
      description: m1['description'],
      land: m1['land'],
      img: m1['img'],
      mass: m1['mass'],
      radius: m1['radius'],
      period: m1['period'],
      semi_major_axis: m1['semi_major_axis'],
      temperature: m1['temperature'],
      distance_light_year: m1['distance_light_year'],
      host_star_mass: m1['host_star_mass'],
      host_star_temperature: m1['host_star_temperature'],
    );
  }
}
