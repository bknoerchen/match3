#pragma once

#include "boarditem.h"
#include "coordinate.h"
#include "global.h"
#include "quickwidget.h"

#include <array>
#include <memory>

#include <QObject>

class BoardController;

class Board : public QuickWidget
{
public:

	using BoardItemPtr = std::shared_ptr<BoardItem>;
	using BoardItemMatrix = std::array<std::array<BoardItemPtr, BOARD_WIDTH>, BOARD_HEIGHT>;

	explicit Board(QWidget * parent = 0);

	const BoardItemPtr & at(const Coordinate & coordinate) const;
	BoardItemPtr & at(const Coordinate & coordinate);

private:

	BoardItemMatrix boardItemMatrix_;
	BoardController * boardController_;
};
