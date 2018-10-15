import QtQuick 2.6
import QtQuick.Controls 2.1

Page {
    id: page

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Item{
       id: firstItem
       Loader {
       // index 0
       id: pageOneLoader
       source: "DevicesPage.qml"
       anchors.fill: parent
       anchors.top: parent.top
       }
       }

       Item{
       id: secondItem
       Loader {
       // index 1
       id: pageSecondLoader
       source: "Page2.qml"
       anchors.fill: parent
       anchors.top: parent.top
       }
       }

       Item{
       id: thirdItem
       Loader {
       // index 2
       id: pageThirdLoader
       source: "Page3.qml"
       anchors.fill: parent
       anchors.top: parent.top
       }
       }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "First"
        }
        TabButton {
            text: "Second"
        }
        TabButton {
            text: "Third"
        }
    }
}
