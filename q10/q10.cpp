#include <bits/stdc++.h>
using namespace std;
void printarr(int n, int v[])
{
    for (int i = 0; i < n; i++)
    {
        cout << v[i] << " ";
    }
    cout << "\n";
}

void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}

void bubblesortreverse(int n, int *a)
{
    for (int i = n - 1; i >= 0; i--)
    {
        for (int j = 0; j < i; j++)
        {
            if (a[j] < a[j + 1])
            {
                swap(&a[j], &a[j + 1]);
            }
        }
    }
}
int main()
{

    int n;
    cin >> n;
    // string s;
    // cin >> s;
    int tot = 0;
    int *a = (int *)malloc(n * sizeof(int));

    for (int i = 0; i < n; i++)
    {
        cin >> a[i];
    }

    for (int i = 0; i < n; i++)
    {
        if (a[i] == 1)
        {
            a[i] = (i - (n - 1 - i));
            // cout << n - 1 - i << "\n";
            tot += n - 1 - i;
        }
        else
        {
            a[i] = ((n - 1 - i) - i);
            // cout << i << "\n";
            tot += i;
        }
    }

    cout << "tot = " << tot << "\n";

    printarr(n, a);
    // sort(a, a + n, greater<int>());
    bubblesortreverse(n, a);
    printarr(n, a);

    int ans[n];
    for (int i = 0; i < n; i++)
    {
        if (a[i] > 0)
        {
            tot += a[i];
        }
        // cout << "i = " << i << "\n";
        // cout << "tot = " << tot << "\n";
        ans[i] = tot;
    }

    printarr(n, ans);
    return 0;
}