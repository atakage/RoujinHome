package com.jgm.roujin.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Entity
@Table(name="tbl_qa", schema = "roujin")
public class QaVO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private long id;
	
	@Column(name="p_id", nullable = true)
	private long PId;
	
	@Column(name="sal_sequence", nullable = false)
	private long salSequence;
	
	@Column(name="name", nullable = false)
	private String name;
	
	@Column(name="username", columnDefinition = "VARCHAR(10)", nullable = false)
	private String username;
	
	@Column(name="picture", columnDefinition = "VARCHAR(1000)", nullable = true)
	private String picture;
	
	@Column(name="content", columnDefinition = "VARCHAR(2000)", nullable = true)
	private String content;
	
	@Column(name="complete", columnDefinition = "boolean default false", nullable = false)
	private boolean complete;
	
	
}
