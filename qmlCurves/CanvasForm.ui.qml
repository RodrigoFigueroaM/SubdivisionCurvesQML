import QtQuick 2.4

Canvas {
    id: canvas
    width: 400
    height: 400

    contextType: qsTr("2d")
    property var points: []
    property var drawPoints: (function (points, length, color, linewidth) {

        var ctx = getContext('2d')
        ctx.strokeStyle = color
        ctx.lineWidth = linewidth
        ctx.beginPath()
        for (var i = 0; i < length - 1; i++) {
            ctx.moveTo(points[i].x, points[i].y)
            ctx.lineTo(points[i + 1].x, points[i + 1].y)
        }
        ctx.stroke()
    })
    onPaint: {
        var ctx = getContext('2d')
        //        ctx.fillStyle = Qt.rgba(0.2, 0.2, 0.2, 1.0)
        //        ctx.fillRect(0, 0, width, height)
        canvas.drawPoints(spline.controlPoints(),
                          spline.controlPoints().length, Qt.rgba(0.7, 0.3,
                                                                 0.7, 1.0), 2)
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        property real pointX
        property real pointY
        property real lastX
        property real lastY
        onReleased: {
            canvas.points.push(Qt.vector3d(mouseX, mouseY, 0))
            spline.addControlPoint(Qt.vector3d(mouseX, mouseY, 0))
            canvas.requestPaint()
        }
    }
}
