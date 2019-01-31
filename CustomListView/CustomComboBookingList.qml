import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property color bgColorTitle: "#f0f1f3"
    property color titleColor: "#000000"
    property int titleFontSize: 16 * dpiToPixelValue

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: id_mainLayout.implicitHeight + id_title.height
        boundsBehavior: Flickable.StopAtBounds
        Rectangle{
            id: id_title
            width: parent.width
            height: 35 * dpiToPixelValue
            color: bgColorTitle
            Text {
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: titleFontSize
                color: titleColor
                anchors.left: parent.left
                anchors.leftMargin: 10 * dpiToPixelValue
                text: qsTr("Combo")
            }
        }
        GridLayout {
            id: id_mainLayout
            width: parent.width
            height: parent.height - id_title.height
            Layout.maximumWidth: 360 * dpiToPixelValue
            anchors.top: id_title.bottom
            columnSpacing: 0
            rowSpacing: 0
            columns: 2
            Repeater {
                id: id_comboRepeater
                model: 10
                delegate: Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 215 * dpiToPixelValue
                    CustomBorderRectangle {
                        commonBorder: false
                        tBorderwidth: 0
                        lBorderwidth: index % 2 == 0 ? 0 : 1
                        rBorderwidth: index % 2 == 0 ? 1 : 0
                        bBorderwidth: {
                            if (index === id_comboRepeater.count - 1 || index === id_comboRepeater.count - 2 ) {
                                return 0;
                            } else {
                                return 1;
                            }
                        }
                    }

                    CustomComboBookingListItem {
                        anchors.fill: parent
                        comboName: "iCombo1"
                        comboInfo: "1 Bắp (ngọt/mặn) + 1 nước (pepsi/7up/fanta)"
                        price: 65000
                        imageURL: "https://media.ifind.vn/data/images/media/3d-1546654891172.jpg"
                   }
                }
            }
        }
    }
}
