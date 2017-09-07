import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 200
    height: 480

    property alias text: label.text

    Connections {
        target: button
        onClicked: {
            spline.compute()
            canvasForm.drawPoints(spline.points(), spline.points().length,
                                  Qt.rgba(0.6, 0.6, 0.0, 1.0), 5)
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

        Slider {
            id: slider
            to: 10
            from: 1
            anchors.top: button.bottom
            anchors.topMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 339
            value: 1
            stepSize: 1
            snapMode: "SnapAlways"

            Label {
                id: label
                text: qsTr("Depth: ")
                anchors.right: parent.right
                anchors.rightMargin: 153
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: -16
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 42
            }
        }
    }

    Connections {
        target: slider
        onMoved: print(slider.value)
    }
}
