#include "curvemodel.h"

CurveModel::CurveModel(QObject *parent) : QAbstractListModel(parent)
{}

void CurveModel::addCurve(const BaseSpline &spline)
{
    _splines.append( spline);
}
