#include "mainwindow.h"

#include "ui_mainwindow.h"

#include <QtQml/QQmlComponent>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	setWindowTitle(tr("Match 3"));
}

MainWindow::~MainWindow()
{
	delete ui;
}
