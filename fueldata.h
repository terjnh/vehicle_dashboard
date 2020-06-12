#ifndef FUELDATA_H
#define FUELDATA_H

#include <QObject>
#include <QTimer>
#include <QVariant>
#include <QDebug>

/*
 * FuelData Class handles:
 *  - Change in fuel amount over time
 */

class FuelData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int fuelValue READ fuelValue WRITE setFuelValue NOTIFY fuelValueChanged)

public:
    explicit FuelData(QObject *parent = nullptr);

    // Getter & Setter: m_fuelValue
    int fuelValue();
    void setFuelValue(QVariant data);

public slots:
    void timerStart();
    void timerStop();

signals:
    void fuelValueChanged();  // emit after each timeout()

    void timerStarted();
    void timerStopped();

private slots:
    void timeout();

private:
    QTimer m_timer;
    int m_fuelValue;
    int const m_timerInterval = 2000;

};

#endif // FUELDATA_H
