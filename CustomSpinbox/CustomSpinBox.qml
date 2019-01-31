import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Item {
    // lock increment
    property bool isLockIncrement: false
    // Check if use for booking ticket or booking combo
    property bool isCombo: false
    // Background color for two button
    property color colorButton: "#f26c39"
    // Background color for value rect
    property color bgColorValue: "#f0f1f3"
    // Font size of value
    property int fontSize: 14 * dpiToPixelValue
    // Text color value
    property color colorValue: "#000000"
    // Text color of two button
    property color colorTextButton: "#ffffff"
    // Max value
    property int maxValue: 100
    // Font size text of Button
    property int fontSizeTextButton: 20 * dpiToPixelValue
    // Signal when value change
    signal valueChange(int value, bool state)

    property int maxWidth: isCombo ? 115 * dpiToPixelValue : 107 * dpiToPixelValue

    // init width
    width: isCombo ?  115 * dpiToPixelValue : 107 * dpiToPixelValue

    onWidthChanged: {
        width = width > maxWidth ? maxWidth : width
    }

    Component.onCompleted: {
        height = id_spinLayout.implicitHeight
    }

    QtObject {
        id: id_privateProps
        property int currentValue: 0

        // Change value when click button function
        function changeValue(isInCrement) {
            if (isCombo) {
                currentValue += 1
            } else if (isInCrement && currentValue < maxValue) {
                currentValue += 1
            } else if (!isInCrement && currentValue > 0) {
                currentValue -= 1
            }
            valueChange(currentValue, isInCrement)
            id_value.text = currentValue.toString()
        }
    }

    RowLayout {
        id: id_spinLayout
        anchors.fill: parent
        spacing: isCombo ? 5 * dpiToPixelValue : 1 * dpiToPixelValue

        // Decrement button
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            color: colorButton
            radius: width / 2
            Layout.alignment: Qt.AlignVCenter

            Text {
                anchors.centerIn: parent
                color: colorTextButton
                font.pixelSize: fontSizeTextButton
                font.bold: true
                text: qsTr("-")
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (id_privateProps.currentValue > 0) {
                        id_privateProps.changeValue(false)
                    }
                }
            }
        }

        // Value rect
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: width
            Layout.alignment: Qt.AlignVCenter
            Rectangle {
                width: isCombo ? parent.width * 0.75 : parent.width * 0.9
                anchors.centerIn: parent
                height: width
                color: bgColorValue
                radius: 5 * dpiToPixelValue
                Text {
                    id: id_value
                    font.pixelSize: fontSize
                    color: colorValue
                    anchors.centerIn: parent
                    text: qsTr(id_privateProps.currentValue.toString())
                }
            }
        }

        // Increment button
        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: width
            color: colorButton
            radius: width / 2
            Layout.alignment: Qt.AlignVCenter
            Text {
                anchors.centerIn: parent
                color: colorTextButton
                font.pixelSize: fontSizeTextButton
                font.bold: true
                text: qsTr("+")
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (!isLockIncrement && id_privateProps.currentValue < maxValue) {
                       id_privateProps.changeValue(true)
                    }
                }
            }
        }
    }
}
