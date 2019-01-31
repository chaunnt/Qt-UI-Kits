import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id:btnCustom
    radius: height / 2
    color: buttonColor
    clip: true
    width: txtButtonText.implicitWidth + 20 * dpiToPixelValue
    height: baseButtonHeight
    signal clicked;
    property color buttonColor: baseColor
    property string buttonText: "Button Text"
    property color textColor: "white"
    Text {
        id:txtButtonText
        text: buttonText
        color: textColor
        anchors.centerIn: parent
        font.pixelSize: normalFontSize
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            btnCustom.clicked()
        }
    }
}
