package com.gift.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class OPFile {

	public static List<String> getPicsNames(String path) {
		List<String> names = new ArrayList<String>();
		File file = new File(path + File.separator + OPTime.getTime());
		System.out.println(file);
		File[] files = file.listFiles();
		for (File f : files) {
			names.add(f.getName());
		}
		return names;
	}
}
