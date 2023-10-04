package com.abcjobs3.entity;

import java.util.List;

public class Profile {
	private Long id;
	private String firstName;
	private String lastName;
	private String fullName;
	private String headline;
	private String about;
	private String company;
	private String email;
	private String phone;
	private String country;
	private String city;
	
	private List<Experiences> ex;
	private List<Educations> ed;
	public Profile(Long id, String firstName, String lastName, String fullName, String headline, String about,
			String company, String email, String phone, String country, String city, List<Experiences> ex, List<Educations> ed) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fullName = fullName;
		this.headline = headline;
		this.about = about;
		this.company = company;
		this.email = email;
		this.phone = phone;
		this.country = country;
		this.city = city;
		this.ex = ex;
		this.ed = ed;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public List<Experiences> getEx() {
		return ex;
	}
	public void setEx(List<Experiences> ex) {
		this.ex = ex;
	}
	public List<Educations> getEd() {
		return ed;
	}
	public void setEd(List<Educations> ed) {
		this.ed = ed;
	}
	
	
}
