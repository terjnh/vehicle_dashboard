#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QTimer>
#include <QVariant>
#include <QDebug>

class Timer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double distanceTotal READ distance WRITE setDistance NOTIFY distanceChanged)
    Q_PROPERTY(int speedValue READ speedValue WRITE setSpeedValue NOTIFY speedValueChanged)

public:
    explicit Timer(QObject *parent = nullptr);

    // Getter & Setter: m_dist
    double distance();
    void setDistance(QVariant data);

    // Getter & Setter: m_speed
    int speedValue();
    void setSpeedValue(QVariant data);

signals:
    void distanceChanged();  //emit after each timeout()
    void speedValueChanged();

private slots:
    void timeout();

private:
    QTimer m_timer;  //Retrieve speed every second, and calculate a distance value per sec
    double const m_timerInterval = 1000.0;
    double m_dist;  //m_dist in metres
    int m_speed;

};

#endif // TIMER_H
