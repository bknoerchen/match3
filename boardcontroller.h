#pragma once

#include "global.h"

#include <QObject>


class BoardController : public QObject
{
	Q_OBJECT

	Q_PROPERTY(int boardHeight READ getBoardHeight CONSTANT)
	Q_PROPERTY(int boardWidth READ getBoardWidth CONSTANT)

public:
	explicit BoardController(QObject * parent = 0);

	int getBoardHeight() const { return BOARD_HEIGHT; }
	int getBoardWidth() const { return BOARD_WIDTH; }

signals:

public slots:
};
