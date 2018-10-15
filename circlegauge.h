#ifndef CIRCLEGAUGE_H
#define CIRCLEGAUGE_H

#include <QObject>


//![0]
class CircleGauge : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)
   Q_PROPERTY(qreal value READ value WRITE setValue NOTIFY valueChanged)
//![0]

public:
    CircleGauge(QObject *parent=0);
    CircleGauge(const QString &name, const QString &color, qreal value, QObject *parent=0);

    QString name() const;
    void setName(const QString &name);

    QString color() const;
    void setColor(const QString &color);

    qreal value();
    void setValue(qreal value);

signals:
    void nameChanged();
    void colorChanged();
    void valueChanged();

private:
    QString m_name;
    QString m_color;
    qreal m_value;

//![1]
};
//![1]

#endif // CIRCLEGAUGE_H
