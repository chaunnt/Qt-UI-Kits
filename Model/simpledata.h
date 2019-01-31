#ifndef SIMPLEDATA_H
#define SIMPLEDATA_H

#include <QObject>

class SimpleData : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(int dataId READ dataId WRITE setDataId NOTIFY dataChanged)
    Q_PROPERTY(int dataParentId READ dataParentId WRITE setDataParentId NOTIFY dataChanged)
    Q_PROPERTY(QString dataName READ dataName WRITE setDataName NOTIFY dataChanged)

    int m_dataId;
    int m_dataParentId;
    QString m_dataName;
    QString m_dataDisplayName;
public:
    explicit SimpleData(QObject *parent = nullptr);
    SimpleData(int nDataID, QString strDataName, QString strDisplayName, int nParentID);
    int dataId();
    int dataParentId();
    QString dataName();
    QString dataDisplayName();

    void setDataId(int newValue);
    void setDataName(QString newValue);
    void setDataParentId(int newValue);
    void setDataDisplayName(QString newValue);
signals:
    void dataChanged();
public slots:
};

#endif // SIMPLEDATA_H
