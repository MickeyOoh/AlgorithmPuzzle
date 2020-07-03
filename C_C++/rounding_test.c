#include <stdio.h>
#include <stdlib.h>

int main(void){
int a, b;
int x, y;
  a = 1;
  b = 1;
  
  for(a = 1; a <= 10000; a++){
    for(b = 1; b <= 10000; b++){
      if( a >= b) continue;
      x = (b * 10)/a;
      x = (x + 5)/10;
      y = (b + a/2)/a;
      if( x != y){
        printf("%5d//%5d  %5d != %5d\n", b, a, x, y);
        goto exit;
      } else {
        //printf("%5d//%5d ==\n", b, a);
      }
    }
  }
exit:
  exit(0);
}
