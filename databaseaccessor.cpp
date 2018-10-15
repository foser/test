#include "databaseaccessor.h"
#include <QtSql>
//#include <QSqlDatabase>
#include <QUuid>

DatabaseAccessor::DatabaseAccessor(QString host, QString dataBase, QString usr, QString pwd)
{
    db =  QSqlDatabase::addDatabase("QPSQL7");
    db.setHostName(host);
    db.setDatabaseName(dataBase);
    if (db.open(usr, pwd))
       {
           qDebug("connected to database");
       }
    else
       {
           qDebug("Error occured in connection to database");
           qDebug() << db.lastError();
       }
}


void DatabaseAccessor::executeSqlQuery(QString query)
{

        QSqlQuery sqlQuery(query, db);
}

void DatabaseAccessor::AddServer()
{
    executeSqlQuery("INSERT INTO servers (name)"); //TODO
}

void DatabaseAccessor::AddDevice(QString name,int type,QString addr)
{
    QString strF = "INSERT INTO devices (id, name, type, addr) " "VALUES('%1', '%2', '%3', '%4');";
    QString str = strF.arg(QUuid::createUuid().toString(QUuid::WithoutBraces))
                      .arg (name)
                      .arg(type)
                      .arg(addr);
    qDebug() << str;
    executeSqlQuery(str);
}

void DatabaseAccessor::DeleteDevices(QList<QString> deviceToDelete)
{
    for (int i = 0; i <= deviceToDelete.length() ;i++) {
            QString strF = "DELETE FROM devices WHERE id = (id) " "VALUES('%1');";
            QString str = strF.arg(QString(deviceToDelete[i]));
            qDebug() << str;
            executeSqlQuery(str);

    }
}

QSqlQueryModel* DatabaseAccessor::GetDevices()
{
    model->setQuery("SELECT * FROM devices");
    return model;
}


