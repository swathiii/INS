BEGIN {
	#include<stdio.h>
	count=0;
}
{ 
	if($1=="d")
		count++;
}
END {
	printf("the number of packets dropped are: %d\n", count);
}
