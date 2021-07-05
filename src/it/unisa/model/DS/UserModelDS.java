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
import it.unisa.model.UserBean;
import it.unisa.model.Model.UserModel;

public class UserModelDS implements UserModel {
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

	private static final String TABLE_NAME = "cliente";
	private static final String TABLE_NAME2 = "dati_anagrafici";
	private static final String TABLE_NAME3 = "indirizzo";
	private static final String TABLE_NAME4 = "carta_credito";
	
	//@Override
	public synchronized void doSave(UserBean user) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UserModelDS.TABLE_NAME
				+ " (ID, ID_PASSWORD, EMAIL) VALUES (?, ?, ?)";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getID());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			
			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		insertSQL = "INSERT INTO " + UserModelDS.TABLE_NAME2
				+ " (ID, NOME, COGNOME, NUMERO_TELEFONO) VALUES (?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getID());
			preparedStatement.setString(2, user.getNome());
			preparedStatement.setString(3, user.getCognome());
			preparedStatement.setString(4, user.getTelefono());
			
			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	

	public synchronized UserBean doRetrieveByKey(String ID) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UserBean bean = new UserBean();

		String selectSQL = "SELECT * FROM " + UserModelDS.TABLE_NAME + " WHERE ID = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				bean.setID(rs.getString("ID"));
				bean.setPassword(rs.getString("ID_PASSWORD"));
				bean.setEmail(rs.getString("EMAIL"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		selectSQL = "SELECT * FROM " + UserModelDS.TABLE_NAME2 + " WHERE ID = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				bean.setNome(rs.getString("NOME"));
				bean.setCognome(rs.getString("COGNOME"));
				bean.setTelefono(rs.getString("NUMERO_TELEFONO"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		selectSQL = "SELECT * FROM " + UserModelDS.TABLE_NAME3 + " WHERE ID = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				bean.setProvincia(rs.getString("PROVINCIA"));
				bean.setCittà(rs.getString("CITTA"));
				bean.setIndirizzo(rs.getString("NCIVICO"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		selectSQL = "SELECT * FROM " + UserModelDS.TABLE_NAME4 + " WHERE ID = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				bean.setCVV(rs.getInt("CVV"));
				bean.setCodiceCarta(rs.getString("CODICE"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return bean;
	}


	public synchronized ArrayList<UserBean> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ArrayList <UserBean> users= new ArrayList<UserBean>();

		String selectSQL = "SELECT * FROM " + UserModelDS.TABLE_NAME;


		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				UserBean bean = new UserBean();
				String ID = rs.getString("ID");
				bean.setID(rs.getString("ID"));
				bean.setPassword(rs.getString("ID_PASSWORD"));
				bean.setEmail(rs.getString("EMAIL"));
				
				//PRENDO I DATI DALLE ALTRE TABLE
				String selectSQL2 = "SELECT * FROM " + UserModelDS.TABLE_NAME2 + " WHERE ID = ?";

				try {
					connection = DriverManagerConnectionPool.getConnection();
					preparedStatement = connection.prepareStatement(selectSQL2);
					preparedStatement.setString(1, ID);

					ResultSet rs2 = preparedStatement.executeQuery();

					while (rs2.next()) {
						
						bean.setNome(rs2.getString("NOME"));
						bean.setCognome(rs2.getString("COGNOME"));
						bean.setTelefono(rs2.getString("NUMERO_TELEFONO"));
					}

				} finally {
					try {
						if (preparedStatement != null)
							preparedStatement.close();
					} finally {
						DriverManagerConnectionPool.releaseConnection(connection);
					}
				}
				users.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return users;
	}
	
	public void saveData(UserBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UserBean bean = new UserBean();

		String insertSQL = "INSERT INTO " + UserModelDS.TABLE_NAME3
				+ " (PROVINCIA, CITTA, NCIVICO, ID) VALUES (?, ?, ?, ?)";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getProvincia());
			preparedStatement.setString(2, user.getCittà());
			preparedStatement.setString(3, user.getIndirizzo());
			preparedStatement.setString(4, user.getID());
			
			preparedStatement.executeUpdate();

			connection.commit();
			} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		String insertSQL2 = "INSERT INTO" + UserModelDS.TABLE_NAME4
				+ " (CVV, CODICE, ID) VALUES (?, ?, ?)";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL2);
			preparedStatement.setInt(1, user.getCVV());
			preparedStatement.setString(2, user.getCodiceCarta());
			preparedStatement.setString(3, user.getID());
			
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
}
