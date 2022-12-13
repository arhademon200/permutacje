    // open the file for writing
    FILE *fp = fopen(filename, "w");
    if (fp == NULL)
    {
        printf("Error opening the file %s", filename);
        return -1;
    }
    // write to the text file
    fprintf(fp,"\\documentclass{article}\n");
    fprintf(fp,"\\usepackage[T1]{fontenc}\n");
    fprintf(fp,"\\usepackage{array}\n");
    fprintf(fp,"\\usepackage{booktabs}\n");
    fprintf(fp,"\\begin{document}\n");
    for(int x = 0; x < 5; x++)
    {
        fprintf(fp,"\\section{permutacja}\n");
        for(int z = 0; z < 5; z++)
        {
            fprintf(fp,"\\begin{tabular}{|c|c|}\n");
            fprintf(fp,"\\toprule\n");
            for(int y = 0; y < 5; y++)
            {
                fprintf(fp,"\\midrule\n");
                fprintf(fp," & (1,2,1,2,1) (1,2,1,2,1) (1,2,1,2,1) \\\\ \\hline\n");
            }
            fprintf(fp,"\\bottomrule\n");
            fprintf(fp,"\\end{tabular}\n");
        }
    }
    fprintf(fp,"\\end{document}\n");
    // close the file
    fclose(fp);
