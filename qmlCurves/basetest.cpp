#include "basetest.h"

BaseTest::BaseTest(QObject *parent) : QObject(parent)
{

}
void BaseTest::test()
{
    qDebug() << "IM CPP bitch!!";
}
