#include <stdio.h>
#define int long long

void two(int n, int *ans);

int main()
{
    int n;
    scanf("%lld", &n);
    int ans[n];
    two(n, ans);

    for (int i = 0; i < n; i++)
    {
        printf("%lld ", ans[i]);
    }
    printf("\n");

    return 0;
}