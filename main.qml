import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Universal 2.2
import Qt.labs.settings 1.0
import CustomControls 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Window 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: qsTr("IngecrosMonitoring")


    Shortcut {
        sequence: "Menu"
        onActivated: optionsMenu.open()
    }

    header: ToolBar {
        Material.foreground: "white"

        RowLayout {
            spacing: 15
            anchors.fill: parent

            ToolButton {
                icon.name: stackView.depth > 1 ? "back" : "drawer"
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
                        drawer.open()
                    }
                }
            }

            Label {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : "Информационная панель"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                icon.name: "menu"
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 4 * 1
        height: window.height
        interactive: stackView.depth === 1

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "Мониторинг"; source: "qrc:/MonitoringPage.qml" }
                ListElement { title: "Настройки"; source: "qrc:/SettingsPage.qml" }

                }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane
            spacing: 0

            Label {
                text: "Программа конфигурации газоаналитеческого оборудования компании ЗАО Экрос-Инжиниринг"
                anchors.margins: 20
                //anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                //anchors.bottom: arrow.top
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }

        }
    }






}
