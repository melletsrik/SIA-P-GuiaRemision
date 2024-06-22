Funcion setPassword ( pass, Email )
	//Modify en la base de datos
Fin Funcion

Funcion  enviarCorreo ( email )
	//enviar correo
Fin Funcion

Funcion bool_AuthenticationEmail <- VerifyExistingEmail ( Email )
	Si DocUser = 7268 Entonces //Verificacion de la existencia en la base de datos (Consulta SQL)
		bool_AuthenticationEmail<-Verdadero
	SiNo
		bool_AuthenticationEmail<-Falso
	Fin Si
Fin Funcion

Funcion document <- VerifyTypeDocument ( Doc, type )
	Segun Doc Hacer
		1://	RUC
			Si Doc >  99999999999 o Doc < 10000000000 Entonces
				document <- -1
			SiNo
				document <- doc
			Fin Si
		2://	DNI
			Si Doc >  99999999 o Doc < 10000000 Entonces
				document <- -1
			SiNo
				document <- doc
			Fin Si
	Fin Segun
Fin Funcion

Funcion bool_AuthenticationUser <- VerifyUser ( DocUser, PassUser )
	Si DocUser = 7268 Y PassUser = 2103 Entonces //Verificacion en la base de datos
		bool_AuthenticationUser<-Verdadero
	SiNo
		bool_AuthenticationUser<-Falso
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

Funcion running <- RecoverPass
	Escribir  ("Escriba el correo electronico al cual esta relacionado su cuenta")
	Leer email_User
	codeRecover<-1234 //Numero generado aleatoriamente de 4 digitos
	Si VerifyExistingEmail(email_User) Entonces
		
		enviarCorreo(email_User)//Funcion para enviar el codigo a su correo
		Escribir ("Escriba el codigo que se le acaba de mandar al correo electronico")
		
		Leer codeReceived
		Mientras codeReceived <> codeRecover Hacer
			Escribir  ("El codigo es incorrecto")
			Escribir ("Escriba el codigo que se le acaba de mandar al correo electronico")
			Leer codeReceived
		Fin Mientras
		Escribir ("Verificacion correcta")
		Escribir ("Escriba la nueva contraseña para su cuenta")
		Leer newPassword
		setPassword(newPassword, email_User)
	SiNo
		Escribir ("El correo escrito no se encuentra en los registros")
	Fin Si
	running = Verdadero
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
	

	
	//Registro de Usuario
	
	//Agregar proveedor
	
	//Documento de proveedor
	//Bienes a transportar
	//Punto de llegada y punto de partida
	//Modalida de traslado
	
	//Emision de Guia de remision
FinAlgoritmo
