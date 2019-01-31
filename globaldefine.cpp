#include "globaldefine.h"
#include <QStandardPaths>
#include <QString>

QString CLOUD_HOST = "http://samplehost.com/api";

#ifdef Q_OS_WIN
QString STORAGE_PATH = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
QString LOGIN_INFO = STORAGE_PATH + "/Storage.xml";
#else
QString STORAGE_PATH = QStandardPaths::AppDataLocation + "\\resource\\xml\\";
QString LOGIN_INFO = STORAGE_PATH + "Storage.xml";
#endif
QString DBTYPE = "QSQLITE";
QString DBNAME_DATA_MANAGEMENT = "DataManagementDb";
QString DBFILENAME_EXTENSION = ".db";
QString DBFILENAME_DATA_MANAGEMENT = DBNAME_DATA_MANAGEMENT + DBFILENAME_EXTENSION;
QString DBCON_DATA_MANAGEMENT = DBNAME_DATA_MANAGEMENT;
QString DBTBL_DATA = "tblData";

QString PARAM_MARK = "?";
QString PARAM_TOKENKEY = "tokenKey=";
QString AND = "&";
QString DEFAULT_TEXT = "chưa cập nhật";
int DEFAULT_SELECTED_ID = -1;
int DEFAULT_INT_VALUE = -1;
#define DEBUG_MODE
