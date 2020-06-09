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
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    // Getter/Setter for Q_PROPERTY
    QString path();
    void setPath(QString value);
    QString data();
    void setData(QString value);

signals:
    // SIGNALS for Q_PROPERTY
    void pathChanged();
    void dataChanged();

private:
    QString m_path;

};

#endif // BACKEND_H
