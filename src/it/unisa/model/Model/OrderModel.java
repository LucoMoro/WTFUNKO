package it.unisa.model.Model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import it.unisa.model.OrderBean;

public interface OrderModel {
	public void doSave(OrderBean user,double price) throws SQLException;

	public OrderBean doRetrieveByKey(String ID, int orderCode) throws SQLException;
	
	public ArrayList<OrderBean> doRetrieveAll(String ID) throws SQLException;
	
	public ArrayList<OrderBean> doRetrieveAll() throws SQLException;
}
