package blockchain.util;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Map;

import blockchain.Project;
import blockchain.Wallet;
import exe.util.Path;


public class CommonSet {
	/*
	 * 사용자의 지갑을 우리가 관리할 필요가 없다.
	 * 사용자가 개인키를 입력했을 때 지갑을 새로 생성해주면 된다.
	 */
	// public Map<String, Wallet> moneyWallets = new HashMap<>();
	public Map<String, Wallet> projectWallets = new HashMap<>();
	public Map<String, Project> projects = new HashMap<>();
	private Wallet managerWallet  = null;
	public byte b = 126;
	public long l = 1000000000000000000L;
	// 싱글톤
	private CommonSet() {}
	private static class LazyHolder {
	   public static final CommonSet INSTANCE = new CommonSet();
	}
	public static CommonSet getInstance() {
	   return LazyHolder.INSTANCE;
	}
	public Project getMyProject(String projectCode) throws Exception {
		Project myProject = null;
		for(int i=0;i<projects.size();i++) {
			Object keys[] = projects.keySet().toArray();
			if(projectCode.equals(keys[i])) {
				myProject = projects.get(keys[i]);
			}
		}
		return myProject;
	}
	public Wallet getProjectWallet(String walletID) throws Exception {
		Wallet projectWallet = null;
		Object keys[] = projectWallets.keySet().toArray();
		for(int i=0;i<projectWallets.size();i++) {
			if(walletID.equals(keys[i])) {
				projectWallet = projectWallets.get(keys[i]);
			}
		}
		return projectWallet;
	}
	
	//## 충전용 관리자 wallet 가져오기
	public Wallet getManagerWallet() {
		this.managerWallet = null;
		this.managerWallet = new Wallet();
		try {
			String pubStr = Base64Conversion.importPublicKey(Path.MANAGER_WALLET_PATH, "manager");
			String priStr = Base64Conversion.importPrivateKey(Path.MANAGER_WALLET_PATH, "manager");
			PublicKey publicKey = (PublicKey) Base64Conversion.decodeBase64(pubStr);
			PrivateKey privateKey = (PrivateKey) Base64Conversion.decodeBase64(priStr);
			this.managerWallet.setPublicKey(publicKey);
			this.managerWallet.setPrivateKey(privateKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return managerWallet;
	}

	//매니저 지갑 키페어 생성
}
