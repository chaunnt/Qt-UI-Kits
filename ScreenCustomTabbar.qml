import QtQuick 2.0
import "CustomTabbar"

Item {
    Column{
        width: parent.width - 20 * dpiToPixelValue
        spacing: 10 * dpiToPixelValue
        x : 10 * dpiToPixelValue
        CustomTabBar{

        }
        CustomTabButton{
            widthTabBar: parent.width / 3
            heightTabBar: baseButtonHeight / 2
            listModelTabBar: ["button 1","button 2","button 3"]
        }
    }
}
