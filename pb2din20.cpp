int main()
{
    string s, init;
    getline(cin,s);
    int i=s.size()-1;
    while (s[i]!=' ') i--;
    init=s[i+1];
    init+='.';
    while (s[i]==' ') i--;
    for (int j=0; j<=i; j++) {
        cout<<s[j];
    }
    cout<<" "<<init;
 }
