class Taxos {
  const Taxos(
      {this.brandname,
      this.entity,
      this.type,
      this.offering,
      this.channels,
      this.pricing,
      this.assets,
      this.marketcategory,
      this.headline,
      this.description,
      this.access});

  final String brandname;
  final String entity;
  final String type;
  final String offering;
  final String channels;
  final String pricing;
  final String assets;
  final String marketcategory;
  final String headline;
  final String description;
  final String access;

  factory Taxos.fromGsheets(Map<String, dynamic> json) {
    return Taxos(
        brandname: json['Brand N/Ame (unique)'],
        entity: json['Entity'],
        type: json['Type'],
        offering: json['Offering'],
        channels: json['Channels'],
        pricing: json['Pricing'],
        assets: json['Assets (logos, webpages, etc.)'],
        marketcategory: json['Market Category'],
        headline: json['Headline (or following Tagline)'],
        description: json['Description (Brief)'],
        access: json['Access (public / private)']);
  }
}
