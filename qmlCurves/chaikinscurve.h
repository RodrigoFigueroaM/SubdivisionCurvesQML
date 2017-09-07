#ifndef CHAIKINSCURVE_H
#define CHAIKINSCURVE_H
#include <QVector>
#include "basecurve.h"

class ChaikinsCurve: public BaseSpline
{
public:
    ChaikinsCurve(QObject *parent = nullptr);
    ChaikinsCurve(const  QList<QVariant> &controlPoints);
    ChaikinsCurve(const  QList<QVariant>  &controlPoints, int depth = 1);
    Q_INVOKABLE void compute();
    static std::pair<QVector3D,QVector3D> chaikinsAlg( const QVector3D &p0, const QVector3D &p1);
    int dept()const
        {return _depth;}
    void setDepth(const int &depth)
        {_depth = depth;}
    ~ChaikinsCurve();
private:
    Q_OBJECT
    int _depth;
};


#endif // CHAIKINSCURVE_H
