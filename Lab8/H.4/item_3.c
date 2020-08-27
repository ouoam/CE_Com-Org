#include <stdio.h>
int main() {
	int a, b;
	scanf("%d %d", &a, &b);
	int i = mod(a, b);
	printf("mod(%d, %d) = %d\n", a, b, i);
}
