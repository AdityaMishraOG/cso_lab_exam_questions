#include <stdio.h>
#define int long long

int twelve(int n, int *arr, int x);

int main()
{
    int n, x;
    scanf("%lld%lld", &n, &x);
    int arr[2 * n];
    for (int i = 0; i < 2 * n; i++)
    {
        scanf("%lld", &arr[i]);
    }

    int ret = twelve(n, arr, x);
    // printf("%lld\n", ret);
    // for (int i = 0; i < 2 * n; i++)
    // {
    //     printf("%lld ", arr[i]);
    // }
    // printf("\n");

    if (ret)
    {
        printf("YES\n");
    }
    else
    {
        printf("NO\n");
    }
    return 0;
}