#include "appmanager.h"

AppManager::AppManager(QObject *parent) : QObject(parent)
{

}

AppManager::AppManager(){
    m_serverCommunicator = new ServerCommunicator(this);
    m_dbCommunicator = new DBCommunicator(this);
}

bool AppManager::changePassword(QString strOldPwd, QString strNewPwd, QString strConfirmPwd)
{
    return true;
}

bool AppManager::forgotPassword(QString strEmail)
{
    return true;
}

bool AppManager::loginUser(QString strEmail, QString strPwd)
{
    return true;
}

bool AppManager::registerUser(QString strNumber, QString strPwd)
{
    return true;
}

bool AppManager::autoLogin()
{
    return false;
}

bool AppManager::startupApplication(){
    return true;
}

bool AppManager::logout()
{
    qDebug() << Q_FUNC_INFO;
    QFile file(LOGIN_INFO);
    qDebug() << "file: " << file.exists();
    if(file.exists()){
        file.remove();
    }
    qDebug() << "file: " << file.exists();
    return true;
}


void AppManager::saveLoginInfo(QString strEmail, QString strPassword)
{
    QFile file(LOGIN_INFO);

    if(!file.open(QIODevice::WriteOnly)){
        qDebug() << "saveLoginInfo fail";
        return;
    }

    QXmlStreamWriter xmlWriter(&file);
    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();
    xmlWriter.writeStartElement("LoginInfo");
    xmlWriter.writeTextElement("Email", strEmail);
    xmlWriter.writeTextElement("Password", strPassword);
    xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();

    file.close();
}

void AppManager::getLoginInfo(QString &strEmail, QString &strPassword)
{
    QFile file(LOGIN_INFO);

#ifdef DEBUG_MODE
    qDebug() << Q_FUNC_INFO;
#endif
    if( !file.open( QFile::ReadOnly | QFile::Text ) ) {
        qDebug() << file.fileName();
        return;
    }
    QXmlStreamReader xmlStream(&file);
    while(!xmlStream.atEnd())
    {
        xmlStream.readNext();
        if(xmlStream.isStartElement() && xmlStream.name() == "LoginInfo") {

            while(!xmlStream.atEnd())
            {
                xmlStream.readNext();
                QString keyValue = xmlStream.name().toString();
                if(xmlStream.isStartElement() == true){
                    if(keyValue == "Email"){
                        strEmail = xmlStream.readElementText();
                    }
                    else if(keyValue == "Password"){
                        strPassword = xmlStream.readElementText();
                    }
                }
            }
        }
    }

    file.close();
}
void AppManager::sampleCallAPI()
{
    qDebug() << Q_FUNC_INFO;
    m_serverCommunicator->sampleGetAPI();
    QObject::connect(m_serverCommunicator, &ServerCommunicator::sampleGetAPIResponsed, [=] (QNetworkReply *newResponse) {
        QObject::disconnect(m_serverCommunicator, &ServerCommunicator::sampleGetAPIResponsed, nullptr, nullptr);
        qDebug() << "getAllAssignedProvinceResponsed";
        QString tempNetworkResponse;
        if(newResponse->error() == QNetworkReply::NoError)
        {
            QByteArray arrayResponse = newResponse->readAll();
            qDebug() << "arrayResponse: " << arrayResponse;
            QJsonDocument jsDoc = QJsonDocument::fromJson(arrayResponse);
            QJsonArray jsArr = jsDoc.object().value("Data").toArray();
            if(jsArr.count() > 0){
                //TODO
            }
        }
        else
        {
            tempNetworkResponse = newResponse->errorString() + " | " + newResponse->readAll();
            qDebug() << tempNetworkResponse;
            emit serverError(newResponse->errorString());
        }
        qDebug() << "tempNetworkResponse: " << tempNetworkResponse;
    });
}
