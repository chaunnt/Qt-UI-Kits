import QtQuick 2.0

Item {
    property string imgFilmItem: ""
    property string valueFilmItem: ""
    property string subItem: ""
    property string claimItem: ""
    property string ratingItem: ""
    property string nameFilmItem: ""
    property string subNameItem: ""
    property ListModel listModelTimerItem:ListModel{}
    //    /property  name: value
    Rectangle{
        id:recItemWithRating
        anchors.fill: parent
        color: "yellow"
        Rectangle{
            id:recHead
            height: parent.height
            width: parent.width/6 * dpiToPixelValue
            Image{
                id:imgItemWithRating
                height: parent.height/5*3 * dpiToPixelValue
                width: parent.width
                source: imgFilm
            }
            Rectangle{
                id:recValueFilm
                height: parent.height/5*2 * dpiToPixelValue
                width: parent.width
                anchors.top: imgItemWithRating.bottom
                Text {
                    //id: name
                    text: qsTr(valueFilm)
                    font.pixelSize: 25
                    font.bold: true
                    x:parent.width/2 - paintedWidth/2 * dpiToPixelValue
                    y:parent.height/3 - paintedHeight/2 * dpiToPixelValue
                }
                Text {
                    //id: name
                    text: qsTr(sub)
                    font.pixelSize: 13
                    x:parent.width/2 - paintedWidth/2 * dpiToPixelValue
                    y:parent.height/2 + paintedHeight/2 * dpiToPixelValue
                }
            }
        }
        Rectangle{
            id:recInfo
            height: parent.height
            width: parent.width - recHead.width * dpiToPixelValue
            //anchors.right: recHead.left
            x:recHead.width
            color: "red"
            Rectangle{
                id:recRating
                height: parent.height/5*3 * dpiToPixelValue
                width: parent.width
                Rectangle{
                    id:recClaim
                    height: parent.height/4 * dpiToPixelValue
                    width: parent.width/12 * dpiToPixelValue
                    color: "orange"
                    radius: 5 * dpiToPixelValue
                    x:5 * dpiToPixelValue
                    y:5 * dpiToPixelValue
                    Text {
                        id: txtClaim
                        text: qsTr(claim)
                        font.pixelSize: 13
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
                Text {
                    id: txtName
                    text: qsTr(nameFilm)
                    x:recClaim.width + 13 * dpiToPixelValue
                    y:parent.height/10 * dpiToPixelValue
                    font.bold: true
                    font.pixelSize: 13
                }
                Text {
                    id: txtSubName
                    text: qsTr(subName)
                    visible: subName == "" ? false:true
                    anchors.top:txtName.bottom
                    anchors.topMargin: parent.height/10 * dpiToPixelValue
                    font.pixelSize: 13
                    x:5 * dpiToPixelValue
                }
                Image {
                    id: iconSeat
                    source: "qrc:/resource/icon-star.png"
                    x:5 * dpiToPixelValue
                    height: parent.height/5 * dpiToPixelValue
                    width: parent.width/14 * dpiToPixelValue
                    anchors.top:subName == "" ? txtName.bottom : txtSubName.bottom
                    anchors.topMargin: parent.height/10 * dpiToPixelValue
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    id: txtRating
                    text: qsTr(rating+"/10")
                    x:iconSeat.width+10 * dpiToPixelValue
                    anchors.top:subName == "" ? txtName.bottom : txtSubName.bottom
                    anchors.topMargin: parent.height/9 * dpiToPixelValue
                    font.pixelSize: 13
                }
            }

            Rectangle{
                id:recTime
                height: parent.height/5*2 * dpiToPixelValue
                width: parent.width
                anchors.top: recRating.bottom
                Component.onCompleted: {

                }
                GridView {
                    id: grid
                    anchors.fill: parent
                    cellWidth:width/4 * dpiToPixelValue
                    cellHeight:height/2 * dpiToPixelValue
                    model: listModelTime
                    delegate:Item{
                        id:itemTimeDetail
                        width: grid.cellWidth
                        height: grid.cellHeight
                        Rectangle{
                            anchors.centerIn: parent
                            id:recTimeDetail
                             height: grid.height/5*2 * dpiToPixelValue
                             width: grid.width/5 * dpiToPixelValue
                            border.color: "orange"
                            border.width: 1
                            radius: 5
                            Text {
                                id: txtTime
                                text: qsTr(hour)
                                anchors.centerIn: parent
                                font.pixelSize: 12

                            }
                        }
                    }
                    //focus: true
                }

            }
        }
    }
}
