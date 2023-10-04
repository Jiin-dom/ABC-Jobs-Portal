package com.abcjobs3.entity;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class Role {
	 @Id
	    @Column(name="id")
	    @GeneratedValue(strategy= GenerationType.IDENTITY)
	    private Long id;

	    @Column(name="name")
	    private String name;

	    @ManyToMany(mappedBy = "roles")
	    private Set<Users> users = new HashSet<>();

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Set<Users> getUsers() {
			return users;
		}

		public void setUsers(Set<Users> users) {
			this.users = users;
		}

	    @Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (o == null || getClass() != o.getClass()) return false;
	        Role role = (Role) o;
	        return name.equals(role.name);
	    }

	    @Override
	    public int hashCode() {
	        return Objects.hash(name);
	    }
}
