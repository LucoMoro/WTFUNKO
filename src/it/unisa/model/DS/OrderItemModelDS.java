package it.unisa.model.DS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.Collection;
//import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.model.DriverManagerConnectionPool;
import it.unisa.model.OrderItem;
import it.unisa.model.Model.OrderItemModel;

public class OrderItemModelDS implements OrderItemModel {
private static DataSource ds;
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/WHATTHEFUNKO2");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "compone";



	@Override
	public ArrayList<OrderItem> doRetrieveAll(int orderID) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ArrayList <OrderItem> order= new ArrayList<OrderItem>();		
		

		String selectSQL = "SELECT * FROM " + OrderItemModelDS.TABLE_NAME + " WHERE CODICE_ORDINE = ?";


		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, orderID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{ //vado ad inserire i valori
				OrderItem ordered = new OrderItem();
				ordered.setOrderCode(rs.getInt("CODICE_ORDINE"));
				ordered.setOrderQuantity(rs.getInt("N_OGGETTO"));
				ordered.setProductCode(rs.getInt("PRODUCT_CODE"));
				ordered.setOderPrice(rs.getInt("PRICE"));
				ordered.setName(rs.getString("PRODUCT_NAME"));
				order.add(ordered);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return order;
	}



	@Override
	public void doSaveAll(ArrayList<OrderItem> ordered) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement pS = null;
		
		String insertSQL = "INSERT INTO " + OrderItemModelDS.TABLE_NAME + " ( CODICE_ORDINE, N_OGGETTO, PRODUCT_CODE , PRICE , PRODUCT_NAME) VALUES (?,?,?,?,?) ";
		
		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			pS = connection.prepareStatement(insertSQL);
			
			OrderItem x = null;
			for(int i = 0; i<ordered.size(); i++)
			{
				x = ordered.get(i);
				pS.setInt(1, x.getOrderCode());
				pS.setInt(2, x.getOrderQuantity());
				pS.setInt(3,x.getProductCode());
				pS.setInt(4,x.getOrderPrice());
				pS.setString(5,x.getName());
				pS.executeUpdate();
			}
			connection.commit();
		}
		finally
		{
			try {
				if (pS != null)	pS.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}

}
