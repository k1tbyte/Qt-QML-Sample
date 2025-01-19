import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import "../components" as Components

Page {
    id: settingsPage
    padding: 20

    background: Rectangle {
        color: "transparent"
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Switch {
            text: "Dark Mode"
            checked: themeManager.darkMode
            onCheckedChanged: themeManager.darkMode = checked

            contentItem: Text {
                text: parent.text
                color: themeManager.textColor
                font.pixelSize: 14
                leftPadding: parent.indicator.width + parent.spacing
                verticalAlignment: Text.AlignVCenter
            }
        }

        Components.MyInput {
            Layout.preferredWidth: 250
            placeholder: "Setting 1"
            accentColor: themeManager.accentColor
        }

        Components.MyInput {
            Layout.preferredWidth: 250
            placeholder: "Setting 2"
            accentColor: themeManager.accentColor
        }

        Components.MyButton {
            Layout.alignment: Qt.AlignHCenter
            text: "Save Settings"
            color: themeManager.accentColor
            onClicked: themeManager.saveTheme()
        }
    }
}