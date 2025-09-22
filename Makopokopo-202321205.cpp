#include <iostream>
using namespace std;

int main() {
    int litres;
    cout << "Enter quantity of grains (in litres): ";
    cin >> litres;

    int makopokopo = litres / 20;   // 1 lekopokopo = 20L
    int remainder = litres % 20;    // remainder

    cout << "Makopokopo (20L each): " << makopokopo << endl;
    cout << "Remainder: " << remainder<<"litres" << endl;

    return 0;
}

