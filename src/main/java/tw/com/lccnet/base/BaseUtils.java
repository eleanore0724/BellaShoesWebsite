package tw.com.lccnet.base;

import java.util.ArrayList;
import java.util.List;

import tw.com.lccnet.model.Product;

public interface BaseUtils<T> {
	List<Product> query();
}