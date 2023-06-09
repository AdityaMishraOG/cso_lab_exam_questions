#include <stdio.h>
#define int long long

int three(int n);

int main()
{
    int n;
    scanf("%lld", &n);

    int ret = three(n);
    if (ret)
    {
        printf("True\n");
    }
    else
    {
        printf("False\n");
    }

    return 0;
}