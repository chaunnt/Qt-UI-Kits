import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle{
    Rectangle{
        anchors.centerIn: parent
        width:parent.width - 20 * dpiToPixelValue
        height: clItems.implicitHeight
        color: "transparent"
        Column{
            id:clItems
            width: parent.width
            spacing: 10 * dpiToPixelValue
            CustomTextBox{
                id:txtEmail
                placeholderText: "Email"
                width: parent.width
                textBoxRadius:height / 2
                onTextChanged:{
                    if(txtEmail.text.trim() === ""){
                        btnForgot.enabled = false
                    }else{
                        btnForgot.enabled = true
                    }
                }
            }
            CustomButton{
                id:btnForgot
                buttonText: qsTr("Restore")
                width: parent.width
                buttonColor: enabled ? baseColor : "gray"
                enabled: false
                onClicked: {
                    forceActiveFocus()
                    if(txtEmail.text.trim() === ""){
                        messageDialog.show("Please input email")
                    }else{
                        waitingDialog.show("Please wait")
                        if(appManager.forgotPassword(txtEmail.text)){
                            messageDialog.show("Please check your inbox")
                            txtEmail.text = ""
                        }

                        waitingDialog.close()
                    }

                }
            }
            CustomButton{
                id:btnBack
                buttonText: qsTr("Back")
                width: parent.width
                onClicked: {
                    enabled = false
                    mainStackView.pop()
                    enabled = true
                }
            }
        }

    }
}

