#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<stdbool.h>
#include<ctype.h>

int main()
{
	int x;
	int y = 0;
	float z;
	printf("Podaj dlugosc zbioru: ");
	scanf("%d", &x);
	
	int zbior[x];
	
	

	while(y < x)
	{
		printf("Podaj %d element zbioru (liczba naturalna): ", y);
		if(scanf("%f", &z) == 1 && z >= 0 && fmod(z,1) == 0)
		{
			zbior[y] = z;
			y++;
		}
		else
			printf("To nie jest liczba naturalna.\n");
	}
	
	for (int i = 0; i < x; i++) 
	{
		printf("%d ", zbior[i]);
	}
	printf("\n");

	int permutacja[x];
	int cnt1 = x-1;

	for (int i = 0; i < x; i++)
	{

		srand(time(NULL));	
    	int l = rand() % (cnt1 + 1);
    	printf("Losowa liczba: %d ", l);

		permutacja[i] = zbior[l];
		
		int j = l;
		while(j <= cnt1)
		{
			zbior[j] = zbior[j+1];
			j++;
		}
		zbior[cnt1] = 0 ;
			
		for (int i = 0; i < x; i++) 
		{
			printf("%d ", zbior[i]);
		}
		printf("\n");
	
		for (int i = 0; i < x; i++) 
		{
			printf("%d ", permutacja[i]);
		}
		printf("\n");	
		
		
		cnt1--;
	}
	
	for (int i = 0; i < x; i++) 
	{
		printf("%d ", zbior[i]);
	}
	printf("\n");
	
		for (int i = 0; i < x; i++) 
	{
		printf("%d ", permutacja[i]);
	}
	printf("\n");	

	
	
	return 0;
}
