import QtQuick 2.6
import QtQuick.Controls 2.1

TextArea {
    width: Math.max(implicitWidth, Math.min(implicitWidth * 3, pane.availableWidth / 3))
    anchors.horizontalCenter: parent.horizontalCenter

    wrapMode: TextArea.Wrap
    text: "TextArea\n...\n...\n..."
}
