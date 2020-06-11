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

}

int Timer::speedValue()
{
    qInfo() << "Returning speed value: " << m_speed;
    return m_speed;
}

void Timer::setSpeedValue(QVariant data)
{
    m_speed = data.toDouble();
    qInfo() << "Setting speed val: ";
    qInfo() << m_speed;
}

void Timer::timeout()
{
    // calculate distance per step (each timeout duration, defined by m_timerInterval) here
    m_dist = m_dist + (m_speed / 3600 * 1000);
    qDebug() << "Distance: " << m_dist;
    emit distanceChanged();
}
