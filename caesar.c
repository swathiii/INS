#include<stdio.h>
#include<string.h>
int main()
{
//A-X,B-Y,C-Z,D-A,E-B,F-C... if number=1
//A-W,B-X,C-Y,D-Z,E-A,F-B... if number=2 and so on
 
 int i,number;
 char str[1000];
 printf("Enter a sentence\n");
 gets(str); 
 printf("Enter the number to change alphabetical order\n");
 scanf("%d",&number);
 i=0;
 number%=26;
 printf("Encrypted Caesar code\n\n");
  while(str[i]!='\0')
  {
     if(!((str[i]>=0&&str[i]<65)||(str[i]>90&&str[i]<97)||(str[i]>122&&str[i]<=127)))
     {
       if((str[i]>'a'+number+1)&&(str[i]<='z'))
       printf("%c",str[i]-number-2);
       else if((str[i]>'A'+number+1)&&(str[i]<='Z'))  
       printf("%c",str[i]-number-2);
       else
       printf("%c",str[i]+24-number);
     } 
    
    if(((str[i]>=0&&str[i]<65)||(str[i]>90&&str[i]<97)||(str[i]>122&&str[i]<=127)))
    {
      printf("%c",str[i]);    
    }
    
   i++;
  }
  printf("\n");
 
}
