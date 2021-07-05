package it.unisa.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class OrderBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String ID;
	private int  orderCode;
	private Date dataOrdine;
	private double iva;
	private ArrayList<OrderItem> orderItem;
	

	public OrderBean() {
		ID="";
		iva=22;
		orderCode=0;
		orderItem= new ArrayList<OrderItem>();
	}


	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	
	public ArrayList<OrderItem> getOrderItems(){
		return orderItem;
	}
	
	public void setList(ArrayList<OrderItem> orderItem) {
		this.orderItem =orderItem;
	}
	
	
	public int getOrderCode() {
		return orderCode;
	}
	
	public void setOrderCode(int x) {
		this.orderCode= x;
	}
	
	public double getIva() {
		return iva;
	}
	
	public void setIva(double iva) {
		this.iva=iva;
	}

	public Date getDataOrdine() {
		return dataOrdine;
	}
	
	public void setDataOrdine(Date data) {
		this.dataOrdine= data;
	}
	
}
