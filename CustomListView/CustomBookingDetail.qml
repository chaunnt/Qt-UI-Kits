import QtQuick 2.0

Item {
    property int heightBookingDetail: 0
    property int widthBookingDetail: 0
    property string imageBookingDetail: "qrc:/resource/cualaivobau.jpg"
    property string titleBookingDetail: "A Dog's Way Home"
    property string addressBookingDetail: "Galaxy Nguyen Van Qua"
    property string dateBookingDetail: "15/01/2019"
    property string hourBookingDetail: "19:00"
    property string room: "P5"
    property string seat: ""

    Rectangle{
        id:recBookingDetail
        height: heightBookingDetail
        width: widthBookingDetail
        Image {
            id: imgBookingDetail
            source: imageBookingDetail
            height: parent.height * 0.8
            width: parent.width/7
            anchors.top: parent.top
            x:5
        }
        Text {
            id: txtTittle
            text: qsTr(titleBookingDetail)
            font.pixelSize: 15
            font.bold: true
            x:imgBookingDetail.width + 10
            y: parent.height/15
        }
        Image {
            id: iconAddress
            source: "qrc:/resource/icons8-address-32.png"
            x:imgBookingDetail.width + 15
            height: parent.height/7
            width: parent.width/18
            anchors.top:txtTittle.bottom
            anchors.topMargin: 5
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: txtAddress
            text: qsTr(addressBookingDetail)
            font.pixelSize: 13
            x:imgBookingDetail.width + iconAddress.width + 20
            anchors.top:txtTittle.bottom
            anchors.topMargin: 5
        }
        Image {
            id: iconDate
            source: "qrc:/resource/icons8-clock-32.png"
            x:imgBookingDetail.width + 15
            height: parent.height/7
            width: parent.width/18
            anchors.top:txtAddress.bottom
            anchors.topMargin: 5
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: txtDate
            text: dateBookingDetail+" - "+hourBookingDetail
            font.pixelSize: 13
            x:imgBookingDetail.width + iconDate.width + 20
            anchors.top:txtAddress.bottom
            anchors.topMargin: 5
        }
        Image {
            id: iconSeat
            source: "qrc:/resource/icons8-armchair-32.png"
            x:imgBookingDetail.width + 15
            height: parent.height/7
            width: parent.width/18
            anchors.top:txtDate.bottom
            anchors.topMargin: 5
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: idSeat
            text: qsTr(room+" - Ghe:"+seat)
            font.pixelSize: 13
            x:imgBookingDetail.width + iconSeat.width + 20
            anchors.top:txtDate.bottom
            anchors.topMargin: 5
        }
    }

}
