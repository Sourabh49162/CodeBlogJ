package com.codeblog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfileManage {
	
	public static boolean deleteProfile(String path) {
		boolean flag = false;
		try {
			File file = new File(path);
			flag = file.delete();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static boolean saveProfile(InputStream is, String path) {
		boolean flag = false;
		try {
			byte[] b = new byte[is.available()];
			is.read(b);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			flag = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
