package tw.com.lccnet.model;

public class ShippingAddress {
	private int addressId;
    private int userId;
    private String receiverName;
    private String phone;
    private String address;
    private String deliveryMethod;
    private String paymentMethod;
    private Integer orderId;
    
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	@Override
	public String toString() {
		return "ShippingAddress [addressId=" + addressId + ", userId=" + userId + ", receiverName=" + receiverName
				+ ", phone=" + phone + ", address=" + address + ", deliveryMethod=" + deliveryMethod
				+ ", paymentMethod=" + paymentMethod + ", orderId=" + orderId + "]";
	}
	
	
    
    
    
    
}
