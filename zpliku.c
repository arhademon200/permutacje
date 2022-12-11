#include<stdio.h>
#include<stdlib.h>


int main() 
{

 	FILE *conf;
	if((conf = fopen("1.conf","r")) == NULL)
	{
		printf("Blad przy probie odczytu.\n");
		exit(1);
	}
	
	int liczba;
	fscanf(conf,"%d", &liczba);
	printf("%d",liczba);
	
	
	
	fclose(conf);




	return 0;
}

