import mysql.connector

class RegistroDatos:

    def __init__(self):
        self.conexion = mysql.connector.connect(
            host='localhost',
            database='db_guiaRemision',
            user='root',
            password=''
        )

    def agregar_cliente(self, id_cliente, nombre, apellido, ruc, direccion, telefono):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO MAE_CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, RUC, DIRECCION, TELEFONO) 
                 VALUES (%s, %s, %s, %s, %s, %s)'''
        values = (id_cliente, nombre, apellido, ruc, direccion, telefono)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_clientes(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM MAE_CLIENTE"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def agregar_proveedor(self, id_proveedor, nombre, apellido, direccion, telefono, correo):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO MAE_PROVEEDOR (ID_PROVEEDOR, NOMBRE, APELLIDO, DIRECCION, TELEFONO, CORREO) 
                 VALUES (%s, %s, %s, %s, %s, %s)'''
        values = (id_proveedor, nombre, apellido, direccion, telefono, correo)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_proveedores(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM MAE_PROVEEDOR"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def agregar_producto(self, id_producto, nombre, descripcion, peso, unidad):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO MAE_PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, PESO, UNIDAD) 
                 VALUES (%s, %s, %s, %s, %s)'''
        values = (id_producto, nombre, descripcion, peso, unidad)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_productos(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM MAE_PRODUCTO"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def agregar_transportista(self, id_transportista, nombre, apellido, dni, num_licencia):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO MAE_TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO, DNI, NUM_LICENCIA) 
                 VALUES (%s, %s, %s, %s, %s)'''
        values = (id_transportista, nombre, apellido, dni, num_licencia)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_transportistas(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM MAE_TRANSPORTISTA"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def agregar_vehiculo(self, id_vehiculo, placa, categoria, capacidad, ind_retorno):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO MAE_VEHICULO (ID_VEHICULO, PLACA, CATEGORIA, CAPACIDAD, IND_RETORNO) 
                 VALUES (%s, %s, %s, %s, %s)'''
        values = (id_vehiculo, placa, categoria, capacidad, ind_retorno)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_vehiculos(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM MAE_VEHICULO"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def agregar_cabecera_guia_remision(self, id_cabecera, id_proveedor, id_cliente, id_transportista, id_vehiculo,
                                       num_guia, fecha_emi, hora_emi, motivo_tras, modalidad):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO TRS_CABECERA_GR (ID_CABECERA, ID_PROVEEDOR, ID_CLIENTE, ID_TRANSPORTISTA, ID_VEHICULO, 
                 NUM_GUIA, FECHA_EMI, HORA_EMI, MOTIVO_TRAS, MODALIDAD) 
                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''
        values = (id_cabecera, id_proveedor, id_cliente, id_transportista, id_vehiculo, num_guia, fecha_emi, hora_emi,
                  motivo_tras, modalidad)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_cabeceras_guia_remision(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM TRS_CABECERA_GR"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def agregar_detalle_guia_remision(self, id_cabecera, id_producto, num_factura, cantidad_prod, peso_total):
        cur = self.conexion.cursor()
        sql = '''INSERT INTO TRS_DETALLE_GR (ID_CABECERA, ID_PRODUCTO, NUM_FACTURA, CANTIDAD_PROD, PESO_TOTAL) 
                 VALUES (%s, %s, %s, %s, %s)'''
        values = (id_cabecera, id_producto, num_factura, cantidad_prod, peso_total)
        cur.execute(sql, values)
        self.conexion.commit()
        cur.close()

    def mostrar_detalles_guia_remision(self):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM TRS_DETALLE_GR"
        cursor.execute(sql)
        registros = cursor.fetchall()
        cursor.close()
        return registros

    def cerrar_conexion(self):
        if self.conexion.is_connected():
            self.conexion.close()

# PRUEBAS:

registro = RegistroDatos()

# Agregar un cliente
registro.agregar_cliente(1000, 'Constructora Los Cedros', 'Martínez', '20123456789', 'Av. Caminos del Inca 234, Lima', '977665544')

# Mostrar todos los clientes
clientes = registro.mostrar_clientes()
print("Clientes:")
for cliente in clientes:
    print(cliente)

# Agregar un proveedor
registro.agregar_proveedor(1000, 'Distribuidora La Roca', 'Sánchez', 'Av. Los Alisos 123, Lima', '998877665', 'info@laroca.com')

# Mostrar todos los proveedores
proveedores = registro.mostrar_proveedores()
print("\nProveedores:")
for proveedor in proveedores:
    print(proveedor)

# Agregar un producto
registro.agregar_producto(1000, 'Ladrillos Cerámicos', 'Ladrillos de cerámica para construcción', 3.5, 'kg')

# Mostrar todos los productos
productos = registro.mostrar_productos()
print("\nProductos:")
for producto in productos:
    print(producto)

# Agregar un transportista
registro.agregar_transportista(1000, 'Transportes Gómez', 'García', '11223344', 'LIC-001')

# Mostrar todos los transportistas
transportistas = registro.mostrar_transportistas()
print("\nTransportistas:")
for transportista in transportistas:
    print(transportista)

# Agregar un vehículo
registro.agregar_vehiculo(1000, 'ABC-123', 'Camión', 5000.0, True)

# Mostrar todos los vehículos
vehiculos = registro.mostrar_vehiculos()
print("\nVehículos:")
for vehiculo in vehiculos:
    print(vehiculo)