import QtQuick 2.0
import "CustomListView"

Item {
    Rectangle{
        anchors.fill: parent
        color: "black"
    }

    Flickable{
        id:flkContent
        anchors.fill: parent
        clip: true
        contentHeight: colContent.implicitHeight
        Column{
            id:colContent
            width: parent.width - 20 * dpiToPixelValue
            spacing: 20 * dpiToPixelValue
            x : 10 * dpiToPixelValue
            Rectangle{
                width: parent.width
                height: flkContent.height
                CustomListView{
                    width: parent.width
                    height: parent.height
                    clip: true
                }
            }
            Rectangle{
                width: parent.width
                height: flkContent.height
                CustomBookingList{
                    width: parent.width
                    height: parent.height
                }
            }

            Rectangle{
                width: parent.width
                height: flkContent.height
                CustomComboBookingList{
                    width: parent.width
                    height: parent.height
                    clip: true
                }
            }

            Rectangle{
                width: parent.width
                height: baseButtonHeight * 4
                CustomBookingDetail{
                    heightBookingDetail: baseButtonHeight * 4
                    widthBookingDetail: parent.width
                }
            }
        }
    }
}
