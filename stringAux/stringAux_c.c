#include <stdio.h>

extern unsigned char string_longitud(char *s);
extern char *string_copiar(char *s);
extern int string_menor(char *s1, char *s2);


int main(){
  char *ms = "hola mi amor";
  unsigned int x = string_longitud(ms);
   



  printf("\n La longitud del string %s es: %d\n",ms, x);

  char *je;
  je = string_copiar(ms);

  printf("\n El string copiado es: %s\n", je);

  char *msg = "caSa";
  char *msg2 = "casa";


  int y = string_menor(msg, msg2);

  printf("\n x: %d", y);

  if (y == 1){
    printf("\n msg es menor que msg2 \n");
  } else {
    printf("\n msg2 es menor que msg \n");
  }
    printf("\n %ld \n", sizeof(x));

    printf("\n %ld \n", sizeof(je));

  return 0;
}
