package guiaremision;

import java.util.ArrayList;
import java.sql.Date;
import java.sql.Time;

public class GuiaDeRemision{
        
    private static int ultimoIdGenerado = 10000;  // Inicia en 10000 para que el siguiente sea 10001

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
    private String id_vehiculo;
    private String num_factura;
    private Date fecha_emi;
    private String motivo_tras;
    private String modalidad;
    private String placaVehiculo;
    private String licenciaTransportista;
    private String id_transportista;
        

    public void setDetallesProductos(ArrayList<DetalleProducto> DetallesProductos) {
        this.DetallesProductos = DetallesProductos;
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
    
    public static int getUltimoIdGenerado() {
        return ultimoIdGenerado;
    }

    public String getTipoComprobante() {
        return tipoComprobante;
    }

    public String getComprobante() {
        return comprobante;
    }

    public String getSede() {
        return sede;
    }

    public String getDireccionPartidaDetalle() {
        return direccionPartidaDetalle;
    }

    public String getDireccionLlegadaDetalle() {
        return direccionLlegadaDetalle;
    }

    public String getDireccionLlegadaReferencia() {
        return direccionLlegadaReferencia;
    }

    public String getDepartamento() {
        return departamento;
    }

    public String getProvincia() {
        return provincia;
    }

    public String getDistrito() {
        return distrito;
    }

    public String getId_proveedor() {
        return id_proveedor;
    }

    public String getDescripcionProveedor() {
        return descripcionProveedor;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public ArrayList<DetalleProducto> getDetallesProductos() {
        return DetallesProductos;
    }

    public String getId_transportista() {
        return id_transportista;
    }

    public String getId_vehiculo() {
        return placaVehiculo;
    }

    public String getNum_factura() {
        return comprobante;
    }

    public Date getFecha_emi() {
        return new Date(fecha_emi.getTime()); // Convertir java.util.Date a java.sql.Date
    }
    
    public Time getHora_emi() {
        return new Time(fecha_emi.getTime()); // Convertir java.util.Date a java.sql.Time
    }
    
    public String getMotivo_tras() {
        return motivo_tras;
    }

    public String getModalidad() {
        return modalidad;
    }

    public String getLicenciaTransportista() {
        return licenciaTransportista;
    }

    public String getPlacaVehiculo() {
        return placaVehiculo;
    }

}