import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../components" as Components

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: "QML Components Demo"

    // Use colors from ThemeManager
    color: themeManager.backgroundColor

    header: Rectangle {
        color: themeManager.darkMode ? "#424242" : "white"
        height: 32

        layer.enabled: true

        TabBar {
            id: tabBar
            width: parent.width
            height: parent.height
            position: TabBar.Header

            background: Rectangle {
                color: "transparent"
            }

            TabButton {
                id: homeTab
                text: "Home"
                height: parent.height

                background: Rectangle {
                    color: "transparent"
                }

                contentItem: Text {
                    text: homeTab.text
                    font.pixelSize: 14
                    color: homeTab.checked ? themeManager.accentColor : themeManager.textColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Rectangle {
                    width: parent.width
                    height: 2
                    color: themeManager.accentColor
                    anchors.bottom: parent.bottom
                    visible: homeTab.checked
                }
            }

            TabButton {
                id: settingsTab
                text: "Settings"
                height: parent.height

                background: Rectangle {
                    color: "transparent"
                }

                contentItem: Text {
                    text: settingsTab.text
                    font.pixelSize: 14
                    color: settingsTab.checked ? themeManager.accentColor : themeManager.textColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Rectangle {
                    width: parent.width
                    height: 2
                    color: themeManager.accentColor
                    anchors.bottom: parent.bottom
                    visible: settingsTab.checked
                }
            }
        }
    }

    StackLayout {
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        // Home Page
        Page {
            padding: 20
            background: Rectangle {
                color: "transparent"
            }

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20

                Components.ColorPicker {
                    Layout.alignment: Qt.AlignHCenter
                    size: 250
                    onColorSelected: function(selectedColor) {
                        themeManager.accentColor = selectedColor
                    }
                }

                Components.MyInput {
                    id: input
                    Layout.preferredWidth: 250
                    placeholder: "Enter your name"
                    onAccepted: console.log("Input accepted:", text)
                    accentColor: themeManager.accentColor
                }

                Components.MyButton {
                    id: colorButton
                    Layout.alignment: Qt.AlignHCenter
                    text: "Colored Button"
                    color: themeManager.accentColor
                }
            }
        }

        // Settings Page
        Settings {

        }
    }
}