import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

GridView{

    TableView {
        id:deviceTableView
        height: parent.height
        width: 200
        anchors.margins: 5
        anchors.fill: parent



        TableViewColumn {
            role: "date"    // Эти роли совпадают с названиями ролей в C++ модели
            title: "Date"
        }

        TableViewColumn {
            role: "time"    // Эти роли совпадают с названиями ролей в C++ модели
            title: "Time"
        }

        TableViewColumn {
            role: "random"  // Эти роли совпадают с названиями ролей в C++ модели
            title: "Random"
        }

        TableViewColumn {
            role: "message" // Эти роли совпадают с названиями ролей в C++ модели
            title: "Message"
        }
    }

     ToolSeparator {}

     TableView {
 //        id:deviceTableView
         height: parent.height
         width: parent.width - deviceTableView.width + 5
         anchors.margins: 5
         anchors.fill: parent



         TableViewColumn {
             role: "date"    // Эти роли совпадают с названиями ролей в C++ модели
             title: "Date"
         }

         TableViewColumn {
             role: "time"    // Эти роли совпадают с названиями ролей в C++ модели
             title: "Time"
         }

         TableViewColumn {
             role: "random"  // Эти роли совпадают с названиями ролей в C++ модели
             title: "Random"
         }

         TableViewColumn {
             role: "message" // Эти роли совпадают с названиями ролей в C++ модели
             title: "Message"
         }
     }

}

