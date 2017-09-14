#include "beziercurve.h"
#include <QDebug>
#include <QQueue>
#include <QStack>

QList<QVariant> BezierCurve::close(const QList<QVariant>& controlPoints)
{
    QList<QVariant> tempControlPoints(controlPoints);
    QList<QVariant> tempSplinePoint;
    QList<QVariant> points;
    QQueue<QVariant> left;
    QStack<QVariant> right;
   for(int j = 0; j < controlPoints.size() - 1; j++)
    {
        tempSplinePoint.clear();
        for(int i = 0; i < tempControlPoints.size() - 1; i++)
        {
            tempSplinePoint.push_back(BezierCurve::computeBezier(tempControlPoints[i].value<QVector3D>(),
                                            tempControlPoints[i + 1].value<QVector3D>()));
        }
        left.enqueue(tempSplinePoint[0]);
        right.push(tempSplinePoint[tempSplinePoint.size() - 1]);
        tempControlPoints.clear();
        tempControlPoints = tempSplinePoint;
    }
    points.push_back(controlPoints[0]);
    while (!left.isEmpty())
        points.push_back(left.dequeue());
    while (!right.isEmpty())
        points.push_back(right.pop());
    points.push_back(controlPoints[controlPoints.size() -1]);
    return points;
}

void BezierCurve::compute()
{
    _points = close(_controlPoints);
}

QVector3D BezierCurve::computeBezier(const QVector3D & self, const QVector3D & next)
{
    return 0.5 * self + 0.5 * next;
}

BezierCurve::~BezierCurve()
{}

