import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Page{
    id: view

    Rectangle{
        id:overTableView
        width: 200
        anchors.bottomMargin: 5
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.right: channelTableView.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10

        Row{
            id:buttonRow
            height: 31
            spacing: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0


            Button{
                id: addDeviceButton
                width: 94
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                height: 15
                text: "Удалить"
                anchors.left: parent.left
                anchors.leftMargin: 0

            }

            Button{
                id: delDeviceButton
                x: 0
                width: 94
                anchors.bottom: parent.bottom
                anchors.top: parent.top

                height: 15
                text: "Добавить"
                anchors.right: parent.right
                anchors.rightMargin: 0
            }
        }

        TableView {
            id:deviceTableView
            x: 0
            width: 195
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 37


            TableViewColumn {
                role: "device"
                title: "Устройства"
            }

        }

    }



     TableView {
         id:channelTableView
         width: 300
         anchors.rightMargin: 5
         anchors.leftMargin: 200
         anchors.right: parent.right
         anchors.bottomMargin: 5
         anchors.topMargin: 5
         anchors.left: overTableView.left
         anchors.bottom: parent.bottom
         anchors.top: parent.top
         anchors.margins: 5



         TableViewColumn {
             role: "prop"
             title: "Свойство"
         }

         TableViewColumn {
             role: "value"
             title: "Значение"
         }

     }

}

