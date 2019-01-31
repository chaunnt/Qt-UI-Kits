import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "../CustomSpinbox"

Item {
    // Check to allow enable or not
    property bool lockIncrement: false
    // Check if is double ticket
    property bool isDoubleTicket: false
    // Type name ticket
    property string typeNameTicket: ''
    // detail information of ticket
    property string detailInfoTicket: ''
    // Price of ticket
    property int priceTicket: 0
    // Color of type name ticket
    property color titleColor: "#000000"
    // Color for detail ticket
    property color detailInfoColor: "#6b6b6b"
    // Font size type name ticket
    property int titleFontSize: 14 * dpiToPixelValue
    // Font size of price
    property int valueFontSize: 14 * dpiToPixelValue
    // Font size of detail ticket
    property int detailInfoFontSize: 12 * dpiToPixelValue
    // Max number of ticket to booking
    property int maxBookingTicket: 8
    // Check if item is a last item
    property bool isLastItem: false
    // Default width
    width: parent.width
    // Default height
    height: 70 * dpiToPixelValue

    // Signal when change value
    signal valueChange(int value, bool isIncrement)

    Component.onCompleted: {
        id_privateProps.calculateComponentHeight()
    }

    Timer{
        running: true
        repeat: false
        interval: 1
        onTriggered: {
            id_privateProps.calculateComponentHeight()
        }
    }

    QtObject {
        id: id_privateProps

        property int topPaddingText: 7 * dpiToPixelValue
        property int currentPrice: 0

        function updateValue(index, isIncrement) {
            if (priceTicket > 0) {
                currentPrice =  priceTicket * index
                valueChange(currentPrice, isIncrement)
            }

            id_price.text = currentPrice > 0 ? settingQML.formatPrice(currentPrice) : settingQML.formatPrice(priceTicket)
        }

        function calculateComponentHeight() {
            var textHeight = id_typeName.height + id_privateProps.topPaddingText + id_detailInfoTicket.height + 2
            var layoutHeight = id_mainLayout.height
            height = height + (textHeight - layoutHeight)
        }

    }

    Rectangle {
        anchors.fill: parent
        anchors.leftMargin: 10 * dpiToPixelValue
        anchors.rightMargin: 10 * dpiToPixelValue
        clip: true
        RowLayout {
            id: id_mainLayout
            anchors.fill: parent
            spacing: 9 * dpiToPixelValue
            anchors.topMargin: 5 * dpiToPixelValue
            anchors.bottomMargin: 10 * dpiToPixelValue
            anchors.rightMargin: 5 * dpiToPixelValue
            clip: true
            // Info ticket Rectangle
            Rectangle {
                id: test
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.45
                clip: true
                // type name ticket
                Text {
                    id: id_typeName
                    width: parent.width
                    font.pixelSize: titleFontSize
                    color: titleColor
                    text: qsTr(typeNameTicket)
                    anchors.top: parent.top
                    anchors.topMargin: id_privateProps.topPaddingText
                }

                // detail info ticket
                Text {
                    id: id_detailInfoTicket
                    width: parent.width
                    font.pixelSize: detailInfoFontSize
                    color: detailInfoColor
                    wrapMode: Text.WordWrap
                    text: qsTr(detailInfoTicket)
                    anchors.top: id_typeName.bottom
                    anchors.topMargin: 2 * dpiToPixelValue
                }
            }
            // Price
            Rectangle {
                Layout.preferredWidth: parent.width * 0.17
                Layout.fillHeight: true
                Text {
                    id: id_price
                    anchors.top: parent.top
                    anchors.topMargin: id_privateProps.topPaddingText
                    width: parent.width
                    horizontalAlignment: Text.AlignRight
                    font.pixelSize: valueFontSize
                    color: titleColor
                    font.bold: true
                    text: qsTr(settingQML.formatPrice(priceTicket))
                }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                clip: true
                CustomSpinBox {
                    anchors.top: parent.top
                    anchors.right: parent.right
                    maxValue: maxBookingTicket
                    isLockIncrement: lockIncrement
                    onValueChange: {
                        id_privateProps.updateValue(value, state)
                    }
                }
            }
        }

        // border bottom
        Rectangle {
            visible: !isLastItem
            width: parent.width
            height: 1
            color: "#d2d2d2"
            anchors.bottom: parent.bottom
        }
    }
}
