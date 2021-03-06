import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import CustomControls 1.0


Rectangle {

    GridView {
        id: view
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        anchors.margins: 15
        cellHeight: 130
        cellWidth: 130
        model: dataModel
        clip: false
        delegate: Item {
            property var view: GridView.view
            property var isCurrent: GridView.isCurrentItem
            anchors.topMargin: 10
            anchors.leftMargin: 10
            height: view.cellHeight
            width: view.cellWidth


            PieMenu {
                id: pieMenu
                anchors.centerIn: parent
                z:1

                triggerMode: TriggerMode.TriggerOnRelease

                MenuItem {
                    //iconSource: "qrc:///D:/set.svg"
                    // iconName: "test"
                    text: "Action 1"
                    onTriggered: print("Action 1")

                }
                MenuItem {
                    text: "Action 2"
                    onTriggered: print("Action 2")
                }
                MenuItem {
                    text: "Action 3"
                    onTriggered: print("Action 3")
                }

            }



            RadialBar {
                anchors.centerIn: parent
                width: 100
                height: 100
                penStyle: Qt.RoundCap
                dialType: RadialBar.FullDial
                progressColor: "#2cf554"
                foregroundColor: "#E5E5E5"
                dialWidth: 10
                startAngle: 180
                spanAngle: 70
                minValue: 0
                maxValue: 100
                value: model.modelData.value
                textFont {
                    family: "Halvetica"
                    italic: false
                    pointSize: 10
                }
                suffixText: "ppm"
                textColor: "#000000"

                MouseArea {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    acceptedButtons: Qt.RightButton

                    onClicked: pieMenu.popup(mouseX, mouseY)
                }
            }


            //                      Slider{
            //                          id: controlValue
            //                          anchors.centerIn: parent
            //                          anchors.topMargin: parent
            //                          maximumValue: 100
            //                          width: 46
            //                          height: 22
            //                          anchors.verticalCenterOffset: 24
            //                          anchors.horizontalCenterOffset: 0
            //                          }

        }
    }
}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
