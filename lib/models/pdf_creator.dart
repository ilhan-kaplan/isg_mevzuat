
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isg_mevzuat/constants/colors.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {

  static Future<File> generateCenteredText(String kelime,String kanun_baslik,String genel_baslik,String alt_baslik, String madde) async {
    // making a pdf document to store a text and it is provided by pdf pakage
    final pdf = pw.Document();
    // Text is added here in center
    pdf.addPage(
      pw.MultiPage(
          theme: pw.ThemeData.withFont(
            bold: pw.Font.ttf(
              await rootBundle.load(
                "assets/fonts/OpenSans-Bold.ttf",
              ),
            ),
            base: pw.Font.ttf(
              await rootBundle.load(
                "assets/fonts/OpenSans-Regular.ttf",
              ),
            ),
          ),
        build: (context) => <pw.Widget>[
          pw.Row(
            children: [

            ]
          ),
          pw.Header(
            padding: pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(color:PdfColors.green),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('İSG Mevzuat Uygulaması',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 16)),
                  pw.Text('Aranan Kelime: ${kelime}',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 16)),
                ]
              )
          ),
          pw.Text(kanun_baslik.trim(),style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(genel_baslik.trim(),style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(alt_baslik.trim(),style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Paragraph(text: madde.trim()),
        ],
        footer: (context) {
            final text = 'Sayfa ${context.pageNumber} / ${context.pagesCount}';
            return pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('İSG Mevzuat Uygulaması',style: pw.TextStyle(color: PdfColors.black,fontWeight: pw.FontWeight.bold)),
                pw.Text(text,style: pw.TextStyle(color: PdfColors.black,fontWeight: pw.FontWeight.bold)),
              ]
            );

        },

      )
    );

    // passing the pdf and name of the docoment to make a direcotory in  the internal storage
    return saveDocument(name: '${kelime}.pdf', pdf: pdf);
  }

  // it will make a named dircotory in the internal storage and then return to its call
  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    // pdf save to the variable called bytes
    final bytes = await pdf.save();

    // here a beautiful pakage  path provider helps us and take dircotory and name of the file  and made a proper file in internal storage
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes.buffer.asUint8List());
    //await file.writeAsBytes(bytes);

    // reterning the file to the top most method which is generate centered text.
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}