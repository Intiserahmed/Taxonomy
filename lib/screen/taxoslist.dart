import 'package:flutter/material.dart';
import 'package:taxonomy/controller/taxomanager.dart';
import 'package:taxonomy/model/taxonomymodel.dart';

class Taxonomy extends StatefulWidget {
  Taxonomy({Key key}) : super(key: key);

  @override
  _TaxonomyState createState() => _TaxonomyState();
}

class _TaxonomyState extends State<Taxonomy> {
  List<Taxos> taxos = [];
  @override
  void initState() {
    super.initState();
    TaxosManager().getAll().then((taxos) {
      setState(() {
        this.taxos = taxos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The @ Company Taxonomy"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: TaxoList(taxos: taxos),
    );
  }
}

class TaxoList extends StatelessWidget {
  const TaxoList({
    Key key,
    @required this.taxos,
  }) : super(key: key);

  final List<Taxos> taxos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taxos.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            tilePadding: EdgeInsets.all(15),
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: Text(
              taxos[index].brandname,
              style: TextStyle(fontSize: 18.0),
            ),
            childrenPadding:
                EdgeInsets.only(left: 15, top: 40, bottom: 90, right: 30),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${taxos[index].brandname} (${taxos[index].offering})",
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(taxos[index].headline,
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(taxos[index].description,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      "${taxos[index].brandname} (${taxos[index].offering}) comes from ${taxos[index].entity} [${taxos[index].type}]",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Available via: ${taxos[index].channels}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Pricing: ${taxos[index].pricing}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("More info can be found here ${taxos[index].assets}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Classified as ${taxos[index].marketcategory}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ],
              ),
            ],
          );
        });
  }
}
