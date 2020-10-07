class Common {
  factory Common() => _getInstance();

  static Common get instance => _getInstance();
  static Common _instance; // Singleton object

  static Common _getInstance() {
    if (_instance == null) {
      _instance = Common._internal();
    }
    return _instance;
  }

  Common._internal();

  /////////////////////////////////////////////////////////////

  String rootPath; // root path

  String getFileSize(int fileSize) {
    String str = '';

    if (fileSize < 1024) {
      str = '${fileSize.toStringAsFixed(2)}B';
    } else if (1024 <= fileSize && fileSize < 1048576) {
      str = '${(fileSize / 1024).toStringAsFixed(2)}KB';
    } else if (1048576 <= fileSize && fileSize < 1073741824) {
      str = '${(fileSize / 1024 / 1024).toStringAsFixed(2)}MB';
    }

    return str;
  }

  String selectIcon(String ext) {
    String iconImg = 'assets/images/file_manager_assets/unknown.png';

    switch (ext) {
      case '.ppt':
      case '.pptx':
        iconImg = 'assets/images/file_manager_assets/ppt.png';
        break;
      case '.doc':
      case '.docx':
        iconImg = 'assets/images/file_manager_assets/word.png';
        break;
      case '.xls':
      case '.xlsx':
        iconImg = 'assets/images/file_manager_assets/excel.png';
        break;
      case '.jpg':
      case '.jpeg':
      case '.png':
        iconImg = 'assets/images/file_manager_assets/image.png';
        break;
      case '.txt':
        iconImg = 'assets/images/file_manager_assets/txt.png';
        break;
      case '.mp3':
        iconImg = 'assets/images/file_manager_assets/mp3.png';
        break;
      case '.mp4':
        iconImg = 'assets/images/file_manager_assets/video.png';
        break;
      case '.rar':
      case '.zip':
        iconImg = 'assets/images/file_manager_assets/zip.png';
        break;
      case '.psd':
        iconImg = 'assets/images/file_manager_assets/psd.png';
        break;
      default:
        iconImg = 'assets/images/file_manager_assets/file.png';
        break;
    }
    return iconImg;
  }
}
