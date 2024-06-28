/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package guiaremision;

/**
 *
 * @author Hector
 */
public class DetalleProducto {
    private String codigoProducto;
    private String nombreProducto;
    private String unidadProducto;
    private int cantidad;

    public DetalleProducto(String codigoProducto, String nombreProducto, String unidadProducto, int cantidad) {
        this.codigoProducto = codigoProducto;
        this.nombreProducto = nombreProducto;
        this.unidadProducto = unidadProducto;
        this.cantidad = cantidad;
    }

    public String getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(String codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getUnidadProducto() {
        return unidadProducto;
    }

    public void setUnidadProducto(String unidadProducto) {
        this.unidadProducto = unidadProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}