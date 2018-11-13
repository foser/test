import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Rectangle {
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
                 initialItem: pageOne
                 // ....
             } // navPane
Row {
    id: bottomRow
    width: parent.width
    height: 30
    anchors.bottom: parent.bottom
    // implicite fillWidth = true
    spacing: 20
    ButtonRaised {
        anchors.topMargin: 5
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
        anchors.topMargin: 5
        width: 80
        onClicked: {
            navPane.pushOnePage(pageThree)
        }
    }
    ButtonRaised {
        anchors.topMargin: 5
        text: "Finish"
        anchors.right: parent.right
        anchors.rightMargin: 15
        width: 80
        onClicked: {
            navPane.goToPage(5)
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



}




