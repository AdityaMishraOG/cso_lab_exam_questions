#include <stdio.h>
#define int long long

int eleven(int n, int *arr);

int main()
{
    int n;
    scanf("%lld", &n);
    int a[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", &a[i]);
    }
    eleven(n, a);
    for (int i = 0; i < n; i++)
    {
        printf("%lld ", a[i]);
    }
    printf("\n");

    return 0;
}