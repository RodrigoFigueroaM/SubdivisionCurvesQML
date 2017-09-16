#ifndef CURVEMODEL_H
#define CURVEMODEL_H

#include <QAbstractListModel>
#include "basecurve.h"

class CurveModel : public QAbstractListModel
{
    Q_OBJECT
public:
    CurveModel(QObject *parent = nullptr);
    void addCurve(const BaseSpline & spline);
    int rowCount(const QModelIndex & parent = QModelIndex()) const{};
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{};

private:
    QList<BaseSpline> _splines;
};

#endif // CURVEMODEL_H
