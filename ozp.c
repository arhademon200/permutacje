#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

#define MAX_LINIA 2048

int main()
{
	FILE *conf;
	
	char buffer[MAX_LINIA];
	char podrozdzialy[MAX_LINIA];
	
	
	conf = fopen("1.conf", "r");
	
	if(conf == NULL)
	{
		printf("Error opening file.\n");
		exit(1);
	}

	
	int czytana_linia = 1;
	
	while(fgets(buffer, MAX_LINIA, conf))
	{
		printf("Linia %d: %s", czytana_linia, buffer);
		czytana_linia++;
		if(czytana_linia > 1)
		{
			char c;
			int i;
			while((c=fgetc(conf))!=EOF)
			{
				podrozdzialy[i] = c;
			}
		}	
	}

	fclose(conf);
	
	printf ("tab = [");
	for (int i=0; i<10 -1; i++)
		printf ("%d, ", buffer [i]);
	printf ("%d]\n", buffer [10]);



	return 0;
}
