import 'dart:js' as JS;// Для вызова JavaScript функции ToFile();
import 'dart:io';// Используем класс File
import 'package:file/memory.dart';// Используем этот пакет для записи файла в память
import 'package:jobsearch_client/model/model.dart';
import 'package:pdf/pdf.dart' as PDF;// PDF.PdfPageFormat и др.
import 'package:pdf/widgets.dart' as PDF;// PDF.Document, PDF.Page и др.

class ResumePDF {
  CV _cv;
  final pdf = PDF.Document();
//TODO
  ResumePDF(this._cv){
    pdf.addPage(
      PDF.Page(
        pageFormat: PDF.PdfPageFormat.a4,
        build: (PDF.Context context) {
          return PDF.Center(
            child: PDF.Text("Hello World"),
          ); // Center
        }
      )
    );
  }

  downloadWEB() async {
    File file = MemoryFileSystem().file('resume.pdf')..writeAsBytesSync(pdf.save());
    JS.context.callMethod('ToFile', [file.readAsBytesSync()]);
  }

}