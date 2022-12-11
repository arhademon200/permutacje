#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<math.h>


int main()
{
	int x, y = 0;
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

	bool ppd = true;
	int k = x-1;
    while(ppd)
    {
		if(k == 0)
		{
			printf("Nie ma poprzedniej permutacji.\n");
			break;
		}
		
		else if(zbior[k-1] > zbior[k])
		{   
			int tmp = zbior[k];
			zbior[k] = zbior[k-1];
			zbior[k-1] = tmp;
			break;
		}
		k--;

		
    }

    for (int i = 0; i < x; i++) 
	{
		printf("%d ", zbior[i]);
	}
	printf("\n");
}	
