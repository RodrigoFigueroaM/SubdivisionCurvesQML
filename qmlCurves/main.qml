import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    height: 480
    color: "#494949"
    title: qsTr("Chaikins Curve")

    CanvasForm {
        id: canvasForm
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 245


    }

    ButtonsForm {
        id: buttonsForm
        anchors.left: canvasForm.right
        anchors.leftMargin: 24
        anchors.right: parent.right
        anchors.rightMargin: 21
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }


}
