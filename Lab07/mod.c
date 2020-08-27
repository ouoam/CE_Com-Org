#include <stdio.h>

int mod(int a, int b);

int mod(int a, int b) {
    while(a >= b) a -= b;
    return a;
}

int main() {
    int a, b;
    scanf("%d %d", &a, &b);
    printf("%d %% %d = %d\n", a, b, mod(a,b));
}

