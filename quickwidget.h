#pragma once

#include <QString>
#include <QQuickWidget>

class QWidget;

class QuickWidget : public QQuickWidget
{
public:
	explicit QuickWidget(QWidget * parent = 0);

	void initQmlScene(const QUrl & url);
	void setContextProperties(QHash<QString, QObject *> && contextProperties);

private:

#if !defined(NDEBUG)
	QString qmlFileName_;
#endif
};
