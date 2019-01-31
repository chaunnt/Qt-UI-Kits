#include "servercommunicator.h"
static QString SAMPLE_POST_API = "/api/samplepost";
static QString SAMPLE_GET_API = "/api/sampleget";

ServerCommunicator::ServerCommunicator(QObject *parent) : QObject(parent)
{
    m_serverAccessManager = new QNetworkAccessManager;
    connect(m_serverAccessManager, &QNetworkAccessManager::finished, this, &ServerCommunicator::serverResponse);
}

void ServerCommunicator::sampleGetAPI()
{
    qDebug() << Q_FUNC_INFO;
    QUrl url = QUrl(CLOUD_HOST + SAMPLE_GET_API + PARAM_MARK + PARAM_TOKENKEY + TokenKey);
    QNetworkRequest request;

    request.setUrl(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    executeGETrequest(request);
}

QByteArray ServerCommunicator::samplePostAPI(QObject *newData)
{
    qDebug() << Q_FUNC_INFO;
    QUrl url = QUrl(CLOUD_HOST + SAMPLE_POST_API + PARAM_MARK + PARAM_TOKENKEY + TokenKey);
    QNetworkRequest request;

    request.setUrl(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QString strTemp = "";
    QByteArray responseData = executePOSTrequest(request, strTemp.toUtf8(), true);
    return responseData;
}

QByteArray ServerCommunicator::executeGETrequest(QNetworkRequest newRequest, bool isHaveToWait)
{
    qDebug() << Q_FUNC_INFO;
    QByteArray responseData;
    if(isHaveToWait){
        QNetworkAccessManager tempNamLogin;
        QNetworkReply* newResponse = tempNamLogin.get(newRequest);
        QEventLoop tempLoop;
        connect(&tempNamLogin, SIGNAL(finished(QNetworkReply*)), &tempLoop, SLOT(quit()));
        tempLoop.exec();
        responseData = newResponse->readAll();

    }else{
        m_serverAccessManager->get(newRequest);
    }
    return responseData;
}

QByteArray ServerCommunicator::executePOSTrequest(QNetworkRequest newRequest, QByteArray newBodyData, bool isHaveToWait)
{
    qDebug() << Q_FUNC_INFO;
    QByteArray responseData;
    if(isHaveToWait){
        QNetworkAccessManager tempNamLogin;
        QNetworkReply* newResponse = tempNamLogin.post(newRequest, newBodyData);
        QEventLoop tempLoop;
        connect(&tempNamLogin, SIGNAL(finished(QNetworkReply*)), &tempLoop, SLOT(quit()));
        tempLoop.exec();
        responseData = newResponse->readAll();
    }else{
        m_serverAccessManager->post(newRequest, newBodyData);
    }
    return responseData;
}

void ServerCommunicator::serverResponse(QNetworkReply *newResponse)
{
    qDebug() << Q_FUNC_INFO;
    QString responseUrl = newResponse->request().url().toString();
    if(responseUrl.contains(SAMPLE_POST_API)){
        emit samplePostAPIResponsed(newResponse);
    }else if(responseUrl.contains(SAMPLE_GET_API)){
        emit sampleGetAPIResponsed(newResponse);
    }else{

    }
}
