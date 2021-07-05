package it.unisa.model.Model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import it.unisa.model.ProductBean;

public interface ProductModel {
	public void doSave(ProductBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ProductBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductBean> doRetrieveAll(String sort) throws SQLException;
	
	public ArrayList<ProductBean> doRetrieveAll() throws SQLException;
}
