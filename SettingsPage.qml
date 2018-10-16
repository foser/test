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
       id: pageOneLoader
       source: "DevicesPage.qml"
       anchors.fill: parent
       anchors.top: parent.top
       }
       }

       Item{
       id: secondItem
       Loader {
       id: pageSecondLoader
       source: "ViewsPage.qml"
       anchors.fill: parent
       anchors.top: parent.top
       }
       }

       Item{
       id: thirdItem
       Loader {
       id: pageThirdLoader
       source: "PlacesPage.qml"
       anchors.fill: parent
       anchors.top: parent.top
       }
       }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: "Устройства"
        }
        TabButton {
            text: "Представления"
        }
        TabButton {
            text: "Точки"
        }
    }
}
