#include<stdio.h>
#include<stdlib.h>
#include <math.h>
#include<time.h>
#include<stdbool.h>
#include<ctype.h>

int main()
{
int y = 0;
while(y<10)
{
	double value;
	scanf("%lf", &value);
	if (scanf("%lf", &value) == 1)
    		printf("It's float: %f\n", value);
	else
    		printf("It's NOT float ... \n");
    	y++;
}
}
