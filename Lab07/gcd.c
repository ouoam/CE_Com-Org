#include <stdio.h>

int gcd(int a, int b);

int gcd(int a, int b) {
    while (a != b) {
        if (a > b) a = a - b;
        else b = b - a;
    }
    return a;
}

int main() {
    int a, b;
    scanf("%d %d", &a, &b);
    printf("gcd(%d, %d) = %d\n", a, b, gcd(a,b));
}

