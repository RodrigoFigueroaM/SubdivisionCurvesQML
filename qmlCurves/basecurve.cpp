#include "basecurve.h"

BaseSpline::BaseSpline(QObject *parent):QObject(parent)
{}

BaseSpline::BaseSpline(const QList<QVariant> &controlPoints)
{
    for(auto vec : controlPoints)
        _controlPoints.push_back(vec);
}

BaseSpline::~BaseSpline()
{}

