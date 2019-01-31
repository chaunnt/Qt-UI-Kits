import QtQuick 2.0

Item {
    property int widthTabBar: 0
    property int heightTabBar: 0
    property var listModelTabBar:[] //array title button
    property int indexTabBar: 0 //current index of TabBar
    Row{
        spacing: 0
        Repeater{
            model:listModelTabBar
            Rectangle{
                width: widthTabBar * dpiToPixelValue;
                height: heightTabBar * dpiToPixelValue
                clip: index == 0 || index == listModelTabBar.length-1? true:false
                Rectangle{
                    width: index == 0 || index == listModelTabBar.length-1? parent.width*2*dpiToPixelValue : parent.width * dpiToPixelValue;
                    height: parent.height * dpiToPixelValue
                    anchors.right: index !=listModelTabBar.length -1? undefined: parent.right
                    border{
                        color: 'orange';
                        width: 1*dpiToPixelValue
                    }
                    radius: index == 0 || index == listModelTabBar.length -1 ?0.2 * parent.height * dpiToPixelValue:0
                    color: index == indexTabBar? 'orange': 'white'
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            indexTabBar = index
                        }
                    }
                    Text {
                        id: txtTabBar
                        text: qsTr(modelData)
                        color: indexTabBar == index ? "white":"orange"
                        x:{
                            if(index == listModelTabBar.length - 1){
                                return parent.width/2+parent.width/4 - paintedWidth/2 * dpiToPixelValue
                            }else if(index == 0)
                                return parent.width/4 - paintedWidth/2 * dpiToPixelValue
                            else
                                return parent.width/2 - paintedWidth/2 * dpiToPixelValue
                        }
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

    }
}
