import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Page{
    id: view

    TableView {
        id:deviceTableView
        width: 200
        anchors.bottomMargin: 5
        anchors.rightMargin: 5
        anchors.leftMargin: 8
        currentRow: -1
        anchors.right: channelTableView.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 5



        TableViewColumn {
            role: "name"
            title: "Название устройства"
        }


    }


     TableView {
         id:channelTableView
         width: 300
         anchors.rightMargin: 5
         anchors.leftMargin: 200
         anchors.right: parent.right
         //  anchors.rightMargin: 203
         anchors.bottomMargin: 5
         anchors.topMargin: 5
        // anchors.leftMargin: 237
         anchors.left: deviceTableView.left
         anchors.bottom: parent.bottom
         anchors.top: parent.top
         anchors.margins: 5



         TableViewColumn {
             role: "name"
             title: "Имя"
         }

         TableViewColumn {
             role: "driver"
             title: "Time"
         }

         TableViewColumn {
             role: "random"
             title: "Random"
         }

         TableViewColumn {
             role: "message"
             title: "Message"
         }
     }

}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
