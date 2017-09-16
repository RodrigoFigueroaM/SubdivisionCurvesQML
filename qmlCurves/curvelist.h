#ifndef CURVELIST_H
#define CURVELIST_H

#include <QObject>

//template<typename S>
class CurveList:public QObject/*: public QList<S>*/
{

public:
//    using QList<S>::QList;
    explicit CurveList(QObject *parent = nullptr);
    Q_INVOKABLE void append ( QObject *spline)
    {
//      _        splines. append(spline);
        _splines.append(spline);
    }
    QList<QObject*> splines () const
    {
       return _splines;
    }

private:
    QList<QObject*> _splines;
//     Q_OBJECT
};

#endif // CURVELIST_H
