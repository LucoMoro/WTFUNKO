package it.unisa.model;

import java.io.Serializable;

public class UserBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String ID;
	private String password;
	private String email;
	private String nome,cognome,provincia,indirizzo,città,codiceCarta,numeroT;
	private int CVV;

	public UserBean() {
		ID="";
		password="";
		email="";
		nome = "";
		cognome = "";
		provincia = "";
		indirizzo = "";
		città = "";
		numeroT = "";
		CVV = 0;
		codiceCarta = "";
	}
	
	public String getCodiceCarta()
	{
		return codiceCarta;
	}
	
	public void setCodiceCarta(String x)
	{
		codiceCarta = x;
	}
	
	public int getCVV()
	{
		return CVV;
	}
	
	public void setCVV(int x)
	{
		CVV = x;
	}
	
	public String getTelefono()
	{
		return numeroT;
	}
	
	public void setTelefono(String x)
	{
		numeroT = x;
	}
	
	public String getCittà()
	{
		return città;
	}
	
	public void setCittà(String x)
	{
		città = x;
	}
	
	public String getIndirizzo()
	{
		return indirizzo;
	}
	
	public void setIndirizzo(String x)
	{
		indirizzo = x;
	}
	
	public String getCognome()
	{
		return cognome;
	}
	
	public void setCognome(String x)
	{
		cognome = x;
	}
	
	public String getNome()
	{
		return nome;
	}
	
	public void setNome(String x)
	{
		nome = x;
	}
	
	public String getProvincia()
	{
		return provincia;
	}
	
	public void setProvincia(String x)
	{
		provincia = x;
	}
	
	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email= email;
	}
	
	public boolean isAdmin()
	{
		return ID.contentEquals("FunkoAdmin");
	}	
}
