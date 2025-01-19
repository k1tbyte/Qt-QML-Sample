import QtQuick
import QtQuick.Controls

Rectangle {
    id: root

    property string text: "Button"
    property color textColor: "white"

    signal clicked()

    opacity: mouseArea.pressed ? 0.8 : 1
    width: buttonText.width + 32
    height: 40
    radius: 4
    color: "#2196F3"

    Text {
        id: buttonText
        anchors.centerIn: parent
        text: root.text
        color: root.textColor
        font.pixelSize: 14
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 150
        }
    }
}