#include <stdio.h>
#define int long long

int seven(int n, int b, int *arr);

int main()
{
    int n, b;
    scanf("%lld%lld", &n, &b);
    int a[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", &a[i]);
    }

    int ret = seven(n, b, a);
    printf("%lld\n", ret);

    return 0;
}