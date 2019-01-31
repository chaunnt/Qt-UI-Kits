import QtQuick 2.0
import QtMultimedia 5.8
import QtWebView 1.1

Rectangle {
    width: parent.width
    height: parent.height
    property string textNameMovie: "ĐƯỜNG VỀ NHÀ CỦA CÚN CON"
    property string textPoint: "8"
    property string textyear: "2019"
    property string textKind: "Hài-Gia đình-tình cảm"
    property string textMinute: "102"
    property string textDescribe: "Phim chính là hành trình đầy gian nan và vô cùng cảm động nhằm tìm về với chủ của một chú cún đi lạc.Bella là một cô cún được Lucas nhận nuôi từ bé. Có thể nói, cả hai có mối quan hệ rất thân thiết. Cho đến một ngày, vì mải mê đuổi theo một chú sóc mà Bella đã đi lạc. Lo rằng Lucas không thấy mình sẽ cô đơn và buồn bã, Bella bất chấp mọi hiểm nguy, khó khăn để tìm đường về nhà bằng được. "
    property string textDateTime: "10/11/2007"
    property string textDate: "Ngày Chiếu:"

    property int textTopMargin: 10

    property alias nameMovie: txtNameMovie
    property alias describe: txtDescribe
    property alias dateTime: txtDateTime
    property alias date: txtDate
    property int desHeight: 50

    CustomYoutubeVideoPlayer{
        id:recyoutube
    }
    Text {
        id: txtNameMovie
        anchors.top: recyoutube.bottom
        anchors.topMargin: textTopMargin
        wrapMode: Text.WordWrap
        font.bold: true
        font.pointSize: 12
        text: qsTr(textNameMovie)
    }
    Row
    {
        id: infoMovie
        anchors.top : txtNameMovie.bottom
        anchors.topMargin: textTopMargin
        spacing: 5
        Image {
            id: imgAge
            width: 20
            height: 10
            source: "qrc:/resource/AppLogo.png"
        }
        Image {
            id: imgStar
            width: 5
            height: 5
            source: "qrc:/resource/Home_White.png"
        }
        Text {
            id: txtPoint
            wrapMode: Text.WordWrap
            font.bold: true
            text: qsTr(textPoint+"/10")
        }
        Text {
            id: txtYear
            wrapMode: Text.WordWrap
            text: qsTr(textyear)
        }
        Text {
            id: txtKindMovie
            wrapMode: Text.WordWrap
            text: qsTr(textKind)
        }
        Text {
            id: txtTimeMovie
            wrapMode: Text.WordWrap
            text: qsTr(textMinute + " Phút")
        }
    }
    Text {
        id: txtDescribe
        anchors.top: infoMovie.bottom
        anchors.topMargin: textTopMargin
        wrapMode: Text.WordWrap
        text: qsTr(textDescribe)
        elide:Text.ElideRight
        height: desHeight
        width: parent.width
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(txtDescribe.height < txtDescribe.implicitHeight)
                    txtDescribe.height = txtDescribe.implicitHeight;
                else
                    txtDescribe.height = desHeight
            }
        }
    }
    Row{
        anchors.top: txtDescribe.bottom
        anchors.topMargin: textTopMargin
        spacing: 5
        Text {
            id: txtDateTime
            wrapMode: Text.WordWrap
            font.bold: true
            text: qsTr(textDate)
        }
        Text {
            id: txtDate
            wrapMode: Text.WordWrap
            font.bold: true
            text: qsTr(textDateTime)
        }
    }
}
