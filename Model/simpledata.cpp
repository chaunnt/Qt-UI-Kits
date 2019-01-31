#include "simpledata.h"

SimpleData::SimpleData(QObject *parent) : QObject(parent)
{

}

SimpleData::SimpleData(int nDataID, QString strDataName, QString strDisplayName, int nParentID)
{
    m_dataId = nDataID;
    m_dataDisplayName = strDisplayName;
    m_dataName = strDataName;
    m_dataParentId = nParentID;
}

int SimpleData::dataId()
{
    return m_dataId;
}

QString SimpleData::dataName()
{
    return m_dataName;
}

QString SimpleData::dataDisplayName()
{
    return m_dataDisplayName;
}

int SimpleData::dataParentId()
{
    return m_dataParentId;
}

void SimpleData::setDataId(int newValue)
{
    if(m_dataId != newValue){
        m_dataId= newValue;
        emit dataChanged();
    }
}

void SimpleData::setDataName(QString newValue)
{
    if(m_dataName != newValue){
        m_dataName= newValue;
        emit dataChanged();
    }
}

void SimpleData::setDataParentId(int newValue)
{
    if(m_dataParentId != newValue){
        m_dataParentId= newValue;
        emit dataChanged();
    }
}

void SimpleData::setDataDisplayName(QString newValue)
{
    if(m_dataDisplayName != newValue){
        m_dataDisplayName= newValue;
        emit dataChanged();
    }
}
