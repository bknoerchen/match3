#include "quickwidget.h"

#include <QFileInfo>
#include <QHash>
#include <QShortcut>
#include <QString>
#include <QtQml/QQmlComponent>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include <QtQuick/QQuickItem>

QuickWidget::QuickWidget(QWidget * parent)
    : QQuickWidget(parent)
{
	setResizeMode(SizeRootObjectToView);

#if !defined(NDEBUG)
	QShortcut * shortcut = new QShortcut(QKeySequence(Qt::CTRL + Qt::SHIFT + Qt::Key_R), this);
	QObject::connect(shortcut, &QShortcut::activated, [=]() {
		const QUrl url = QUrl::fromLocalFile(QString(QML_SRCDIR "%1").arg(qmlFileName_));
		const QFileInfo fileInfo(url.toLocalFile());
		if (fileInfo.isReadable()) {
			qInfo("reloading %s", qUtf8Printable(fileInfo.fileName()));
			engine()->clearComponentCache();
			setSource(url);
		}
	});
#endif
}

void QuickWidget::setContextProperties(QHash<QString, QObject *> && contextProperties) {
	QHash<QString, QObject *>::const_iterator i = contextProperties.constBegin();
	while (i != contextProperties.constEnd()) {
		rootContext()->setContextProperty(i.key(), i.value());
		++i;
	}
}

void QuickWidget::initQmlScene(const QUrl & url)
{
	setSource(url);

	foreach (const QQmlError & error, errors()) {
		qWarning("Error in file %s in line %d: %s", qUtf8Printable(url.toString()), error.line(), qUtf8Printable(error.toString()));
	}

#if !defined(NDEBUG)
	qmlFileName_ = url.toString().replace("qrc:", "");
#endif
}
