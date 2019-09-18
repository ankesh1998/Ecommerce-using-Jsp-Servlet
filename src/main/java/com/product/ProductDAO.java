package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DataBaseConnection;

public class ProductDAO {

	public static List<Product> getAllProducts(){
		List<Product> productList = new ArrayList<Product>();
		try
		{
			Connection con = DataBaseConnection.getInstance().connect2Db();
			Statement st= con.createStatement();
			ResultSet rs= st.executeQuery("SELECT * FROM product");
			while(rs.next())
			{
				Product product = new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_price"));
				productList.add(product);
			}
			
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return productList;
	}
	public static Product getProductById(String productId)
	{
		Product product = null;
		try
		{
			Connection conn = DataBaseConnection.connect2Db();
			PreparedStatement ps= conn.prepareStatement("SELECT * FROM product WHERE product_id = ?");
			ps.setString(1, productId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				product = new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("product_price"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return product;
	}
}
