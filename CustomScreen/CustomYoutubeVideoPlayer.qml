import QtQuick 2.0
import QtWebView 1.1

Rectangle {
    property url urlVideo: "https://www.youtube.com/embed/5ZUXHGF7NQQ"
    id:recVideo
    width : parent.width
    height : 200
    anchors.top: parent.top

    WebView {
           id: webView
           anchors.fill: parent
           url: urlVideo
       }
}
