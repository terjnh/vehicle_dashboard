#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QCoreApplication>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr);

signals:

};

#endif // BACKEND_H
