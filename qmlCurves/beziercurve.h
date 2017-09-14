#ifndef BEZIERCURVE_H
#define BEZIERCURVE_H
#include <basecurve.h>

class BezierCurve: public BaseSpline
{
public:
    using BaseSpline::BaseSpline;
    QList<QVariant> close(const QList<QVariant>& controlPoints);
    Q_INVOKABLE void compute();
    static QVector3D computeBezier(const QVector3D & self, const QVector3D & next);
    ~BezierCurve();
};

#endif // BEZIERCURVE_H
