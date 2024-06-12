![LOGO](https://www.frbb.utn.edu.ar/frbb/wp-content/uploads/2023/05/logo70.png) 

# Repositorio para la carrera [Tcnicatura Universitaria en Programación](https://www.frbb.utn.edu.ar/frbb/sacad/carreras/tup/) de la **UTN**
### **Alumno:** [Lucio Mansilla Andreocci](https://github.com/LUCU0)
### **Materia:** Arquitectura y Sistemas Operativos
### **Profesores:** Gustavo Ramoscelli y [Sergio Antozzi](https://github.com/santozzi)

#
![HackerPcGIF](https://github.com/LUCU0/ASO2024TPs/assets/72327972/2d990296-3f45-44ca-adfb-45fc1a4fc460)

# Trabajo Practico N°1 ✅
### Tomar una captura de pantalla con VSCode y código python y subirla en la tarea del aula virtual.
- [Captura del código de python](https://github.com/LUCU0/ASO2024TPs/blob/main/TP1/Captura%20de%20pantalla_2024-05-13_18-41-50.png)
- **Código usado:** `print("Hola mundo")`

# Trabajo Practico N°2



#### **Respuestas al trabajo practico n°3**

#### **PUNTO 1**

##### **a) ¿Qué se puede notar con respecto al tiempo de ejecución? ¿Es predecible?**
Lo que se puede notar entre una ejecución y otra del mismo archivo es una diferencia mínima en el tiempo, mientras que si se compara el tiempo de ejecución de un archivo y del otro se nota mucho la diferencia de tiempo entre una y otra.
No no es predecible ya que los dos archivos son distintos y la ejecución hace cosas diferentes.

##### **b) Comparar con un compañero el tiempo de ejecución. ¿Son iguales?**  
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

##### **C) Ejecutar el archivo suma_rasta.py unas 10 veces, luego descomentar (borrar el #) las líneas 11,12,19 y 20 guardarlo y ejecutarlo otras 10 veces. ¿Qué pasó? ¿Por qué?**
En mi caso lo que paso fue que al ajecutar las 10 veces el archivo con las lineas comentadas el valor final me daba 0 y solamente 3 veces me dio otros valores que fueron 280455, -219795 y -92720, con unos tiempos que variaban entre 0.01 y 0.06, y una sola vez salio con un pico de 0.26 segundos. Mientras que el archivo con las lineas descomentadas lo que mas cambio fueron los valores finales que no dieron 0 daban numeros negativos y positivos sin pasarce de los 500000 y los -500000, con los tiempos tambien fue un cambio grande, los tiempos fueron desde 8.6 a 11.14 segundos.
Esto sucede porque se le agrega un for y un pass.

Lo que paso es que hay 2 hilos que modifican la misma variable global simultaneamente sin sincronizacion lo que proboca una race condition generando resultados impredecibles.


#### **PUNTO 2**

##### **A) Tu tarea será colocar las líneas de código en los lugares adecuados para poder resolver el problema de las hamburguesas de distribución equitativa.** 

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
		while(turno!=(int)tid);
		
			if (cantidad_restante_hamburguesas > 0)
			{
				printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
				cantidad_restante_hamburguesas--; // me como una hamburguesa
			}
			else
			{
				printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
				turno = (turno + 1)% NUMBER_OF_THREADS;
				pthread_exit(NULL); // forzar terminacion del hilo
			}
    	// SALIDA DE LA ZONA CRÍTICA   
		turno = (turno + 1)% NUMBER_OF_THREADS;
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
	}
	pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
```
##### **B) Viendo la figura 2-22, como sería para el problema de las hamburguesas con 2 comensales y 8 hamburgesas.**

![Diagrama_blanco_hamburguesa drawio](https://github.com/LUCU0/ASO2024TPs/assets/72327972/e7b8e6c4-e5ea-43bf-92f7-8ef59d5bde62)


