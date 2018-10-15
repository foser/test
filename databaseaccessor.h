#ifndef DATABASEACCESSOR_H
#define DATABASEACCESSOR_H
#include <QString>
//#include <QtSql/QSqlDatabase>
#include <QObject>
#include <QSqlDatabase>
#include <QStringList>
#include <QSqlQuery>
#include <QSqlQueryModel>

class DatabaseAccessor:public QObject
{
    Q_OBJECT
public:
     DatabaseAccessor(QString host, QString db, QString usr, QString pwd);
     void AddDevice(QString name,int type,QString addr);
     void DeleteDevices(QList<QString>);
     //QSqlRecord GetDevice();
     QSqlQueryModel* GetDevices();

private slots:
    void executeSqlQuery(QString);

private:
    QSqlDatabase db;
    QString dbHost;
    QString dbName;
    QString dbUser;
    QString dbPass;
    QSqlQuery query;

    QSqlQueryModel *model;

    QStringList GetAllTables();

    void AddServer();
    void DeleteServer(int);


    void AddChannel();
    void DeleteChennel(int);

};

#endif // DATABASEACCESSOR_H
