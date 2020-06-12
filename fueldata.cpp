#include "fueldata.h"

FuelData::FuelData(QObject *parent) : QObject(parent)
{
    m_fuelValue = 200;
    m_timer.setInterval(m_timerInterval);
    connect(&m_timer, &QTimer::timeout, this, &FuelData::timeout);
}

int FuelData::fuelValue()
{
    // qInfo() << "Returning fuel value: " << m_fuelValue;
    return m_fuelValue;
}

void FuelData::setFuelValue(QVariant data)
{
    qInfo() << "Setting fuel value";
    m_fuelValue = data.toInt();
    emit fuelValueChanged();
}

void FuelData::timerStart()
{
    m_timer.start();
    emit timerStarted();
}

void FuelData::timerStop()
{
    m_timer.stop();
    emit timerStopped();
}

void FuelData::timeout()
{
    m_fuelValue = m_fuelValue - 3;
    qDebug() << "Fuel Value: " << m_fuelValue;
    emit fuelValueChanged();
}
