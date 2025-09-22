#include <iostream>
using namespace std;

int main() {
    int Day;
    cout << "Enter day number (1-7): ";
    cin >> Day;

    string Days[] = {"Mantaha", "Labobeli", "Laboraro", "Labone", "Labohlano", "Moqebelo", "Sontaha"};

    if (Day >= 1 && Day <= 7)
        cout << "Day: " << Days[Day - 1] << endl;
    else
        cout << "Error: Invalid Day!" << endl;

    return 0;
}

