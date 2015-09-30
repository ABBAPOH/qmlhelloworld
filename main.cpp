#include <QGuiApplication>
//#include <QLabel>
#include <QDebug>
#include <QtQuick/QQuickView>
#include <QFileSystemModel>
#include <QDirModel>
#include <QStringListModel>
#include <QtPlugin>
#include <QAbstractAnimation>

Q_IMPORT_PLUGIN(QtQuickControlsPlugin)

class Model : public QStringListModel
{
public:
    Model() { setStringList(QStringList() << "hello" << "world"); }
};

class FileSystemModel : public QDirModel
{
public:
    FileSystemModel() { setFilter(QDir::NoDot | QDir::AllEntries); }
//    FileSystemModel() { setRootPath(/*QDir::homePath()*/"/"); }
};

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
//    QLabel w("Hello 2");
//    w.show();

//    QFileSystemModel model;

    qmlRegisterType<QDirModel>("com.arch.models", 1, 0, "QDirModel");
    qmlRegisterType<QFileSystemModel>("com.arch.models", 1, 0, "QFileSystemModel");
    qmlRegisterType<FileSystemModel>("com.arch.models", 1, 0, "FileSystemModel");
    qmlRegisterType<Model>("com.arch.models", 1, 0, "StringModel");

    QQuickView view;
    view.resize(640, 480);
    view.setSource(QUrl("qrc:/qbshello.qml"));
//    view.setSource(QUrl("file:///Users/i.komissarov/Programming/qbshello/qbshello.qml"));
    view.show();

    return app.exec();
}
