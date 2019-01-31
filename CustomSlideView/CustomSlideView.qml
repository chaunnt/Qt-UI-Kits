import QtQuick 2.0
import QtQuick.Controls 2.0
Item {
    // Interval timer
    property int intervalTimer: 10000
    width: 500
    height: 200
    SwipeView {
        id: id_slideView
        width: parent.width
        height: parent.height
        clip: true
        currentIndex: 0
        Repeater {
            model: id_imgModel
            delegate: Image {
                width: id_slideView.width
                height: id_slideView.height
                source: url
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(name)
                    }
                }
            }
        }
    }

    // test model
    ListModel {
        id: id_imgModel
        ListElement {
            name: "img1"
            url: "https://thegioidohoa.com/wp-content/uploads/2018/06/poster-phim.jpg"
        }
        ListElement {
            name: "img2"
            url: "http://3.bp.blogspot.com/-PVVyL5oxzI4/VKQHKh0WyhI/AAAAAAAABLU/SEZlNUd2kmc/s1600/hinh-nen-may-tinh-poster-phim-13.jpg"
        }
        ListElement {
            name: "img3"
            url: "https://images.kienthuc.net.vn/zoomh/500/uploaded/bientapkienthuc/2016_08_26/Son26-8/NewFolder4/pham-bang-bang-mat-nhon-hoat-dang-so-tren-poster-phim.jpg"
        }
        ListElement {
            name: "img4"
            url: "http://herstyle.com.vn/wp-content/uploads/2017/02/herstyle.vn-poster-phim-vali-tinh-yeun.jpg"
        }
    }

    Timer {
        running: true
        repeat: true
        interval: intervalTimer
        onTriggered: {
            // Calculate and set next index item
            var nextIndex = (id_slideView.currentIndex + 1) % id_slideView.count
            id_slideView.setCurrentIndex(nextIndex)
        }
    }
}
