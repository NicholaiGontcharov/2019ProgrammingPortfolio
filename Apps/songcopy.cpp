#include <iostream>
using namespace std;

// main() is where program execution begins.
int main () {
   // Local variable declaration:
   int bottles = 99;

   // while loop execution
   while( bottles > 0 ) {
	if (bottles == 1) {
		cout << bottles << " bottle of root beer on the wall," << bottles << " bottle of root beer." << endl;
      		bottles--;
		cout << "Take it down and pass it around," << bottles << " bottle of root beer on the wall." << endl;

	} else {
		cout << bottles << " bottles of root beer on the wall," << bottles << " bottles of root beer." << endl;
      		bottles--;
		cout << "Take one down and pass it around," << bottles << " bottles of root beer on the wall." << endl;
	}
      		
   }
 
   return 0;
}
