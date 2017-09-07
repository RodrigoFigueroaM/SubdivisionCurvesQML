import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 200
    height: 480

    CheckBox {
        id: splineCheckBox
        width: 200
        text: qsTr("Spline")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 413
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 36
        spacing: 2
        clip: true
        checkable: true
        checked: false
    }

    CheckBox {
        id: convexHullCheckBox
        height: 52
        text: qsTr("Convex Hull")
        clip: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 433
        anchors.right: parent.left
        anchors.rightMargin: -200
        anchors.left: parent.right
        anchors.leftMargin: -200
        anchors.top: parent.top
        anchors.topMargin: 14
        checkable: true
        checked: true
    }

    Slider {
        id: slider
        clip: true
        stepSize: 1
        from: 1
        to: 10
        anchors.top: parent.top
        anchors.topMargin: 88
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 352
        value: 1
        snapMode: "SnapAlways"

        Label {
            id: label
            x: 10
            y: -4
            text: "Depth: " + Math.ceil(slider.value)
        }
    }

    Connections {
        target: slider
        onMoved: {
            spline.setDepth(Math.ceil(slider.value))
            canvasForm.drawSpline()
        }
    }

    Connections {
        target: convexHullCheckBox
        onToggled: {
            canvasForm.showConvexHull = convexHullCheckBox.checked
            canvasForm.requestPaint()
        }
    }

    Connections {
        target: splineCheckBox
        onToggled: {
            canvasForm.showSpline = splineCheckBox.checked
            canvasForm.drawSpline()
        }
    }

    Button {
        id: resetButton
        x: 8
        y: 154
        width: 184
        height: 30
        text: qsTr("Reset")
    }

    Connections {
        target: resetButton
        onClicked: {
            spline.reset()
            canvasForm.requestPaint()
        }
    }
}
