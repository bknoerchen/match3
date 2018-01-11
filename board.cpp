#include "board.h"

#include "boardcontroller.h"

Board::Board(QWidget * parent)
    : QuickWidget(parent)
    , boardController_(new BoardController(this))
{
	//qmlRegisterUncreatableType<BoardController>("Match3", 1, 0, "BoardController", "Only available for enum access");
	setContextProperties({
	                         {"_boardController", boardController_}
	                     });
	initQmlScene(QUrl("qrc:/qml/Board.qml"));
}

const Board::BoardItemPtr &Board::at(const Coordinate & coordinate) const
{
	return boardItemMatrix_.at(coordinate.x()).at(coordinate.y());
}

Board::BoardItemPtr &Board::at(const Coordinate & coordinate)
{
	return boardItemMatrix_.at(coordinate.x()).at(coordinate.y());
}

//void Board::move(const Coordinate & from, const Coordinate & to)
//{
////    auto currPiece = at(t_from);
////    if (currPiece) {
////        if (currPiece->isMovePermitted(t_from, t_to, *this)) {
////            at(t_to) = currPiece;
////            at(t_from).reset();
////        }
////    }
//}
