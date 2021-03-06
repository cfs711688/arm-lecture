#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  clock_t start, finish;

  scanf("%d",&number);
  start = clock();
  result = fibonacci(number);   
  finish = clock();

  FILE* fp = fopen("record.txt","a");
  fprintf(fp,"%d\t%lu\n",number,finish-start);
  fclose(fp);
  printf("done\n");
  //printf("The fibonacci sequence at %d is: %d\n", number, result);
  //printf("QAQ %lu\n",finish - start);
}

