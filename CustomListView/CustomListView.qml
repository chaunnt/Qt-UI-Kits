import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    property int itemHeight : 200
    property var modelContentListView: ["red","red","red","red","red"]
    property string contendBoderColor: "gray"
    property int contendBoderWidth : 1
    property int contendBoderRadious : 10
    width: parent.width
    height: parent.height
    Flickable{
        width: parent.width
        height: parent.height
        interactive: true
        contentHeight: contentListView.height
        clip: true
        Flow{
            id: contentListView
            width: parent.width
            spacing: 5
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 10
            Repeater{
                model: modelContentListView  // modelData
                Rectangle{
                    id: recContent
                    width: (parent.width - 10) / 3
                    height: itemHeight
                    border.color: contendBoderColor
                    border.width: contendBoderWidth
                    radius: contendBoderRadious
                    clip: true
                    Image {
                       id: imgPoster
                       width: parent.width
                       height: parent.height * 3/4
                       fillMode: Image.PreserveAspectFit
                       source: "qrc:/resource/logo.png" // modelData.Poster
                   }
                    Text {
                        id: txtNameMovie
                        anchors.top: imgPoster.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        height: parent.height * 1/4
                        font.pointSize: 24
                        text: qsTr("name") // modelData.NameMovie
                    }
                }
            }
        }
    }


}
