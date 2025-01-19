import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Effects

Rectangle {
    id: root

    property alias text: input.text
    property alias placeholder: input.placeholderText
    property alias echoMode: input.echoMode
    property alias input: input
    property color accentColor: "#2196F3"

    signal accepted()

    width: 200
    height: 40
    radius: 4
    color: "white"
    border.color: input.activeFocus ? accentColor : "#E0E0E0"
    border.width: 1

    TextField {
        id: input
        anchors.fill: parent
        anchors.margins: 1

        color: "#212121"
        font.pixelSize: 14

        background: null

        leftPadding: 8
        rightPadding: 8

        verticalAlignment: TextInput.AlignVCenter

        selectByMouse: true
        selectedTextColor: "white"
        selectionColor: root.accentColor

        onAccepted: root.accepted()
    }

    layer.enabled: input.activeFocus
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowColor: Qt.rgba(root.accentColor.r, root.accentColor.g, root.accentColor.b, 0.2)
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 0
        shadowBlur: 8
    }
}