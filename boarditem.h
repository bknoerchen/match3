#pragma once

class BoardItem
{
public:
	enum FieldItemType {
		Invalid,
		Red,
		Blue
	};

	BoardItem();
	BoardItem(FieldItemType type);

private:
	FieldItemType type_;
};
