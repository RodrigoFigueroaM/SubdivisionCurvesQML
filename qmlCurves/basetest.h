#ifndef BASETEST_H
#define BASETEST_H

#include <QObject>
#include <QDebug>

class BaseTest : public QObject
{
private:
    Q_OBJECT
public:
    explicit BaseTest(QObject *parent = nullptr);
    Q_INVOKABLE void test();
signals:

public slots:
};


#endif // BASETEST_H
