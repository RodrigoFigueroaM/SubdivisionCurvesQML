import QtQuick 2.4
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 200
    height: 480

    Rectangle {
        color: "#c9c9c9"
        anchors.fill: parent
    }

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
        font.weight: Font.Thin
        font.family: "Verdana"
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
        to: 5
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
            canvasForm.spline.setDepth(Math.ceil(slider.value))
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
        }
    }

    Button {
        id: resetBttn
        x: 8
        y: 130
        width: 184
        height: 30
        text: qsTr("Reset")
    }
    Button {
        id: clearBttn
        x: 8
        y: 154
        width: 184
        height: 30
        text: qsTr("Clear")
    }

    Button {
        id: bezierBttn
        x: 50
        y: 190
        width: 100
        height: 100
        background: Image {
            id: image
            anchors.fill: parent
            //        source: "graphics/bezier-curve.png"
            //                source: applicationPath + "/graphics/bezier-curve-2.png"
            source: "file:" + "/Users/rui/Desktop/githubStuff/curves++/ChaikinsCurveQML/qmlCurves/graphics/bezier-curve-2.png"
            //        source: applicationPath + "../../../../graphic/bezier-curve-2.png"
        }
        ToolTip.visible: hovered
        ToolTip.text: qsTr("Bezier Spline")
    }
    Button {
        id: chaikinBttn
        x: 50
        y: 323
        width: 100
        height: 100
        background: Image {
            id: image1
            anchors.fill: parent
            source: "file:" + "/Users/rui/Desktop/githubStuff/curves++/ChaikinsCurveQML/qmlCurves/graphics/chaikin.png"

            //        source: "qrc:/qtquickplugin/images/template_image.png"
        }
        ToolTip.visible: hovered
        ToolTip.text: qsTr("Chaikins Spline")
    }

    Connections {
        target: bezierBttn
        onClicked: {
            controller.addBezier()
            print(controller.splines().length)
        }
    }

    Connections {
        target: chaikinBttn
        onClicked: {
            controller.addChaikins()
            print(controller.splines().length)
        }
    }

    Connections {
        target: resetBttn
        onClicked: {
            canvasForm.spline.reset()
            canvasForm.requestPaint()
        }
    }

    Connections {
        target: clearBttn
        onClicked: {
            controller.clearSplines()
            canvasForm.requestPaint()
        }
    }
}
