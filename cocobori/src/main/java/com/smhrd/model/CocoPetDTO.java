package com.smhrd.model;

public class CocoPetDTO {
	
	private String pet_type;
	private String pet_breed;
	private String pet_pic;
	private String pet_adaptno;
	private String pet_adapt;
	private String pet_fitno;
	private String pet_fit;
	private String pet_affno;
	private String pet_aff;
	private String pet_healthno;
	private String pet_health;
	private String pet_trainno;
	private String pet_train;
	private String pet_actno;
	private String pet_act;
	private	String pet_groomno;
	private String pet_groom;
	private String pet_temp;
	private String pet_hum;
	private String pet_eat;
	private String pet_etc;
	private String pet_cage;
	
	public CocoPetDTO() {
	}

	public CocoPetDTO(String pet_type, String pet_breed, String pet_pic, String pet_adaptno,
			String pet_adapt, String pet_fitno, String pet_fit, String pet_affno, String pet_aff, String pet_healthno,
			String pet_health, String pet_trainno, String pet_train, String pet_actno, String pet_act) {
		super();
		this.pet_type = pet_type;
		this.pet_breed = pet_breed;
		this.pet_pic = pet_pic;
		this.pet_adaptno = pet_adaptno;
		this.pet_adapt = pet_adapt;
		this.pet_fitno = pet_fitno;
		this.pet_fit = pet_fit;
		this.pet_affno = pet_affno;
		this.pet_aff = pet_aff;
		this.pet_healthno = pet_healthno;
		this.pet_health = pet_health;
		this.pet_trainno = pet_trainno;
		this.pet_train = pet_train;
		this.pet_actno = pet_actno;
		this.pet_act = pet_act;
	}
	
	public CocoPetDTO(String pet_type, String pet_breed, String pet_pic, String pet_affno, String pet_aff, String pet_actno, String pet_act, String pet_healthno,
			String pet_health, String pet_groomno, String pet_groom) {
		super();
		this.pet_type = pet_type;
		this.pet_breed = pet_breed;
		this.pet_pic = pet_pic;
		this.pet_affno = pet_affno;
		this.pet_aff = pet_aff;
		this.pet_actno = pet_actno;
		this.pet_act = pet_act;
		this.pet_healthno = pet_healthno;
		this.pet_health = pet_health;
		this.pet_groomno = pet_groomno;
		this.pet_groom = pet_groom;
	}
	
	public CocoPetDTO(String pet_type, String pet_breed, String pet_pic, String pet_temp,
			String pet_eat, String pet_cage, String pet_health, String pet_adapt, String pet_etc) {
		super();
		this.pet_type = pet_type;
		this.pet_breed = pet_breed;
		this.pet_pic = pet_pic;
		this.pet_temp = pet_temp;
		this.pet_eat = pet_eat;
		this.pet_adapt = pet_adapt;
		this.pet_health = pet_health;
		this.pet_cage = pet_cage;
		this.pet_etc = pet_etc;
	}

	public CocoPetDTO(String pet_type, String pet_breed, String pet_pic, String pet_temp, String pet_hum, String pet_eat, String pet_etc) {
		super();
		this.pet_type = pet_type;
		this.pet_breed = pet_breed;
		this.pet_pic = pet_pic;
		this.pet_temp = pet_temp;
		this.pet_hum = pet_hum;
		this.pet_eat = pet_eat;
		this.pet_etc = pet_etc;
	}
	
	
	
	public String getPet_cage() {
		return pet_cage;
	}

	public void setPet_cage(String pet_cage) {
		this.pet_cage = pet_cage;
	}

	public CocoPetDTO(String pet_breed) {
		this.pet_breed = pet_breed;
	}

	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public String getPet_breed() {
		return pet_breed;
	}

	public void setPet_breed(String pet_breed) {
		this.pet_breed = pet_breed;
	}

	public String getPet_pic() {
		return pet_pic;
	}

	public void setPet_pic(String pet_pic) {
		this.pet_pic = pet_pic;
	}

	public String getPet_adaptno() {
		return pet_adaptno;
	}

	public void setPet_adaptno(String pet_adaptno) {
		this.pet_adaptno = pet_adaptno;
	}

	public String getPet_adapt() {
		return pet_adapt;
	}

	public void setPet_adapt(String pet_adapt) {
		this.pet_adapt = pet_adapt;
	}

	public String getPet_fitno() {
		return pet_fitno;
	}

	public void setPet_fitno(String pet_fitno) {
		this.pet_fitno = pet_fitno;
	}

	public String getPet_fit() {
		return pet_fit;
	}

	public void setPet_fit(String pet_fit) {
		this.pet_fit = pet_fit;
	}

	public String getPet_affno() {
		return pet_affno;
	}

	public void setPet_affno(String pet_affno) {
		this.pet_affno = pet_affno;
	}

	public String getPet_aff() {
		return pet_aff;
	}

	public void setPet_aff(String pet_aff) {
		this.pet_aff = pet_aff;
	}

	public String getPet_healthno() {
		return pet_healthno;
	}

	public void setPet_healthno(String pet_healthno) {
		this.pet_healthno = pet_healthno;
	}

	public String getPet_health() {
		return pet_health;
	}

	public void setPet_health(String pet_health) {
		this.pet_health = pet_health;
	}

	public String getPet_trainno() {
		return pet_trainno;
	}

	public void setPet_trainno(String pet_trainno) {
		this.pet_trainno = pet_trainno;
	}

	public String getPet_train() {
		return pet_train;
	}

	public void setPet_train(String pet_train) {
		this.pet_train = pet_train;
	}

	public String getPet_actno() {
		return pet_actno;
	}

	public void setPet_actno(String pet_actno) {
		this.pet_actno = pet_actno;
	}

	public String getPet_act() {
		return pet_act;
	}

	public void setPet_act(String pet_act) {
		this.pet_act = pet_act;
	}

	public String getPet_groomno() {
		return pet_groomno;
	}

	public void setPet_groomno(String pet_groomno) {
		this.pet_groomno = pet_groomno;
	}

	public String getPet_groom() {
		return pet_groom;
	}

	public void setPet_groom(String pet_groom) {
		this.pet_groom = pet_groom;
	}

	public String getPet_temp() {
		return pet_temp;
	}

	public void setPet_temp(String pet_temp) {
		this.pet_temp = pet_temp;
	}

	public String getPet_hum() {
		return pet_hum;
	}

	public void setPet_hum(String pet_hum) {
		this.pet_hum = pet_hum;
	}

	public String getPet_eat() {
		return pet_eat;
	}

	public void setPet_eat(String pet_eat) {
		this.pet_eat = pet_eat;
	}

	public String getPet_etc() {
		return pet_etc;
	}

	public void setPet_etc(String pet_etc) {
		this.pet_etc = pet_etc;
	}

	@Override
	public String toString() {
		return "CocoPetDTO [pet_type=" + pet_type + ", pet_breed=" + pet_breed + ", pet_pic=" + pet_pic
				+ ", pet_adaptno=" + pet_adaptno + ", pet_adapt=" + pet_adapt + ", pet_fitno=" + pet_fitno
				+ ", pet_fit=" + pet_fit + ", pet_affno=" + pet_affno + ", pet_aff=" + pet_aff + ", pet_healthno="
				+ pet_healthno + ", pet_health=" + pet_health + ", pet_trainno=" + pet_trainno + ", pet_train="
				+ pet_train + ", pet_actno=" + pet_actno + ", pet_act=" + pet_act + ", pet_groomno=" + pet_groomno
				+ ", pet_groom=" + pet_groom + "]";
	}
	
	
	
	
	
	

}
