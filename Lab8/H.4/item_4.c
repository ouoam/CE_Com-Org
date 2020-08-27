#include <stdio.h>
int main() {
	int a, b;
	scanf("%d %d", &a, &b);
	int i = gcd(a, b);
	printf("gcd(%d, %d) = %d\n", a, b, i);
}
