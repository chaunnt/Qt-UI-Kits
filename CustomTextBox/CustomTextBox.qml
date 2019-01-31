import QtQuick 2.0
import QtQuick.Controls 2.0

TextField {
    height: baseButtonHeight
    property int textBoxRadius: 5 * dpiToPixelValue

    background: Rectangle{
        color: "transparent"
        radius: textBoxRadius
        border.color: baseColor
        border.width: 1
        anchors.fill: parent
    }
    font.pixelSize: normalFontSize
}
