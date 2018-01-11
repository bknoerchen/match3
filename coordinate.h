#pragma once

#include <initializer_list>
#include <stdexcept>

#include <QPair>

class Coordinate
{
public:
	// usage Coordinate(qMakePair(1,0)
    explicit Coordinate(const QPair<int, int> & pair)
        : data_(pair)
    {
    }

	// usage Coordinate({1, 0})
    Coordinate(std::initializer_list<int> l)
    {
        if (l.size() != 2)
            throw std::invalid_argument("initializer list should contain only two elements");
        data_.first = *l.begin();
        data_.second = *(l.begin() + 1);
    }

    int x() const { return data_.first; }
    void setX(int x) { data_.first = x; }
    int y() const { return data_.second; }
    void setY(int y) { data_.second = y; }

private:
    QPair<int, int> data_;
};
