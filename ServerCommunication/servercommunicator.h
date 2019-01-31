#ifndef SERVERCOMMUNICATOR_H
#define SERVERCOMMUNICATOR_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QEventLoop>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

#include <QDebug>

#include "globaldefine.h"
#include "Model/simpledata.h"

class ServerCommunicator : public QObject
{
    Q_OBJECT
public:
    QString TokenKey = "";
    explicit ServerCommunicator(QObject *parent = nullptr);
    QNetworkAccessManager* m_serverAccessManager;

    void sampleGetAPI();
    QByteArray samplePostAPI(QObject *newData);
    void getLookupDatas();

signals:
    void sampleGetAPIResponsed(QNetworkReply* newResponse);
    void samplePostAPIResponsed(QNetworkReply* newResponse);
private slots:
    void serverResponse(QNetworkReply* newResponse);
private:
    QByteArray executeGETrequest(QNetworkRequest newRequest, bool isHaveToWait = false);
    QByteArray executePOSTrequest(QNetworkRequest newRequest, QByteArray newBodyData, bool isHaveToWait = false);
};

#endif // SERVERCOMMUNICATOR_H
