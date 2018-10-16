import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Page {
    id: page
    property alias page: page

        TreeView {
            id:deviceChannelsThreeView
            width: 200
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.top: parent.top
            anchors.margins: 10

            TableViewColumn {
                    title: "Устройство::Канал"
                    role: "fileName"
                    width: 300
                }
    }


        ListView {
            id:channelInSet
            width: parent.width - 500
            opacity: 1
            anchors.topMargin: 5
            anchors.left: deviceChannelsThreeView.right
            anchors.leftMargin: 25
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.top: parent.top
            anchors.margins: 10
            model: TestModel{}
            delegate: Text {
                text: name + ": " + number
            }


        }

    Rectangle {
        id:spaceSets
        width: parent.width - 800
        anchors.left: channelInSet.right
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5

        Row {
            id: row
            height: 24
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Button {
                id: renView
                width: 60
                height: 24
                text: "Править"
                anchors.left: parent.left
                anchors.leftMargin: 0
                visible: true
            }

            Button {
                id: addView
                width: 50
                height: 24
                text: "Добавить"
                anchors.left: renView.right
                anchors.leftMargin: 3
                anchors.right: delView.left
                anchors.rightMargin: 3
            }

            Button {
                id: delView
                width: 60
                height: 24
                text: "Удалить"
                anchors.right: parent.right
                anchors.rightMargin: 0
            }
        }

        ListView {
            id:viewsList
            anchors.bottomMargin: 40
            anchors.topMargin: 28
            anchors.fill: parent
            model: TestModel{}
            delegate: Text {
                text: name + ": " + number
            }
        }
    }




}




/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:8;anchors_height:24;anchors_width:50}
D{i:9;anchors_height:24;anchors_width:50}D{i:10;anchors_height:24;anchors_width:50}
D{i:7;anchors_width:126;anchors_x:124}D{i:6;anchors_width:250}
}
 ##^##*/
