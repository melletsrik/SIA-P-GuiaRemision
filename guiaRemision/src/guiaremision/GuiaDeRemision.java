/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package guiaremision;

import java.util.Date;
import java.util.ArrayList;
/**
 *
 * @author Hector
 */
public class GuiaDeRemision{
        
        private static int ultimoIdGenerado = 10000;  // Inicia en 10000 para que el siguiente sea 10001

        private int id_cabecera;
        private String tipoComprobante;
        private String comprobante;
        private String sede;
        private String direccionPartidaDetalle;
        private String direccionLlegadaDetalle;
        private String direccionLlegadaReferencia;
        private String departamento;
        private String provincia;
        private String distrito;
        private String id_proveedor;
        private String descripcionProveedor;
        private String id_cliente;
        private ArrayList<DetalleProducto> DetallesProductos;
        private String id_transportista;
        private String id_vehiculo;
        private String num_factura;
        private Date fecha_emi;
        private String hora_emi;
        private String motivo_tras;
        private String modalidad;
        private String licenciaTransportista;
        private String placaVehiculo;
        

    public void setDetallesProductos(ArrayList<DetalleProducto> DetallesProductos) {
        this.DetallesProductos = DetallesProductos;
    }
        
        public GuiaDeRemision(){
            this.id_cabecera = ++ultimoIdGenerado;
        }

        public void setId_cabecera(int id_cabecera) {
            this.id_cabecera = id_cabecera;
        }

        public void setId_proveedor(String id_proveedor) {
            this.id_proveedor = id_proveedor;
        }

        public void setId_cliente(String id_cliente) {
            this.id_cliente = id_cliente;
        }

        public void setId_transportista(String id_transportista) {
            this.id_transportista = id_transportista;
        }

        public void setId_vehiculo(String id_vehiculo) {
            this.id_vehiculo = id_vehiculo;
        }

        public void setNum_factura(String num_factura) {
            this.num_factura = num_factura;
        }

        public void setFecha_emi(Date fecha_emi) {
            this.fecha_emi = fecha_emi;
        }

        public void setHora_emi(String hora_emi) {
            this.hora_emi = hora_emi;
        }

        public void setMotivo_tras(String motivo_tras) {
            this.motivo_tras = motivo_tras;
        }

        public void setModalidad(String modalidad) {
            this.modalidad = modalidad;
        }

        public void setDescripcionProveedor(String descripcionProveedor) {
            this.descripcionProveedor = descripcionProveedor;
        }

        public void setTipoComprobante(String tipoComprobante) {
            this.tipoComprobante = tipoComprobante;
        }

        public void setComprobante(String comprobante) {
            this.comprobante = comprobante;
        }

        public void setSede(String sede) {
            this.sede = sede;
        }

        public void setDireccionPartidaDetalle(String direccionPartidaDetalle) {
            this.direccionPartidaDetalle = direccionPartidaDetalle;
        }

        public void setDireccionLlegadaDetalle(String direccionLlegadaDetalle) {
            this.direccionLlegadaDetalle = direccionLlegadaDetalle;
        }

        public void setDireccionLlegadaReferencia(String direccionLlegadaReferencia) {
            this.direccionLlegadaReferencia = direccionLlegadaReferencia;
        }

        public void setDepartamento(String departamento) {
            this.departamento = departamento;
        }

        public void setProvincia(String provincia) {
            this.provincia = provincia;
        }

        public void setDistrito(String distrito) {
            this.distrito = distrito;
        }

        public void setLicenciaTransportista(String licenciaTransportista) {
            this.licenciaTransportista = licenciaTransportista;
        }

        public void setPlacaVehiculo(String placaVehiculo) {
            this.placaVehiculo = placaVehiculo;
        }

    }