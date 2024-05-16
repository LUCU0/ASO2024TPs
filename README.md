# Repositorio del alumno **Lucio Mansilla Andreocci**

### Repositorio para la materia Arquitectura y Sistemas Operativos de la carrera Tecnicatura Universitaria en Programación en la universidad **UTN**.

#### Respuestas al trabajo practico n°3

#### PUNTO 1 

##### a) ¿Qué se puede notar con respecto al tiempo de ejecución? ¿Es predecible?
Lo que se puede notar entre una ejecución y otra del mismo archivo es una diferencia mínima en el tiempo, mientras que si se compara el tiempo de ejecución de un archivo y del otro se nota mucho la diferencia de tiempo entre una y otra.
No no es predecible ya que los dos archivos son distintos y la ejecución hace cosas diferentes.

##### b) Comparar con un compañero el tiempo de ejecución. ¿Son iguales?  
No son iguales debido a que puede haber una diferencia de hardware pero si son muy cercanos a los tiempos mios. Los tiempos fueron comparados con Gianluca zanconi.


|               |   Con hilos   |   Sin hilos   |                 
| ------------- | ------------- | ------------- |
|               |    4.08403    |    5.82521    |
|     Lucio     |    4.22170    |    5.96885    |
|    Mansilla   |    4.39649    |    5.80448    |
|               |    4.08193    |    5.70118    |
| ------------- | ------------- | ------------- |
|               |    4.02625    |    5.16484    |
|    Gianluca   |    4.04216    |    5.16868    |
|    Zanconi    |    4.04913    |    5.18182    |
|               |    4.03406    |    5.19020    |
| ------------- | ------------- | ------------- | 

##### C) Ejecutar el archivo suma_rasta.py unas 10 veces, luego descomentar (borrar el #) las líneas 11,12,19 y 20 guardarlo y ejecutarlo otras 10 veces. ¿Qué pasó? ¿Por qué?
En mi caso lo que paso fue que al ajecutar las 10 veces el archivo con las lineas comentadas el valor final me daba 0 y solamente 3 veces me dio otros valores que fueron 280455, -219795 y -92720, con unos tiempos que variaban entre 0.01 y 0.06, y una sola vez salio con un pico de 0.26 segundos. Mientras que el archivo con las lineas descomentadas lo que mas cambio fueron los valores finales que no dieron 0 daban numeros negativos y positivos sin pasarce de los 500000 y los -500000, con los tiempos tambien fue un cambio grande, los tiempos fueron desde 8.6 a 11.14 segundos.
Esto sucede porque se le agrega un for y un pass.

#### PUNTO 2

##### **A)** 

```c
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void *comer_hamburguesa(void *tid)
{
	while (1 == 1)
	{ 
		
    // INICIO DE LA ZONA CRÍTICA
		if (cantidad_restante_hamburguesas > 0)
		{
			while(turno!=(int)tid);
			{
				printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
				cantidad_restante_hamburguesas--; // me como una hamburguesa
				turno = (turno + 1)% NUMBER_OF_THREADS;
			}
		}
		else
		{
			printf("SE TERMINARON LAS HAMBURGUESAS :( \n");

			pthread_exit(NULL); // forzar terminacion del hilo
		}
    // SALIDA DE LA ZONA CRÍTICA   

	}
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i, ret;
	for (int i = 0; i < NUMBER_OF_THREADS; i++)
	{
		printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
		status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
		if (status != 0)
		{
			printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
			exit(-1);
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++)
	{
		void *retval;
		ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
		turno = (turno + 1)% NUMBER_OF_THREADS;
	}
	pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
```



