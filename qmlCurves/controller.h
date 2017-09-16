#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <basecurve.h>
#include <beziercurve.h>
#include <chaikinscurve.h>

class Controller : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE void addBezier();
    Q_INVOKABLE void addChaikins();

    explicit Controller(QObject *parent = nullptr);

    Q_INVOKABLE QObject* getLast()
        {if(!_splines.empty())
           return _splines.at(_splines.size() - 1);
        return nullptr;
        }
    Q_INVOKABLE QList<QObject*> splines() const
        { return _splines;}

    Q_INVOKABLE void clearSplines()
        { _splines.clear();}
private:
     QList<QObject*> _splines;
};

#endif // CONTROLLER_H
