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
                id:txtOldPassword
                placeholderText: "Old password"
                width: parent.width
                textBoxRadius:height / 2
                echoMode: TextInput.Password
            }
            CustomTextBox{
                id:txtNewPassword
                placeholderText: "New password"
                width: parent.width
                textBoxRadius:height / 2
                echoMode: TextInput.Password
                onTextChanged:{
                    if(txtConfirmPassword.text.trim() === "" || txtNewPassword.text.trim() === "" || txtOldPassword.text.trim() === ""){
                        btnForgot.enabled = false
                    }else{
                        btnForgot.enabled = true
                    }
                }
            }
            CustomTextBox{
                id:txtConfirmPassword
                placeholderText: "Confirm new password"
                width: parent.width
                textBoxRadius:height / 2
                echoMode: TextInput.Password
                onTextChanged:{
                    if(txtConfirmPassword.text.trim() === "" || txtNewPassword.text.trim() === "" || txtOldPassword.text.trim() === ""){
                        btnForgot.enabled = false
                    }else{
                        btnForgot.enabled = true
                    }
                }
            }
            CustomButton{
                id:btnForgot
                buttonText: qsTr("Change")
                buttonColor: enabled ? baseColor : "gray"
                enabled: false
                width: parent.width
                onClicked: {
                    forceActiveFocus()
                    if(txtOldPassword.text.trim() === ""){
                        messageDialog.show("Please input your password")
                    }else{
                        waitingDialog.show("Please wait")
                        if(appManager.changePassword(txtOldPassword.text, txtNewPassword.text, txtConfirmPassword.text)){
                            messageDialog.show("Password was changed successfully")
                            txtConfirmPassword.text = ""
                            txtNewPassword.text = ""
                            txtOldPassword.text = ""
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

