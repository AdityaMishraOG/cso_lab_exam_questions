#include <stdio.h>
#define int long long int

int one(int x);

int main()
{
    int x;
    scanf("%lld", &x);
    int ret = one(x);
    printf("%lld\n", ret);

    return 0;
}