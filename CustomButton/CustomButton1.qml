import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id:btnCustom
    radius: 5
    color: buttonColor
    clip: true
    width: parent.width * dpiToPixelValue
    height: baseButtonHeight
    signal clicked;
    property color buttonColor: baseColor
    property string buttonText: "Cập nhật"
    property color textColor: "white"
    property alias btnText: txtButtonText
    Text {
        id:txtButtonText
        text: buttonText
        color: textColor
        font.bold: true
        font.pointSize: 10
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
