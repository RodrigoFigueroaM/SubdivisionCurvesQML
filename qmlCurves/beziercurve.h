#ifndef BEZIERCURVE_H
#define BEZIERCURVE_H
#include <basecurve.h>

class BezierCurve: public BaseSpline
{
public:
    using BaseSpline::BaseSpline;
    Q_INVOKABLE void compute();
    static QVector3D computeHalfHalf(const QVector3D & self, const QVector3D & next);
    ~BezierCurve();
private:
    QList<QVariant> computeBezier(const QList<QVariant>& controlPoints);
};

#endif // BEZIERCURVE_H
