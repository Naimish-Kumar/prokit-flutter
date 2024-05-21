class ExportDocumentsOptions {
  String? title;
  String? ext;
  String? size;

  ExportDocumentsOptions({this.title, this.ext, this.size});
}

List<ExportDocumentsOptions> exportScreenDocumentsOptionsList = [
  ExportDocumentsOptions(title: "Microsoft Word", ext: "(.docx)", size: "(456 KB)"),
  ExportDocumentsOptions(title: "Microsoft Excel", ext: "(.xlsx)", size: "(249 KB)"),
  ExportDocumentsOptions(title: "Microsoft PowerPoint", ext: "(.pptx)", size: "(563  KB)"),
  ExportDocumentsOptions(title: "Rich Text Format ", ext: "(.rtf)", size: "(53 KB)"),
];
List<ExportDocumentsOptions> exportScreenImagesOptionsList = [
  ExportDocumentsOptions(title: "Joint Photographic ... ", ext: "(.jpeg) ", size: "(800 KB)"),
  ExportDocumentsOptions(title: "Portable Network G...", ext: "(.png)", size: "(568 KB)"),
  ExportDocumentsOptions(title: "Graphics Interchange...", ext: "(.gif)", size: "(390  KB)"),
  ExportDocumentsOptions(title: "Tagged Image File ", ext: "(.tiff)", size: "(424 KB)"),
];
