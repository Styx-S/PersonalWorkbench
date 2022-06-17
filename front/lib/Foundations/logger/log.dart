part of foundations;

enum LogLevel {
  debug,
  info,
  warning,
}

class PWBLogger {
  static final PWBLogger _instance = PWBLogger._();
  static get logger => _instance;
  PWBLogger._();

  final formatter = intl.DateFormat("yy-MM-dd HH:mm:ss.ms");

  static void logD(String content, String? module) {
    logPWB(LogLevel.debug, content, module);
  }

  static void logI(String content, String? module) {
    logPWB(LogLevel.info, content, module);
  }

  static void logW(String content, String? module) {
    logPWB(LogLevel.warning, content, module);
  }


  static void logPWB(LogLevel level, String content, String? module) {
    PWBLogger.logger.log(level, module, content);
  }

  void log(LogLevel level, String? module, String content) {

    final levelStr = "[${level2String(level)}]";
    final moduleStr = module != null ? "[$module]" : "";
    final timeStr =  "[${formatter.format(DateTime.now())}]";
    final str = "$levelStr$moduleStr$timeStr$content";

    //TODO
    print(str);
  }

  static String level2String(LogLevel level) {
    switch(level) {
      case LogLevel.debug:
        return "DEBUG";
      case LogLevel.info:
        return "INFO";
      case LogLevel.warning:
        return "WARNING";
    }
  }
}

