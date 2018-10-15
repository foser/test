#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "radialbar.h"
#include "circlegauge.h"
#include <qqmlcontext.h>
#include <qqml.h>
#include <qqmlengine.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>
#include <QThread>
#include <QTimer>
#include <windows.h>
#include "databaseaccessor.h"
#include "settings.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<RadialBar>("CustomControls", 1, 0, "RadialBar");


    //Данные параметры используются QSettings для определения куда сохранять конфигурацию
    QCoreApplication::setOrganizationName("Ecros-Engineering");
    QCoreApplication::setApplicationName("Ingecros");

    QSettings settings(QString("config.cfg"));



    //Установка параметров:
    QFile config("config.cfg");
    config.open(QIODevice::ReadWrite);
    QByteArray fileData;
    fileData = config.readAll();
    Settings::setDefaults(fileData);

    //Устанавливаем параметры соединения с БД
   DatabaseAccessor *dbase = new DatabaseAccessor(Settings::get(Settings::DBHost).toString(),
                                 Settings::get(Settings::DBName).toString(),
                                 Settings::get(Settings::User).toString(),
                                 Settings::get(Settings::Password).toString());

    dbase->AddDevice("test",0,"192.168.179.113:8000");


    dbase->disconnect();

    QList<QObject*> dataList;
    dataList.append(new CircleGauge("Item 1", "red", qreal(12)));
    dataList.append(new CircleGauge("Item 2", "green", 22));
    dataList.append(new CircleGauge("Item 3", "blue", 59.058));
    dataList.append(new CircleGauge("Item 4", "yellow", 85.475));

    CircleGauge *ch3 = new CircleGauge("Item 5", "yellow", 3);

    dataList.append(ch3);



    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("dataModel", QVariant::fromValue(dataList));


    //Sleep(5000);
    ch3->setValue(99);



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}



