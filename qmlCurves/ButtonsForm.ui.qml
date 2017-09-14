import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 200
    height: 480

    CheckBox {
        id: splineCheckBox
        x: 4
        y: 45
        width: 188
        height: 34
        text: qsTr("Spline")
        spacing: 2
        clip: true
        checkable: true
        checked: false
    }

    CheckBox {
        id: convexHullCheckBox
        x: 4
        y: 15
        width: 188
        height: 33
        text: qsTr("Convex Hull")
        clip: true
        checkable: true
        checked: true
    }

    Slider {
        id: slider
        x: 4
        y: 81
        width: 188
        height: 48
        clip: true
        stepSize: 1
        from: 1
        to: 10
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
            //            canvasForm.requestPaint()
        }
    }

    Button {
        id: resetButton
        x: 8
        y: 135
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
