#include "circlegauge.h"
#include <QDebug>


CircleGauge::CircleGauge(QObject *parent): QObject(parent)
{
}

CircleGauge::CircleGauge(const QString &name, const QString &color, qreal value, QObject *parent)
    : QObject(parent), m_name(name), m_color(color), m_value(value)
{
}

QString CircleGauge::name() const
{
    return m_name;
}

void CircleGauge::setName(const QString &name)
{
    if (name != m_name) {
        m_name = name;
        emit nameChanged();
    }
}

QString CircleGauge::color() const
{
    return m_color;
}

void CircleGauge::setColor(const QString &color)
{
    if (color != m_color) {
        m_color = color;
        emit colorChanged();
    }
}

qreal CircleGauge::value()
{
    return m_value;
}


void CircleGauge::setValue(qreal value)
{
    if (value != m_value) {
        m_value = value;
        emit valueChanged();
    }
}

