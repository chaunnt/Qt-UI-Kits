import QtQuick 2.0
import QtQuick.Layouts 1.3
import "../CustomSpinbox"

Item {
    property string imageURL: ''

    // combo name init
    property string comboName: ''
    property int comboNameFontSize: 14
    property color comboNameFontColor: "#ffffff"

    // combo info init
    property string comboInfo: ''
    property int comboInfoFontSize: 15
    property color comboInfoFontColor: "#ffffff"

    // price init
    property int price: 0
    property int priceFontSize: 15
    property color priceFontColor: "#ffffff"


    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        anchors.margins: 5 * dpiToPixelValue
        // image & info
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.8
            Image {
                width: parent.width
                height: width
                source: imageURL
                Column {
                    spacing: 2 * dpiToPixelValue
                    width: parent.width - 20 * dpiToPixelValue
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 2 * dpiToPixelValue
                    anchors.horizontalCenter: parent.horizontalCenter
                    clip: true
                    onImplicitHeightChanged: {
                        height = implicitHeight
                    }

                    // combo name
                    Text {
                        id: id_comboName
                        font.pixelSize: comboNameFontSize
                        color: comboNameFontColor
                        font.bold: true
                        wrapMode: Text.WordWrap
                        text: qsTr(comboName)
                    }

                    // combo info
                    Text {
                        id: id_comboInfo
                        width: parent.width
                        font.pixelSize: comboInfoFontSize
                        color: comboInfoFontColor
                        wrapMode: Text.WordWrap
                        maximumLineCount: 2
                        elide: Text.ElideRight
                        text: qsTr(comboInfo)
                    }

                    // price
                    Text {
                        id: id_price
                        font.pixelSize: priceFontSize
                        color: priceFontColor
                        font.bold: true
                        text: qsTr(settingQML.formatPrice(price))
                    }
                }
            }
        }

        // button
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            CustomSpinBox {
                anchors.centerIn: parent
                isCombo: true
                onValueChange: {
                    console.log("change combo")
                }
            }
        }
    }
}
