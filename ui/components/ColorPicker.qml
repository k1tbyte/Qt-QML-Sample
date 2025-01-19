import QtQuick
import QtQuick.Effects

Rectangle {
    id: root

    property color selectedColor: "#2196F3"
    property int size: 200
    property bool expanded: false

    signal colorSelected(color newColor)

    width: size
    height: size
    radius: width / 2
    color: "transparent"
    border.color: "#E0E0E0"
    border.width: 1

    property var colors: [
        "#F44336", "#E91E63", "#9C27B0", "#673AB7",
        "#3F51B5", "#2196F3", "#03A9F4", "#00BCD4",
        "#009688", "#4CAF50", "#8BC34A", "#CDDC39"
    ]

    Rectangle {
        id: centerCircle
        width: root.width * 0.3
        height: width
        radius: width / 2
        color: root.selectedColor
        anchors.centerIn: parent

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#80000000"
            shadowHorizontalOffset: 0
            shadowVerticalOffset: 0
            shadowBlur: 8
        }

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.expanded = !root.expanded
        }
    }

    Repeater {
        model: colors.length

        Rectangle {
            id: colorItem
            width: root.width * 0.15
            height: width
            radius: width / 2
            color: colors[index]
            visible: root.expanded || distance > 0

            property real angle: (index * 360 / colors.length) * (Math.PI / 180)
            property real distance: root.expanded ? root.width * 0.35 : 0

            x: root.width/2 - width/2 + Math.cos(angle) * distance
            y: root.height/2 - height/2 + Math.sin(angle) * distance

            Behavior on distance {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.OutBack
                }
            }

            scale: colorMouseArea.containsMouse ? 1.2 : 1
            Behavior on scale {
                NumberAnimation { duration: 100 }
            }

            MouseArea {
                id: colorMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    root.selectedColor = colors[index]
                    root.expanded = false
                    root.colorSelected(colors[index])
                }
            }

            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: "#80000000"
                shadowHorizontalOffset: 0
                shadowVerticalOffset: 0
                shadowBlur: 4
            }
        }
    }
}