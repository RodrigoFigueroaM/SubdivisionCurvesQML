#include "basecurve.h"

BaseSpline::BaseSpline(QObject *parent):QObject(parent)
{}

BaseSpline::BaseSpline(const QList<QVariant> &controlPoints)
    :BaseSpline(controlPoints, 1)
{}

BaseSpline::BaseSpline(const QList<QVariant> &controlPoints, int depth)
    : _depth(depth)
{
    for(auto vec : controlPoints)
        _controlPoints.push_back(vec);
}

BaseSpline::~BaseSpline()
{}

