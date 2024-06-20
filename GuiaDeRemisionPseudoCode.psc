Funcion bool_Authentication <- VerifyUser ( DocUser, PassUser )

	Si DocUser = 7268 Y PassUser = 2103 Entonces //Verificacion en la base de datos
		bool_Authentication<-Verdadero
	SiNo
		bool_Authentication<-Falso
	Fin Si
Fin Funcion

Funcion running <- Login 
	//Login
	Escribir ("Inicio de sesion")
	Escribir ("Tipo de documento")
	Escribir ("1. RUC")
	Escribir ("2. DNI")
	Leer Tipo_Doc
	
	Mientras (Tipo_Doc < 1  o  Tipo_Doc > 2) Hacer
		Escribir ("Ingrese una opcion valida")
		Leer Tipo_Doc
	Fin Mientras
	
	Escribir ("Documento")
	Leer Usuario_Doc
	Escribir ("Contraseña")
	Leer Usuario_pass
	Mientras !VerifyUser(Usuario_Doc, Usuario_pass)  Hacer
		Escribir ("El documento y la contraseña no coinciden")
		Escribir ("Documento")
		Leer Usuario_Doc
		Escribir ("Contraseña")
		Leer Usuario_pass
	Fin Mientras
	
	Escribir ("Bienvenido de vuelta")
	running = Falso
Fin Funcion

Algoritmo GuiaDeRemision
	running = Verdadero
	Mientras running Hacer
		Escribir ("Sistema de Guia de Remision")
		Escribir ("1. Login")
		Escribir ("2. Recuperacion de contraseña")
		Escribir ("3. Registro de usuario")
		Leer option
		Segun option Hacer
			1:
				running = Login()
			2:
				Escribir ("Recuperacion de pass")
			3:
				Escribir ("Registro de usuario")
			De Otro Modo:
				Escribir ("Ingrese una opcion valida")
		Fin Segun
	Fin Mientras
	
	//Recuperacion de Contraseña
	
	//Registro de Usuario
	
	//Agregar proveedor
	
	//Documento de proveedor
	//Bienes a transportar
	//Punto de llegada y punto de partida
	//Modalida de traslado
	
	//Emision de Guia de remision
FinAlgoritmo
