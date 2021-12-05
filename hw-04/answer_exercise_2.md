# Practica 4

## Parte II - Ejercicios GIT

**Crea un nuevo proyecto e inicializa git**

(Crear repositorio en github con el nombre “practica4”)

git config --global user.name "ariane10"

git config --global user.email "arianeguti10@gmail.com"

git clone https://github.com/ariane10/practica4.git

cd practica4

**Añade una regla para ignorar los ficheros de tipo .sh**

touch .gitignore

echo ".sh" >> .gitignore

**Crea dos ficheros vacíos: demo1.txt y demo2.txt. Añade estos ficheros al stage area**

touch demo1.txt

touch demo2.txt

git add demo1.txt

git add demo2.txt

**Añade contenido al fichero demo2. A continuación, realiza un commit con el mensaje “Modified demo3.txt”**

echo "Este es el documento demo 2" >> demo2.txt

git commit -m "Modified demo3.txt" demo2.txt 

**Rectifica el commit anterior con el mensaje “Modified demo2.txt”**

git commit --amend -m "Modified demo2.txt"

**Crea una nueva rama “develop” y añade un fichero script.sh que imprima por pantalla “Git 101”**

git branch develop

git checkout develop

nano script.sh

<img src="https://raw.githubusercontent.com/ariane10/linux-git-exercises/master/hw-04/capturas/Imagen4_1.png" height="100px">

**Da permisos de ejecución al script**

git update-index --chmod=+x script.sh

**Realiza un merge (develop -> master) para integrar los cambios**

git checkout main

git merge develop

**Sube todos los cambios a tu repositorio remoto**

git status

git add script.sh

git add .gitignore

git commit -m "Añadimos los archivos script.sh y .gitignore"

git push -u origin main


<img src="https://raw.githubusercontent.com/ariane10/linux-git-exercises/master/hw-04/capturas/Imagen4_2.png" height="300px">
