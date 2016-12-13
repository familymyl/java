package com.xx.web;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.LinkedBlockingQueue;

public class RacerSection {
	
	private static ConcurrentMap<String, User> ipmap = new ConcurrentHashMap<>(32,0.75f,32);
	private static ConcurrentMap<Integer, User> idxmap = new ConcurrentHashMap<>(32,0.75f,32);
	private static BlockingQueue<String> queue = new LinkedBlockingQueue<>();
	
	public static void register(int idx, String name, String ip){
		User user = new User(idx, name, ip);
		ipmap.putIfAbsent(ip, user);
		idxmap.putIfAbsent(idx, user);
	}

	public static ConcurrentMap<String, User> getIpMap(){
		return ipmap;
	}
	
	public static ConcurrentMap<Integer, User> getIdxMap() {
		return idxmap;
	}
	
	public static User getUserFromIP(String ip){
		return ipmap.get(ip);
	}
	
	public static void race(String ip) {
		try {
			queue.put(ip);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public static User take(){
		queue.clear();
		try {
			String firstIP = queue.take();
			return getUserFromIP(firstIP);
		} catch (InterruptedException e) {
			e.printStackTrace();
			return null;
		}
	}
}
