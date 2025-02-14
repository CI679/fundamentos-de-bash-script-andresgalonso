
#!/bin/bash
#tipos de variables universales: -> Bolean,num
n1=10
n2=7
echo "El valor de n1 es $n1"

#Estructuras de control condicionales 
#Operadores condicionales < (-lt) > (-gt) <= (-le) => (-ge) == (-eq) != (-ne)
#Importante usar doble corchete cuando usamos la estructura de bandera de los operadores
if [[ $n1 -gt $n2 ]]; then 
    echo "La sentencia es verdadera $n1 $2"
else
    echo "La sentencia es falsa $n1 $n2"
fi

#Todo programa regresa un valor , si es exitoso 0
#El signo $ hace referencia al valor contendio en la variable 
res=$?
echo "El resultado de la ejecusion es $res"

if [[ $? -eq 0 ]]; then
    echo "La ejecusion es correcta"
else
    echo "La sentencia falla"
fi

#Operadores para manipular archivos
# -e Si un archivo o carpeta existe 
# -d nos indica si es una carpeta
# -r -w -x (Si puede leer,escribir,ejecutar) 
# -s Sirve para validar si el archivo tiene contenido

file="./file-demo"

if [[ -s $file ]]; then
    echo "El archivo tiene algo "
else
    echo "El archivo esta vacio "
fi

#Operadores logicos ANS && OR ||

if [ -r $file ] && [ -x $file ]; then
    echo "El archivo se puede leer y ejecutar "
else
    echo "El archivo no se puede leer ni ejecutar "
fi

#ESTRUCTURA DE CONTROL CASE (switch)

# $ =array donde $# ($1...$n)
# - (badnera) hola(es un parametro que recibe )
#Importante el ) para marcar el fin

case $1 in 
    hola ) 
        echo "Bienvenidx"
    ;;
    adios )
        echo "Adios "
    ;;
    *)
        echo "No entiendo :( "
    ;;
esac

#Estructuras iterativas
#For (tipo each - objeto iterador donde el indice esta embebido donde funciona con el valor del objeto iterado)
for i in {1..5}; do
    echo "El numero es $i"
done

invitados=(pedro juan david maria lulu ivan)
for invitado in ${invitados[@]}; do
    echo "hola $invitado"
done

#For (maneja el indice )
for ((i=0; i<5; i++)); do
    echo  "* el numero es $i"
done

#While 
#Aqui recibe el parametro user
user=""
while [[ $user != "admin" ]]; do
    read -p "Cual es tu usuario?" user
done

#FUNCIONES
#Las variables en bash de las funciones no son posicionales 
suma()
{
    echo "Hola desde la funcion sumar. "
}

resta(){
    echo $(( $1 - $2 ))
}

suma
total=$(resta 9 4)
echo "El valor de total es $total"