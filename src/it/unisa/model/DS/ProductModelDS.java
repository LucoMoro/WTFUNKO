package it.unisa.model.DS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.model.DriverManagerConnectionPool;
import it.unisa.model.OrderBean;
import it.unisa.model.ProductBean;
import it.unisa.model.Model.ProductModel;

public class ProductModelDS implements ProductModel {

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

	private static final String TABLE_NAME = "product";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (PRODUCT_NAME, PRODUCT_DESCRIPTION, PRICE, QUANTITY, RARITY, "
				+ "DIMENSION, FRANCHISENAME, SERIES, MEDIUMSCORE,URLIMAGE) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setInt(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());
			preparedStatement.setInt(5, product.getRarity());
			preparedStatement.setDouble(6, product.getDimension());
			preparedStatement.setString(7, product.getFranchiseName());
			preparedStatement.setString(8, product.getSeries());
			preparedStatement.setDouble(9, product.getMediumScore());
			preparedStatement.setString(10, product.getImg());

			preparedStatement.executeUpdate();

			//connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	
	public synchronized void doSave2(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (PRODUCT_CODE , PRODUCT_NAME, PRODUCT_DESCRIPTION, PRICE, QUANTITY, RARITY, "
				+ "DIMENSION, FRANCHISENAME, SERIES, MEDIUMSCORE, URLIMAGE) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, product.getCode());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setString(3, product.getDescription());
			preparedStatement.setInt(4, product.getPrice());
			preparedStatement.setInt(5, product.getQuantity());
			preparedStatement.setInt(6, product.getRarity());
			preparedStatement.setDouble(7, product.getDimension());
			preparedStatement.setString(8, product.getFranchiseName());
			preparedStatement.setString(9, product.getSeries());
			preparedStatement.setDouble(10, product.getMediumScore());
			preparedStatement.setString(11, product.getImg());

			preparedStatement.executeUpdate();

			//connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized ProductBean doRetrieveByKey(int product_code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE PRODUCT_CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, product_code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("PRODUCT_CODE"));
				bean.setName(rs.getString("PRODUCT_NAME"));
				bean.setDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setQuantity(rs.getInt("QUANTITY"));
				bean.setRarity(rs.getInt("RARITY"));
				bean.setDimension(rs.getDouble("DIMENSION"));
				bean.setFranchiseName(rs.getString("FRANCHISENAME"));
				bean.setSeries(rs.getString("SERIES"));
				bean.setMediumScore(rs.getDouble("MEDIUMSCORE"));
				bean.setImg(rs.getString("URLIMAGE"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public synchronized boolean doDelete(int product_code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE PRODUCT_CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, product_code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized ArrayList<ProductBean> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("PRODUCT_CODE"));
				bean.setName(rs.getString("PRODUCT_NAME"));
				bean.setDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setQuantity(rs.getInt("QUANTITY"));
				bean.setRarity(rs.getInt("RARITY"));
				bean.setDimension(rs.getDouble("DIMENSION"));
				bean.setFranchiseName(rs.getString("FRANCHISENAME"));
				bean.setSeries(rs.getString("SERIES"));
				bean.setMediumScore(rs.getDouble("MEDIUMSCORE"));
				bean.setImg(rs.getString("URLIMAGE"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;
		
		if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("PRODUCT_CODE"));
				bean.setName(rs.getString("PRODUCT_NAME"));
				bean.setDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setQuantity(rs.getInt("QUANTITY"));
				bean.setRarity(rs.getInt("RARITY"));
				bean.setDimension(rs.getDouble("DIMENSION"));
				bean.setFranchiseName(rs.getString("FRANCHISENAME"));
				bean.setSeries(rs.getString("SERIES"));
				bean.setMediumScore(rs.getDouble("MEDIUMSCORE"));
				bean.setImg(rs.getString("URLIMAGE"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public synchronized ArrayList<ProductBean> doRetrieveByFranchise(String franchise) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList <ProductBean> prodotti= new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE FRANCHISENAME = ? ";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, franchise);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("PRODUCT_CODE"));
				bean.setName(rs.getString("PRODUCT_NAME"));
				bean.setDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getInt("PRICE"));
				bean.setQuantity(rs.getInt("QUANTITY"));
				bean.setRarity(rs.getInt("RARITY"));
				bean.setDimension(rs.getDouble("DIMENSION"));
				bean.setFranchiseName(rs.getString("FRANCHISENAME"));
				bean.setSeries(rs.getString("SERIES"));
				bean.setMediumScore(rs.getDouble("MEDIUMSCORE"));
				bean.setImg(rs.getString("URLIMAGE"));
				prodotti.add(bean);
			} 
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return prodotti;
		}

}