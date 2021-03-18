#ifndef USER_H
#define USER_H


class User
{
public:
    User();
    char getMark();
    void setMark(char mark) const;
private:
    char mark;

};

#endif // USER_H
