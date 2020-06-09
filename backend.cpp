#include "backend.h"

Backend::Backend(QObject *parent) : QObject(parent)
{
    // Give current directory
    m_path = QCoreApplication::applicationDirPath();
    m_path.append("/file.txt"); //default file name
}

QString Backend::path()
{
    return m_path;
}

void Backend::setPath(QString value)
{
    m_path = value;
    m_path.remove("file://");
    emit pathChanged();
}

QString Backend::data()
{
    QFile file(m_path);
    if(!file.open(QIODevice::ReadOnly)) {
        // cannot open in ReadOnly mode
        qWarning() << "Could not read file!";
        return "";
    }

    // Take open file, and shove it into a QTextStream
    QTextStream stream(&file);
    QString value = stream.readAll();

    file.close();

    return value;
}

void Backend::setData(QString value)
{
    QFile file(m_path);
    if(!file.open(QIODevice::WriteOnly)) {
        qWarning() << "Could not write file!";
    }

    QTextStream stream(&file);
    stream << value;
    stream.flush();
    file.close();

    emit dataChanged();
}
