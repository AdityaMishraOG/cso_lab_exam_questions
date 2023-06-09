#include <stdio.h>
#include <stdlib.h>
#define int long long

// int six(int n, int m, int **arr);
int six(int n, int m, int arr[][m]);

int main()
{
    int n, m;
    scanf("%lld%lld", &n, &m);
    int arr[n][m];
    // int **arr = (int **)malloc(n * sizeof(int *));
    // for (int i = 0; i < n; i++)
    // {
    //     arr[i] = (int *)malloc(m * sizeof(int));
    // }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            scanf("%lld", &arr[i][j]);
        }
    }

    int ret = six(n, m, arr);
    printf("%lld\n", ret);

    return 0;
}