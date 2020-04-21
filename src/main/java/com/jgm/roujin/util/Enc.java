package com.jgm.roujin.util;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Scanner;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class Enc {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		StandardPBEStringEncryptor sPBE = new StandardPBEStringEncryptor();
		
		
		Map<String,String> envList = System.getenv();
		
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("MySQL username: ");
		String userName = scanner.nextLine();
		
		System.out.print("MySQL password: ");
		String password = scanner.nextLine();
		
		
		sPBE.setAlgorithm("PBEWithMD5AndDES");
		sPBE.setPassword(envList.get("ORACLE_PASS"));
		
		String encUserName = sPBE.encrypt(userName);
		String encPassword = sPBE.encrypt(password);
		
		String saveFile = "./src/main/webapp/WEB-INF/spring/properties/db.connection.properties";
		
		
		String saveUserName = String.format("mysql.username=ENC(%s)", encUserName);
		String savePassword = String.format("mysql.password=ENC(%s)", encPassword);
		
		
		
		
		try {
			PrintWriter pw = new PrintWriter(saveFile);
			pw.println(saveUserName);
			pw.println(savePassword);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		scanner.close();
		System.out.println("db.properties save complete!!!");
	}
}
