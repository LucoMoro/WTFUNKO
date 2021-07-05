package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private ArrayList<CartItem> products;

	public Cart() {
		products = new ArrayList<CartItem>();
	}

	
	public boolean addProduct(ProductBean product) 
    {

        for(int i = 0; i<products.size(); i++)
        {
              if(products.get(i).getProduct().getCode() == product.getCode()) 
                {
                   return addQuantity(product, 1);
                }   
        }
         CartItem cartItem = new CartItem(product);
         products.add(cartItem);
         return true;
    }
	

	
	public void deleteProduct(ProductBean product) {
		for (int i=0; i<products.size(); i++) {

			if(products.get(i).getProduct().equals(product)) {
				products.remove(i);
				return;
			}	
		}
	}


	public ArrayList<CartItem> getProducts() {
		return  products;
	}

	
	public void addItem(CartItem x)
	{
		products.add(x);
	}


	public Cart clone() {
		Cart newcart= new Cart(); //nuovo array
		ArrayList<CartItem> array= getProducts(); //ci mettiamo tutti i prodotti di CartItem nella variabile array
		for (int i=0; i<array.size(); i++) {
			ProductBean x = array.get(i).getProduct();//scorro l'array che dovrei copiarmi. Prima copio il prodotto, 
			x.setQuantity(array.get(i).getQuantity());//poi la quantità e successivamente lo aggiungo. questo per ogni iterazione
			newcart.addProduct(x);
		}

		return newcart;
	}



	public void deleteAll() {
        for(int i=0; i< products.size(); i++) {
            products.remove(i);
        }
    }
	
	
	public CartItem get(int i) {
		return products.get(i);
	}
	
	public int size()
	{
		return products.size();
	}
	
	
	
	public void removeQuantity(ProductBean b,int x)
	{
		CartItem tmp;
		for(int i=0; i< products.size(); i++) 
		{
			tmp = products.get(i);
			if(tmp.getProduct().getCode() == b.getCode())
			{
				tmp.setQuantity(tmp.getQuantity() - x);
				if(tmp.getQuantity() <= 0)	deleteProduct(tmp.getProduct());
			}
		}
	}
	
	
	
	public boolean addQuantity(ProductBean b, int x)
	{
		CartItem tmp;
		for(int i=0; i< products.size(); i++) 
		{
			tmp = products.get(i);
			if(tmp.getProduct().getCode() == b.getCode())
			{
				tmp.setQuantity(tmp.getQuantity() + x);
                 if (tmp.getProduct().getQuantity() < products.get(i).getQuantity())
                 {
                     products.get(i).setQuantity(tmp.getProduct().getQuantity());
                	 return false;
                 }
                 return true;
			}
		}
		
	return true;
	}

	
	
	public void removeProduct(ProductBean bean) 
	{
		for(int i = 0; i<products.size(); i++)
		{
			if(products.get(i).getProduct().getCode() == bean.getCode()) 
				{
					products.remove(i);	
					return;
				}
		}
	}
}


