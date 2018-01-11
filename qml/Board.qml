//import QtQuick 2.7
////import Match3 1.0

//Item {

//Rectangle {
//    id: board

//    property int boardHeight: _boardController.boardHeight
//    property int boardWidth: _boardController.boardWidth

//    anchors.fill: parent

//    Grid {
//        id: grid

//        anchors.fill: parent

//        //property int cellSize: parent.cellSize
//        //property Piece selectedPiece: null
//        rows: board.boardHeight
//        columns: board.boardWidth
//        spacing: 1

//        Repeater {
//            id: repeater

//            model: board.boardHeight * board.boardWidth

//            Rectangle {
//                id: tile
//                color: "red"
//                height: (board.height - grid.spacing * (board.boardHeight -1)) / board.boardHeight
//                width: (board.width - grid.spacing * (board.boardWidth - 1)) / board.boardWidth

//                Text {
//                    text: index
//                    anchors {
//                        fill: parent
//                    }
//                    horizontalAlignment: Text.AlignHCenter
//                    verticalAlignment: Text.AlignVCenter
//                    font.pixelSize: 20
//                    scale: ((paintedWidth+10) > width) || (paintedHeight > height) ? Math.min(width / (paintedWidth+10), height / paintedHeight) : 1

//                }
//            }
//        }
//    }
//}

//}


import QtQuick 2.0
import QtQml.Models 2.1

GridView {
    id: root
    width: 320; height: 480
    cellWidth: 80; cellHeight: 80

//    displaced: Transition {
//        NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
//    }

//! [0]
    model: DelegateModel {
//! [0]
        id: visualModel
        model: ListModel {
            id: colorModel
            ListElement { itemColor: "blue" }
            ListElement { itemColor: "green" }
            ListElement { itemColor: "red" }
            ListElement { itemColor: "yellow" }
            ListElement { itemColor: "orange" }
            ListElement { itemColor: "purple" }
            ListElement { itemColor: "cyan" }
            ListElement { itemColor: "magenta" }
            ListElement { itemColor: "chartreuse" }
            ListElement { itemColor: "aquamarine" }
            ListElement { itemColor: "indigo" }
            ListElement { itemColor: "black" }
            ListElement { itemColor: "lightsteelblue" }
            ListElement { itemColor: "violet" }
            ListElement { itemColor: "grey" }
            ListElement { itemColor: "springgreen" }
            ListElement { itemColor: "salmon" }
            ListElement { itemColor: "blanchedalmond" }
            ListElement { itemColor: "forestgreen" }
            ListElement { itemColor: "pink" }
            ListElement { itemColor: "navy" }
            ListElement { itemColor: "goldenrod" }
            ListElement { itemColor: "crimson" }
            ListElement { itemColor: "teal" }
        }

        delegate: Item {
            id: delegateRoot
            property int visualIndex: DelegateModel.itemsIndex

            width: 72
            height: 72

            Rectangle {
                id: rect

                 property int visualIndex: parent.visualIndex
                color: itemColor
                width: 72
                height: 72

                Drag.active: dragArea.drag.active
                Drag.hotSpot.x: 36
                Drag.hotSpot.y: 36

                anchors {
                    horizontalCenter: delegateRoot.horizontalCenter;
                    verticalCenter: delegateRoot.verticalCenter
                }

                MouseArea {
                    id: dragArea
                    anchors.fill: parent

                    drag.target: parent
                }

                states: [
                    State {
                        when: rect.Drag.active
                        ParentChange {
                            target: delegateRoot
                            parent: root
                        }

                        AnchorChanges {
                            target: rect;
                            anchors.horizontalCenter: undefined;
                            anchors.verticalCenter: undefined
                        }
                        PropertyChanges {
                            target: rect;
                            opacity: 0.8
                        }
                    }
                ]
            }

            DropArea {
                anchors {
                    fill: parent
                }

                onEntered: {
                    console.log(drag.source.visualIndex, delegateRoot.visualIndex)
                    visualModel.items.move(drag.source.visualIndex, delegateRoot.visualIndex)
                }
            }
        }

////! [1]
//        delegate: MouseArea {
//            id: delegateRoot

//            property int visualIndex: DelegateModel.itemsIndex

//            width: 80; height: 80
//            drag.target: icon

//            Rectangle {
//                id: icon
//                width: 72; height: 72
//                anchors {
//                    horizontalCenter: delegateRoot.horizontalCenter;
//                    verticalCenter: delegateRoot.verticalCenter
//                }
//                color: model.itemColor
//                radius: 3

//                Drag.active: delegateRoot.drag.active
//                Drag.source: delegateRoot
//                Drag.hotSpot.x: 36
//                Drag.hotSpot.y: 36

//                Text {
//                    text: visualIndex
//                    anchors {
//                        fill: parent
//                    }
//                    horizontalAlignment: Text.AlignHCenter
//                    verticalAlignment: Text.AlignVCenter
//                    font.pixelSize: 20
//                    scale: ((paintedWidth+10) > width) || (paintedHeight > height) ? Math.min(width / (paintedWidth+10), height / paintedHeight) : 1

//                }

//                states: [
//                    State {
//                        when: icon.Drag.active
//                        ParentChange {
//                            target: icon
//                            parent: root
//                        }

//                        AnchorChanges {
//                            target: icon;
//                            anchors.horizontalCenter: undefined;
//                            anchors.verticalCenter: undefined
//                        }
//                    }
//                ]
//            }

//            DropArea {
//                anchors { fill: parent; margins: 15 }

//                onEntered: visualModel.items.move(drag.source.visualIndex, delegateRoot.visualIndex)
//            }
//        }
//! [1]
    }
}

//import QtQuick 2.0

//Item {
//    width: 200; height: 200

//    DropArea {
//        x: 75; y: 75
//        width: 50; height: 50

//        Rectangle {
//            anchors.fill: parent
//            color: "green"

//            visible: parent.containsDrag
//        }
//    }

//    Rectangle {
//        x: 10; y: 10
//        width: 20; height: 20
//        color: "red"

//        Drag.active: dragArea.drag.active
//        Drag.hotSpot.x: 10
//        Drag.hotSpot.y: 10

//        MouseArea {
//            id: dragArea
//            anchors.fill: parent

//            drag.target: parent
//        }
//    }
//}
