#include "chaikinscurve.h"

void ChaikinsCurve::compute()
{
    QList<QVariant> tempControlPoints(_controlPoints);
    for(int n = 0; n < BaseSpline::dept(); n++)
    {
        _points.clear();
        for(auto i = 0; i < tempControlPoints.size() - 1; i++)
        {
            std::pair<QVector3D, QVector3D> qr = ChaikinsCurve::chaikinsAlg(tempControlPoints[i].value<QVector3D>(), tempControlPoints[i+1].value<QVector3D>());
            _points.push_back(qr.first);
            _points.push_back(qr.second);
        }
        tempControlPoints.clear();
        tempControlPoints = _points;
    }
}

std::pair<QVector3D,QVector3D> ChaikinsCurve::chaikinsAlg( const QVector3D &p0, const QVector3D &p1)
{
    /* Chainkin's Algorithm to compute subdivision on a given line defined by p0, p1
        using 1/4, 3/4 method*/
    std::pair<QVector3D,QVector3D> result(3/4.0 * p0 + 1/4.0 * p1, 1/4.0 * p0 + 3/4.0 * p1 );
    return result;
}

ChaikinsCurve::~ChaikinsCurve()
{}

