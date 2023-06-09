#include <stdio.h>
#define int long long

int four(int n, int m);

int main()
{
    int n, m;
    scanf("%lld%lld", &n, &m);
    int ret = four(n, m);
    printf("%lld\n", ret);
    return 0;
}