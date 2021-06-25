import 'package:gsheets/gsheets.dart';
import 'package:taxonomy/model/taxonomymodel.dart';

const _credentials = r'''
{
  Your Json Credential
}
 ''';

const _spreadsheetId = 'Sheet ID';

class TaxosManager {
  final GSheets _gsheets = GSheets(_credentials);
  Spreadsheet _spreadsheet;
  Worksheet _taxosSheet;

  Future<void> init() async {
    _spreadsheet ??= await _gsheets.spreadsheet(_spreadsheetId);
    _taxosSheet ??= _spreadsheet.worksheetByTitle('Testi');
  }

  Future<List<Taxos>> getAll() async {
    await init();
    final products = await _taxosSheet.values.map.allRows();
    return products.map((json) => Taxos.fromGsheets(json)).toList();
  }
}
