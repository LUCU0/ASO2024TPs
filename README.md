# Repositorio del alumno **Lucio Mansilla Andreocci**

### Repositorio para la materia Arquitectura y Sistemas Operativos de la carrera Tecnicatura Universitaria en Programación en la universidad **UTN**.

  <p>

#### Respuestas al trabajo practico n°3

##### Punto 1 

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

</p>




