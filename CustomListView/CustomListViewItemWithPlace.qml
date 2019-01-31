import QtQuick 2.0

Item {
    //anchors.fill: parent
    property string imgPlaceItem: "qrc:/resource/galaxy.jpg"
    property string namePlaceItem: "Galaxy Nguyễn Văn Quá"
    property string adressItem: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre"
    property string phoneItem: "01628888888"
    Rectangle{
        anchors.fill: parent
//        /color: "yellow"
        Image {
            id: imgPlace
            source: imgPlaceItem
            height: parent.height * 0.8 * dpiToPixelValue
            width: parent.width/3.3 * dpiToPixelValue
            anchors.top: parent.top
            anchors.topMargin: 5
            x:5
        }
        Text {
            id: txtNamePlace
            text: qsTr(namePlaceItem)
            font.bold: true
            font.pixelSize: 15
            x: imgPlace.width + 15 * dpiToPixelValue
            anchors.top: parent.top
            anchors.topMargin: parent.height /11 * dpiToPixelValue
        }
        Image {
            id: imgAddress
            source: "qrc:/resource/icons8-address-32.png"
            x:imgPlace.width + 15 * dpiToPixelValue
            height: parent.height/6 * dpiToPixelValue
            width: parent.width/21 * dpiToPixelValue
            anchors.top:txtNamePlace.bottom
            anchors.topMargin: parent.height /12 * dpiToPixelValue
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: txtAdress
            text: qsTr(adressItem)
            anchors.top:txtNamePlace.bottom
            anchors.topMargin: parent.height /12 * dpiToPixelValue
            width:  parent.width - imgPlace.width - imgAddress.width - 20 * dpiToPixelValue
            clip:true
            x:imgPlace.width + imgAddress.width + 20 * dpiToPixelValue
            font.pixelSize: 13
            //wrapMode: Text.WordWrap
            elide: Text.ElideRight
        }
        Image {
            id: imgPhone
            source: "qrc:/resource/phone-32.png"
            x:imgPlace.width + 15 * dpiToPixelValue
            height: parent.height/6 * dpiToPixelValue
            width: parent.width/21 * dpiToPixelValue
            anchors.top:txtAdress.bottom
            anchors.topMargin: parent.height /12 * dpiToPixelValue
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: txtPhone
            text: qsTr(phoneItem)
            anchors.top:txtAdress.bottom
            anchors.topMargin: parent.height /12 * dpiToPixelValue
            x:imgPlace.width + imgPhone.width + 20 * dpiToPixelValue
            font.pixelSize: 13
        }
        Image{
            id:imgNext
            height:parent.height/5 * dpiToPixelValue
            width: parent.width/21 * dpiToPixelValue
            source: "qrc:/resource/icons8-more-than-48.png"
            anchors.right: parent.right
            anchors.rightMargin: parent.width/30 * dpiToPixelValue
           y: parent.height/13 * dpiToPixelValue
        }
    }

}
