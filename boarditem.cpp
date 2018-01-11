#include "boarditem.h"

BoardItem::BoardItem()
    : type_(Invalid)
{

}

BoardItem::BoardItem(FieldItemType type)
    : type_(type)
{

}
