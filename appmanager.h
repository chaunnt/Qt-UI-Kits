#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QObject>
#include <QTimer>
#include <QDebug>
#include <QVariant>
#include <QFile>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>
#include <QStandardPaths>
#include <QEventLoop>

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

#include "globaldefine.h"
#include "ServerCommunication/servercommunicator.h"
#include "DBCommunication/dbcommunicator.h"
class AppManager : public QObject
{
    Q_OBJECT
    ServerCommunicator* m_serverCommunicator;
    DBCommunicator *m_dbCommunicator;
public:
    explicit AppManager(QObject *parent);
    AppManager();

    Q_INVOKABLE bool changePassword(QString strOldPwd, QString strNewPwd, QString strConfirmPwd);
    Q_INVOKABLE bool forgotPassword(QString strEmail);
    Q_INVOKABLE bool loginUser(QString strEmail, QString strPwd);
    Q_INVOKABLE bool registerUser(QString strNumber, QString strPwd);
    Q_INVOKABLE bool autoLogin();
    Q_INVOKABLE bool startupApplication();
    Q_INVOKABLE bool logout();

    void saveLoginInfo(QString strEmail, QString strPassword);
    void getLoginInfo(QString &strEmail, QString &strPassword);
    void sampleCallAPI();
signals:

    void serverError(QString errorMessage);
public slots:
};

#endif // APPMANAGER_H
