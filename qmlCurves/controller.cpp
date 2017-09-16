#include "controller.h"

Controller::Controller(QObject *parent) : QObject(parent)
{

}


void Controller::addBezier()
{
     BezierCurve * bez = new BezierCurve;
     _splines.append(bez);
}

 void Controller::addChaikins()
 {
     ChaikinsCurve * chaikins = new ChaikinsCurve;
     _splines.append(chaikins);
 }
