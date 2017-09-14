#ifndef BASECURVE_H
#define BASECURVE_H

#include <QObject>
#include <QVector3D>
#include <QList>
#include <QVariant>
#include <QDebug>
#include <QVector>
#include <utility>
#include <algorithm>

class BaseSpline:public QObject
{

public:
    explicit BaseSpline(QObject *parent = nullptr);
    BaseSpline(const QList<QVariant>  &controlPoints);
    BaseSpline(const QList<QVariant>  &controlPoints, int depth);

    Q_INVOKABLE QList<QVariant> controlPoints() const
    {
        return _controlPoints;
    }

    Q_INVOKABLE QList<QVariant> controlPoints()
    {
        return _controlPoints;
    }

    Q_INVOKABLE QList<QVariant> points() const
    {
        return _points;
    }

    Q_INVOKABLE void reset()
    {
         _controlPoints.clear();
        _points.clear();
    }

    Q_INVOKABLE void printControlPoints() const
    {
        qDebug() << "ControlPoints";
        for(auto point : _controlPoints)
            qDebug() << point;
    }

    Q_INVOKABLE void addControlPoint(const QVector3D &controlPoint)
    {
        _controlPoints.push_back(controlPoint);
    }

    Q_INVOKABLE void printSplinePoints() const
    {
        qDebug() << "SplinePoints";
        for(auto point : _points)
            qDebug() << point;
    }

    Q_INVOKABLE virtual void compute() = 0;
    virtual ~BaseSpline();
    int dept()const
        {return _depth;}
    Q_INVOKABLE void setDepth(const int &depth)
        {_depth = depth;}
protected:
    QList<QVariant> _controlPoints;
    QList<QVariant> _points;
private:
    Q_OBJECT
    int _depth;
};



#endif // BASECURVE_H
