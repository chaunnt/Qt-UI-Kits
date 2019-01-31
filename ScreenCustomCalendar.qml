import QtQuick 2.0
import "CustomCalendar"

Item {
    Column{
        width: parent.width - 20 * dpiToPixelValue
        spacing: 10 * dpiToPixelValue
        x : 10 * dpiToPixelValue
        y: 10 * dpiToPixelValue
        CustomHorizontalCalendar{

        }

        HorizontalCalendar{
            heightListView: baseButtonHeight * 10
            widthListView: parent.width
        }
    }
}
