#include <stdio.h>
#define int long long

void ten(int n, int *arr, int *ans);

int main()
{
    int n;
    scanf("%lld", &n);
    int arr[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", arr + i);
    }
    int ans[n];
    ten(n, arr, ans);

    for (int i = 0; i < n; i++)
    {
        printf("%lld ", ans[i]);
    }
    printf("\n");

    return 0;
}