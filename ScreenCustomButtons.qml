import QtQuick 2.0
import "CustomButton"

Item {
    Column{
        width: parent.width - 20 * dpiToPixelValue
        spacing: 10 * dpiToPixelValue
        x : 10 * dpiToPixelValue
        y : 10 * dpiToPixelValue
        CustomButton{

        }

        CustomButton1{

        }
    }
}
