import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Item {
    property ListModel listModelPlace: ListModel{}
    //anchors.fill: parent
    Component.onCompleted:{
        //insert data
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
        listModelPlace.append({imgPlaceItemModel:"qrc:/resource/galaxy.jpg",namePlaceItemModel:"Galaxy Nguyễn Văn Quá",adressItemModel: "119B Nguyễn Văn Quá, Phường Đông Hưng, Thanh Phố Bến Tre",phoneItemModel: "01628888888"})
    }
    Rectangle{
        id:recPlace
        anchors.fill: parent
        color: "gray"
        ListView {
            anchors.fill: parent
            model:listModelPlace
            spacing:1
            delegate:CustomListViewItemWithPlace {
                height: recPlace.height/7.7 * dpiToPixelValue
                width: recPlace.width
                imgPlaceItem: imgPlaceItemModel
                namePlaceItem: namePlaceItemModel
                adressItem: adressItemModel
                phoneItem: phoneItemModel
            }
            focus: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar {}
        }
    }
}
