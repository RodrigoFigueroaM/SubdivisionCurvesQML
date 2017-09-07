import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 200
    height: 480

    Connections {
        target: button
        onClicked: {
            spline.compute()
            canvasForm.drawPoints(spline.points(), spline.points().length, Qt.rgba(0.6, 0.6, 0.0, 1.0), 5)
            canvasForm.requestPaint()
        }
    }

    Column {
        id: column
        anchors.fill: parent

        Button {
            id: button
            text: qsTr("Print")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 432
            anchors.right: parent.left
            anchors.rightMargin: -200
            anchors.left: parent.right
            anchors.leftMargin: -200
            anchors.top: parent.top
            anchors.topMargin: 0
            checkable: false
            checked: false
        }
    }
}
