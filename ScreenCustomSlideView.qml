import QtQuick 2.0
import "CustomSlideView"

Item {
    Column{
        width: parent.width - 20 * dpiToPixelValue
        spacing: 10 * dpiToPixelValue
        x : 10 * dpiToPixelValue
        CustomSlideView{
            width: parent.width
            height: width / 3
        }
    }
}
