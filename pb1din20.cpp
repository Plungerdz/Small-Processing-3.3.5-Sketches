#include <iostream>

using namespace std;

int main()
{
    string n, p, voc="aeiouAEIOU";
    cin>>n;
    cin>>p;
    int s=n.size();
    for (int i=0; i<s; i++) {
        if (voc.find(p[i])>9) cout<<p[i];
    }
    cout<<" "<<n;
    return 0;
}
