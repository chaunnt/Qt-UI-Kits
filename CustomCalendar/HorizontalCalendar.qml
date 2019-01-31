import QtQuick 2.0

Item {
    property int currenIndex: 0
    property int heightListView: 0
    property int widthListView: 0
    property ListModel calendarListModel: ListModel{}
    property string dateselect: ""
    //get date of week
    function getDate(){
        var dateMonth = new Date()
        var week= [];
        dateselect = dateMonth.getDate().toString()
        for (var i = 0; i < 7; i++) {
            calendarListModel.append({"DaysOfWeek":dateMonth.getDay(),"Day":dateMonth.getDate()})
            dateMonth.setDate(dateMonth.getDate() +1);
        }
    }
    Component.onCompleted: {
        getDate()
    }
    ListView {
        id:listViewHorizontal
        width: widthListView * dpiToPixelValue
        height: heightListView * dpiToPixelValue
        orientation: ListView.Horizontal
        interactive: false
        model: calendarListModel
        Component {
            id: contactsDelegate
            Rectangle {
                id: wrapper
                width: widthListView/7 * dpiToPixelValue
                height: heightListView/10 * dpiToPixelValue
                color: dateselect == day.text ? "orange" : "#f8f8f6"
                Text {
                    id: daysofweek
                    text: {
                        var dateCalendar = new Date()
                        if(DaysOfWeek == dateCalendar.getDay())
                        {
                            return "Hôm nay"
                        }else if(DaysOfWeek == 1)
                            return "T2"
                        else if(DaysOfWeek == 2)
                            return "T3"
                        else if(DaysOfWeek == 3)
                            return "T4"
                        else if(DaysOfWeek == 4)
                            return "T5"
                        else if(DaysOfWeek == 5)
                            return "T6"
                        else if(DaysOfWeek == 6)
                            return "T7"
                        else if(DaysOfWeek == 0)
                            return "CN"
                    }
                    y:parent.height/10 * dpiToPixelValue
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: dateselect == day.text ? "white" : "orange"
                }
                Text {
                    id: day
                    text: Day
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height/10 * dpiToPixelValue
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: dateselect == day.text ? "white" : "orange"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        dateselect = day.text
                    }
                }
            }
        }
        delegate: contactsDelegate
    }
}
