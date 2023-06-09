#include <stdio.h>
#define int long long

int eight(int n, int *arr);
int main()
{
    int n;
    scanf("%lld", &n);
    int arr[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    int ret = eight(n, arr);
    // printf("%lld\n", ret);
    for (int i = 0; i < n; i++)
    {
        printf("%lld ", arr[i]);
    }
    printf("\n");

    return 0;
}