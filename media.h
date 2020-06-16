#ifndef MEDIA_H
#define MEDIA_H

#include <QObject>
#include <QDebug>

class Media : public QObject
{
    Q_OBJECT
public:
    explicit Media(QObject *parent = nullptr);

signals:

};

#endif // MEDIA_H
