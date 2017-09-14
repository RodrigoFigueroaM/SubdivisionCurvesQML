#ifndef CHAIKINSCURVE_H
#define CHAIKINSCURVE_H
#include <QVector>
#include "basecurve.h"

class ChaikinsCurve: public BaseSpline
{
public:
   //inherit all constructors
    using BaseSpline::BaseSpline;
    Q_INVOKABLE void compute();
    static std::pair<QVector3D,QVector3D> chaikinsAlg( const QVector3D &p0, const QVector3D &p1);
    ~ChaikinsCurve();
private:

};


#endif // CHAIKINSCURVE_H
