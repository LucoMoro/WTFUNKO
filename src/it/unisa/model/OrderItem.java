package it.unisa.model;

public class OrderItem {
	private int productCode;
	private int orderQuantity;
	private int orderCode;
	private int orderPrice;
	private String name;
	
	public OrderItem(CartItem cartItem)  //in cartItem ci sono tutti i prodotti e la quantità
	{
		productCode= cartItem.getProduct().getCode();
		orderQuantity= cartItem.getQuantity();
		orderCode=0;
		orderPrice = cartItem.getProduct().getPrice();
		name = "";
	}
	
	public OrderItem()
	{
		
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String x)
	{
		name = x;
	}
	
	public int getOrderQuantity() {
		return orderQuantity;
	}
	
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity= orderQuantity;
	}
	
	public int getOrderCode() {
		return orderCode;
	}
	
	public void setOrderCode(int x) {
		this.orderCode= x;
	}
	
	public int getProductCode() {
		return productCode;
	}
	
	public void setProductCode(int z){
		this.productCode= z;
	}
	
	public void setOderPrice(int x)
	{
		orderPrice = x;
	}
	
	public int getOrderPrice()
	{
		return orderPrice;
	}
	
}
