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
                id: delDeviceButton
                width: 94
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                height: 15
                text: "Удалить"
                anchors.left: parent.left
                anchors.leftMargin: 0

            }

            Button{
                id: addDeviceButton
                x: 0
                width: 94
                anchors.bottom: parent.bottom
                anchors.top: parent.top

                height: 15
                text: "Добавить"
                anchors.right: parent.right
                anchors.rightMargin: 0
                onClicked: {
                            var component = Qt.createComponent("AddDevicePage.qml")
                            var window    = component.createObject(root)
                            window.show()
                }

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



     Dialog {
         id: addDevDialog
         width: 500
         height: 400

//         Calendar {
//                 id: calendar
//                 onDoubleClicked: dateDialog.click(StandardButton.Save)
//             }

         contentItem: Rectangle {
             id: mainConteiner
             color: "lightskyblue"
             property alias bottomRow: bottomRow
             width: 500
             height: 400



             // button row

             StackView {
                 id: navPane
                 height: 370
                 width: parent.width
                 anchors.bottom: bottomRow.top
                 anchors.top: parent.top
                 anchors.right: parent.right
                 focus: true
                 initialItem: pageses.get(2);
                 // ....




                 function pushOnePage(pageComponent) {
                     var page = push(pageComponent)
                     page.init()
                 }

                 function popOnePage() {
                     if(navPane.depth == 1) {
                         return
                     }
                     // check if target page already is on the stack
                     var targetIsUninitialized = false
                     if(!navPane.get(navPane.depth-2)) {
                         targetIsUninitialized = true
                     }
                     var page = pop()
                     if(targetIsUninitialized) {
                         navPane.currentItem.init()
                     }
                     // do cleanup from previous page
                     page.cleanup()
                 } // popOnePage




             } // navPane
Row {
    id: bottomRow
    width: parent.width
    height: 30
    anchors.bottom: parent.bottom
    // implicite fillWidth = true
    spacing: 20
    ButtonRaised {
        anchors.topMargin: 10
        text: "Назад"
        anchors.left: parent.left
        anchors.leftMargin: 100
        buttonColor: accentColor
        width: 80
        onClicked: {
            navPane.popOnePage()
        }
    }
    ButtonRaised {
        text: "Далее"
        anchors.right: parent.right
        anchors.rightMargin: 200
        anchors.topMargin: 10
        width: 80
        onClicked: {
            navPane.pushOnePage(pageTwo)
        }
    }
    ButtonRaised {
        anchors.topMargin: 10
        text: "Finish"
        anchors.right: parent.right
        anchors.rightMargin: 15
        width: 80
        onClicked: {
            navPane.goToPage(3)
        }
    }
}


ListModel{
    id:pageses
    Item{
        Text {
            id: name11
            text: qsTr("aaaaaaaaaaaaaaaaaaaaaaa")
        }
    }

    Item{
        Text {
            id: name22
            text: qsTr("bbbbbbbbbbbbbbbbbbbbbbbbbb")
        }
    }

    Item{
        Text {
            id: name33
            text: qsTr("cccccccccccccccccccccccccccc")
        }
    }
}









Component {
    id: pageOne
                 Rectangle {
                     Text {
                         id: name1
                         text: qsTr("11111111111111111111111111")
                     }
                 }
             } // pageTwo

             Component {
                 id: pageTwo
                 Rectangle {
                     Text {
                         id: name2
                         text: qsTr("222222222222222222222")
                     }
                 }
             } // pageTwo


             Component {
                 id: pageThree
                 Rectangle {
                     Text {
                         id: name3
                         text: qsTr("3333333333333333333333333")
                     }
                 }
             } // pageTwo


}









             }





}

