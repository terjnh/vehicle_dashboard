#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QTimer>
#include <QVariant>
#include <QDebug>

/*
 * Timer Class handles:
 *  - Distance travelled data
 *  - Calculation of distance based off speed recorded every second
 */

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

public slots:
    void timerStart();
    void timerStop();

signals:
    void distanceChanged();  //emit after each timeout()
    void speedValueChanged();

    void timerStarted();
    void timerStopped();

private slots:
    void timeout();

private:
    QTimer m_timer;  //Retrieve speed every second, and calculate a distance value per sec
    double const m_timerInterval = 2000.0;
    double m_dist = 0.0;  //m_dist in metres
    int m_speed = 0;

};

#endif // TIMER_H
