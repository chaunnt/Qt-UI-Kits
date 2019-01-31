import QtQuick 2.0

Item {
    readonly property string imageType_mattien : "mattien";
    readonly property string imageType_viewtraiphai : "viewtraiphai";
    readonly property string imageType_noithat : "noithat";
    readonly property string imageType_phongkhach : "phongkhach";
    readonly property string imageType_phongbep : "mattien";
    readonly property string imageType_phongngu : "mattien";
    readonly property string imageType_phongtam : "mattien";
    readonly property string imageType_santhuong : "santhuong";
    readonly property string imageType_nhaxe : "nhaxe";
    readonly property string imageType_giaytonha : "giaytonha";
    readonly property string imageType_quyhoachlogioi : "quyhoachlogioi";
    readonly property string imageType_quyhoachsudungdat : "quyhoachsudungdat";
    readonly property string headerAccountCaNhan : "Cá Nhân";
    readonly property string headerAccountGiaoDich : "Giao Dịch";

    // format price function
    function formatPrice(number) {
      return number.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.') + 'đ'
    }
}
