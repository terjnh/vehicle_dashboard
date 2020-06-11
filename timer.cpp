#include "timer.h"

Timer::Timer(QObject *parent) : QObject(parent)
{
    m_timer.setInterval(m_timerInterval);
    connect(&m_timer, &QTimer::timeout, this, &Timer::timeout);
}

double Timer::distance()
{
    qInfo() << "Returning distance value: " << m_dist;
    return m_dist;
}

void Timer::setDistance(QVariant data)
{
    qInfo() << "Setting dist value";
    m_dist = data.toDouble();
    emit distanceChanged();
}

int Timer::speedValue()
{
    qInfo() << "Returning speed value: " << m_speed;
    return m_speed;
}

void Timer::setSpeedValue(QVariant data)
{
    m_speed = data.toInt();
    qInfo() << m_speed;
}

void Timer::timerStart()
{
    m_timer.start();
    emit timerStarted();
}

void Timer::timeout()
{
    // calculate distance per step (each timeout duration, defined by m_timerInterval) here
    m_dist = int(m_dist + (m_speed / 3600.0 * 1000.0));
    qDebug() << "Speed at timeout: " << m_speed;
    qDebug() << "Distance at timeout: " << m_dist;
    emit distanceChanged();
}
