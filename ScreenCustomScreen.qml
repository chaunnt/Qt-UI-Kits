import QtQuick 2.0
import "CustomScreen"

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
                CustomYoutubeVideoPlayer{
                    width: parent.width
                    clip: true
                }
            }
            Rectangle{
                width: parent.width
                height: flkContent.height
                CustomIntroductionWithVideo{
                    width: parent.width
                    height: parent.height
                }
            }
        }
    }
}
