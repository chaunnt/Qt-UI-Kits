import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Item {
    property ListModel listModelRating: ListModel{}
     property ListModel listModelTime: ListModel{}
    //anchors.fill: parent
    Component.onCompleted:{
        //insert data
        listModelRating.append({imgFilm:"qrc:/resource/cualaivobau.jpg",valueFilm:"2D",sub: "Phụ Đề",claim: "C16",rating: "9.9",nameFilm: "Cua Lại Vợ Bầu",subName: ""})
        listModelRating.append({imgFilm:"qrc:/resource/cualaivobau.jpg",valueFilm:"2D",sub: "Phụ Đề",claim: "C16",rating: "9.9",nameFilm: "Cua Lại Vợ Bầu",subName: ""})
        listModelRating.append({imgFilm:"qrc:/resource/cualaivobau.jpg",valueFilm:"2D",sub: "Phụ Đề",claim: "C16",rating: "9.9",nameFilm: "Cua Lại Vợ Bầu",subName: ""})
        listModelRating.append({imgFilm:"qrc:/resource/cualaivobau.jpg",valueFilm:"5D",sub: "Phụ Đề",claim: "C16",rating: "9.9",nameFilm: "Cua Lại Vợ Bầu",subName: ""})
        listModelRating.append({imgFilm:"qrc:/resource/cualaivobau.jpg",valueFilm:"6D",sub: "Phụ Đề",claim: "C16",rating: "9.9",nameFilm: "Cua Lại Vợ Bầu",subName: ""})

        listModelTime.append({hour:"20:20"});
        listModelTime.append({hour:"22:20"});
        listModelTime.append({hour:"20:20"});
        listModelTime.append({hour:"22:20"});
        listModelTime.append({hour:"20:20"});
    }
    Rectangle{
        id:recRating
        anchors.fill: parent
        color: "gray"
        ListView {
            anchors.fill: parent
            model:listModelRating
            spacing:1
            delegate:CustomListViewItemWithRating {
                height: recRating.height/4.2 * dpiToPixelValue
                width: recRating.width
                imgFilmItem: imgFilm
                valueFilmItem: valueFilm
                subItem: sub
                claimItem: claim
                ratingItem: rating
                nameFilmItem: nameFilm
                subNameItem: subName
                listModelTimerItem: listModelTime
            }
            focus: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar {}
        }
    }


}
