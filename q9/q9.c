#include <stdio.h>
#define int long long

int nine(int n, int *arr);
int main()
{
    int n;
    scanf("%lld", &n);
    int arr[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    int ret = nine(n, arr);
    printf("%lld\n", ret);
    // printf("sorted array is: ");
    // for (int i = 0; i < n; i++)
    // {
    //     printf("%lld ", arr[i]);
    // }
    // printf("\n");

    return 0;
}