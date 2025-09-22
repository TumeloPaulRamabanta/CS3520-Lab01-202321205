#include <iostream>
using namespace std;

int main() {
    int cattle;
    cout << "Enter number of cattle: ";
    cin >> cattle;

    if (cattle < 8)
        cout << "Not enough for Mahali" << endl;
    else if (cattle < 20)
        cout << "Small herd" << endl;
    else
        cout << "Wealthy cattle owner" << endl;

    return 0;
}

