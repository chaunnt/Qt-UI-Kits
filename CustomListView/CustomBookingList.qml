import QtQuick 2.0

Item {
    property color bgColorTitle: "#f0f1f3"
    property color titleColor: "#000000"
    property int titleFontSize: 14 * dpiToPixelValue
    property int maxBookingOfTicket: 8
    signal valueChange(int value)

    width: parent.width
    height: 100 * dpiToPixelValue

    QtObject {
        id: id_privateProps
        property int countBookedTicket: 0
        property var arrAmountItem: []

        function updateValue(value, currentIndexItem, isInCrement) {
            var isDoubleTicket = id_repeater.itemAt(currentIndexItem).isDoubleTicket
            var temp_sumTicket = 0

            if (isInCrement) {
                temp_sumTicket = isDoubleTicket ?  countBookedTicket + 2 : countBookedTicket + 1
            } else {
                temp_sumTicket = isDoubleTicket ?  countBookedTicket - 2 : countBookedTicket - 1
            }

            // Check and update state alow change value or not for each item
            if (temp_sumTicket >= 0) {
                if (temp_sumTicket >= maxBookingOfTicket) {
                    countBookedTicket = maxBookingOfTicket - temp_sumTicket % maxBookingOfTicket
                    updateStateForDoubleTicket(true)
                    updateStateSingleTicket(true)
                } else if (temp_sumTicket >= maxBookingOfTicket - 1) {
                    countBookedTicket = temp_sumTicket
                    updateStateForDoubleTicket(true)
                    updateStateSingleTicket(false)
                } else if (temp_sumTicket < maxBookingOfTicket) {
                    updateStateForDoubleTicket(false)
                    updateStateSingleTicket(false)
                    countBookedTicket = temp_sumTicket
                }
            }

            // Set amount to array
            arrAmountItem[currentIndexItem] = value

            console.log(arrAmountItem)

            // Sum amount
            sumAmountItem()
        }

        // Sum amount item function
        function sumAmountItem() {
            var sumAmount = 0
            arrAmountItem.forEach(function(value) {
                sumAmount += value
            })
            valueChange(sumAmount)
        }

        // Update state for single ticket item function
        function updateStateSingleTicket(lockIncrement) {
            for (var i = 0 ; i < id_repeater.count ; i += 1) {
                var item = id_repeater.itemAt(i)
                if (!item.isDoubleTicket) {
                    item.lockIncrement = lockIncrement
                }
            }
        }

        // Update state for double ticket item function
        function updateStateForDoubleTicket(lockIncrement, currentIndexItem) {
            for (var i = 0 ; i < id_repeater.count ; i += 1) {
                var item = id_repeater.itemAt(i)
                if (item.isDoubleTicket) {
                    item.lockIncrement = lockIncrement
                }
            }
        }
    }

    Component.onCompleted: {
        height = id_layout.implicitHeight
    }

    Column {
        id: id_layout
        spacing: 0
        anchors.fill: parent
        Rectangle{
            width: parent.width
            height: 35 * dpiToPixelValue
            color: bgColorTitle
            Text {
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: titleFontSize
                color: titleColor
                anchors.left: parent.left
                anchors.leftMargin: 10 * dpiToPixelValue
                text: qsTr("Thông tin vé")
            }
        }
        Repeater {
            id: id_repeater
            model: id_testModel
            CustomBookingListItem {
                typeNameTicket: type
                detailInfoTicket: detail
                priceTicket: price
                maxBookingTicket: flag ? maxBookingOfTicket / 2 : maxBookingOfTicket
                isDoubleTicket: flag
                isLastItem: index === id_testModel.count - 1 ? true : false
                onValueChange: {
                    id_privateProps.updateValue(value, index, isIncrement)
                }
            }
        }

    }

    // test model
    ListModel {
        id: id_testModel
        ListElement {
            type: "Nguoi Lon"
            detail: "Vé 2D"
            price: 85000
            flag: 0
        }
        ListElement {
            type: "Ghe Doi"
            detail: "Vé ghế đôi (bao gồm 2 vé)"
            price: 170000
            flag: 1
        }
        ListElement {
            type: "GHE DOI THANH VIEN"
            detail: "Vé ghế đôi (bao gồm 2 vé) áp dụng cho thành viên"
            price: 150000
            flag: 1
        }
        ListElement {
            type: "Ve 2D Thanh Vien"
            detail: "Vé 2D-Chỉ áp dụng khách hàng thành viên Gstar và TeenStar"
            price: 75000
            flag: 0
        }
    }
}
