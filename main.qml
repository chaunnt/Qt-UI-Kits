import "CustomButton"
import "CustomCalendar"
import "CustomListView"
import "CustomScreen"
import "CustomSpinbox"
import "CustomTabbar"

import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id:mainWindow
    visible: true
    width: 480
    height: 873
    property int baseButtonHeight: 40 * dpiToPixelValue
    property int normalFontSize: 15 * dpiToPixelValue
    property int bigFontSize: 20 * dpiToPixelValue
    property int extraFontSize: 24 * dpiToPixelValue
    property int smallFontSize: 12 * dpiToPixelValue
    property color baseColor: "#FE1A2B"
    property color baseSelectingColor: "#007ACC"
    property color baseTextColor: "white"
    property bool isLoggedIn: false
    property bool isAutoLogin: true
    property string appTitle: ""
    ListModel{
        id:lmCategory
        ListElement{
            categoryName: "CustomButton"
        }
        ListElement{
            categoryName: "CustomCalendar"
        }
        ListElement{
            categoryName: "CustomListView"
        }
        ListElement{
            categoryName: "CustomScreen"
        }
        ListElement{
            categoryName: "CustomSlideView"
        }
        ListElement{
            categoryName: "CustomSpinbox"
        }
        ListElement{
            categoryName: "CustomTabbar"
        }
        ListElement{
            categoryName: "CustomTextBox"
        }
    }

    Setting {
        id: settingQML
    }
    Rectangle{
        id:recHeader
        height: baseButtonHeight
        width: parent.width
        anchors.top: parent.top
        visible: mainStackView.visible
        color: baseColor
        Rectangle{
            id:recHeaderIcon
            width: height
            height: parent.height
            anchors.left: parent.left
            color: baseColor
            Image {
                source: "qrc:/resource/LeftArrow_White.png"
                height: parent.height / 2
                fillMode: Image.PreserveAspectFit
                anchors.left: parent.left
                anchors.leftMargin: 5 * dpiToPixelValue
                y:parent.height / 2 - height / 2
                visible: mainStackView.depth > 1
            }
        }
        Text {
            id: name
            text: mainStackView.depth > 1 ? appTitle : "Qt UI Kits"
            anchors.centerIn: parent
            width: parent.width - recHeaderIcon.width
            x:recHeaderIcon.width
            font.pixelSize: extraFontSize
            color: "white"
            font.bold:true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            height: parent.height
            elide: Text.ElideRight
        }
        MouseArea{
            anchors.fill: parent
            enabled: mainStackView.depth > 1
            onClicked: {
                console.log("asdasldkjaslkd")
                mainStackView.pop(null)
                console.log(mainStackView.depth)
            }
        }
    }
    StackView {
        id: mainStackView
        width: parent.width
        height: parent.height - recHeader.height
        y:recHeader.height
        visible: !recSplash.visible
        initialItem: cpnMainScreen
    }
    Component{
        id:cpnMainScreen
        Rectangle{
            id:recMainScreen
            width: parent.width
            height: parent.height
            ListView{
                id:lvCategory
                model: lmCategory
                anchors.fill: parent
                clip: true
                delegate: Rectangle{
                    border.color: "lightgray"
                    border.width: 1
                    width: lvCategory.width
                    height: baseButtonHeight
                    Text {
                        text: categoryName
                        font.pixelSize: normalFontSize
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            appTitle = categoryName
                            if(categoryName === "CustomButton"){
                                mainStackView.push(cpnScreenCustomButtons)
                            }else if(categoryName === "CustomCalendar"){
                                mainStackView.push(cpnScreenCustomCalendar)
                            }else if(categoryName === "CustomListView"){
                                mainStackView.push(cpnScreenCustomListView)
                            }else if(categoryName === "CustomScreen"){
                                mainStackView.push(cpnScreenCustomScreen)
                            }else if(categoryName === "CustomSlideView"){
                                mainStackView.push(cpnScreenCustomSlideView)
                            }else if(categoryName === "CustomSpinbox"){
                                mainStackView.push(cpnScreenCustomSpinbox)
                            }else if(categoryName === "CustomTabbar"){
                                mainStackView.push(cpnScreenCustomTabbar)
                            }else if(categoryName === "CustomTextBox"){
                                mainStackView.push(cpnScreenCustomTextBox)
                            }else{
                                mainStackView.push(cpnScreenCustomButtons)
                            }
                        }
                    }
                }
            }
        }

    }


    Rectangle{
        id:recSplash
        anchors.fill: parent
        color: "white"
        Image {
            source: "qrc:/resource/Kits.png"
            width: parent.width - 20 * dpiToPixelValue
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    Timer{
        id: tmSplashTimer
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            waitingDialog.show("Starting application")
            isAutoLogin = false;
            recSplash.visible = false
            waitingDialog.close()
        }
    }

    Component.onCompleted: {
        tmSplashTimer.start()
    }
    Rectangle{
        id: bgMessageDialog
        anchors.fill: parent
        visible: waitingDialog.visible || messageDialog.visible
        color: "black"
        opacity: 0.5
        MouseArea{
            enabled: parent.visible
            anchors.fill: parent
            onClicked: {
                console.log("Screen Locked")
            }
        }
    }

    Rectangle{
        id:waitingDialog
        function show(string){
            txtWaitingMessage.text=string
            visible = true
        }

        function close(){
            waitingDialog.visible = false
        }
        anchors.centerIn: parent
        radius: 2
        width: Math.max(txtWaitingMessage.width + 20 * dpiToPixelValue, 100 * dpiToPixelValue)
        color: "white"
        visible: false

        Text {
            id: txtWaitingMessage
            padding: 6
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            x:parent.width / 2 - width / 2
            anchors.top :imgWaitingIndicator.bottom
            font.pixelSize: normalFontSize
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        Image {
            id: imgWaitingIndicator
            source: "qrc:/resource/spinner.png"
            width: 40 * dpiToPixelValue
            height: width
            fillMode: Image.PreserveAspectFit
            x:parent.width / 2 - width / 2
            anchors.centerIn: parent
        }
        RotationAnimator {
            target: imgWaitingIndicator;
            from: 0;
            to: 360;
            duration: 1000
            running: waitingDialog.visible
            direction: RotationAnimator.Clockwise
            loops: Animation.Infinite
        }
        height: txtWaitingMessage.height + rectLoginMessageRow.height + 20 * dpiToPixelValue + imgWaitingIndicator.height
    }

    Rectangle{
        id: messageDialog
        signal closed

        function show(string){
            txtLoginMessageContent.text=string
            visible = true
        }

        function close(){
            messageDialog.visible = false
            closed()
        }
        anchors.centerIn: parent
        radius: 10 * dpiToPixelValue
        width: parent.width - 20 * dpiToPixelValue
        color: "white"
        visible: false
        Text {
            id: txtLoginMessageContent
            padding: 6
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            x:parent.width / 2 - width / 2
            anchors.top :parent.top
            font.pixelSize: normalFontSize
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            width: parent.width
        }
        Rectangle{
            id:rectLoginMessageRow
            anchors.top:txtLoginMessageContent.bottom
            anchors.topMargin: 5
            color: "lightgray"
            width: parent.width
            height: 1
        }
        Button{
            id:btnOK
            text:"OK"
            font.pixelSize: normalFontSize
            width: parent.width / 2
            height: baseButtonHeight
            padding: 0
            x: parent.width / 2 - width / 2
            anchors.top:rectLoginMessageRow.bottom
            background: Rectangle{
                anchors.fill: parent
                color: "transparent"
            }
            onClicked: {
                messageDialog.close()
            }
        }
        height: txtLoginMessageContent.height + btnOK.height + rectLoginMessageRow.height
    }

    Component{
        id:cpnScreenCustomButtons
        ScreenCustomButtons{

        }
    }
    Component{
        id:cpnScreenCustomCalendar
        ScreenCustomCalendar{

        }
    }
    Component{
        id:cpnScreenCustomListView
        ScreenCustomListView{

        }
    }
    Component{
        id:cpnScreenCustomScreen
        ScreenCustomScreen{

        }
    }
    Component{
        id:cpnScreenCustomSlideView
        ScreenCustomSlideView{

        }
    }
    Component{
        id:cpnScreenCustomSpinbox
        ScreenCustomSpinbox{

        }
    }
    Component{
        id:cpnScreenCustomTabbar
        ScreenCustomTabbar{

        }
    }
    Component{
        id:cpnScreenCustomTextBox
        ScreenCustomTextBox{

        }
    }

}
