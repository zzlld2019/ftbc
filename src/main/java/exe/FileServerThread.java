package exe;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;


import blockchain.util.MajorityElement;
import blockchain.util.URLConnection;
import exe.util.Path;
import exe.util.Protocol;

public class FileServerThread extends Thread {
	FileServer fserver = null;
	DataInputStream dis = null;
	DataOutputStream dos = null;
	
	String loginID = null;
	boolean isStop = false;
	int bufferSize = 4092;
	///
	public FileServerThread(FileServer fserver) {
		this.fserver = fserver;
		try {
			dis = new DataInputStream(new BufferedInputStream(fserver.fcSocket.getInputStream()));
			dos = new DataOutputStream(new BufferedOutputStream(fserver.fcSocket.getOutputStream()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void msgServerSend(String msg) {
		try {
			// 파일 무결성 검사를 위한 통신
			Map<String, MsgServerThread> msgMaps = fserver.serverMapping.msgServer.globalMaps;
			Object keys[] = msgMaps.keySet().toArray();
			for (int i = 0; i < msgMaps.size(); i++) {
				if (loginID.equals(keys[i])) {
					MsgServerThread msgThread = msgMaps.get(keys[i]);
					msgThread.oos.writeObject(msg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		StringTokenizer stz = null;
		int protocol = 0;
		while (!isStop) {
			try {
				String msg = dis.readUTF();
				if (msg != null) {
					fserver.jta_log.append("메세지 : " + msg + "\n");
					stz = new StringTokenizer(msg, "|");
					protocol = Integer.parseInt(stz.nextToken());
				}
				switch (protocol) {
				case Protocol.CHAIN_SYNC_UPLOAD: {
					try {
						this.loginID = stz.nextToken();
						fserver.jta_log.append("CHAIN_SYNC_UPLOAD \n");
						///
						long fileSize = dis.readLong();
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						File file = new File(Path.CLIENT_CHAIN_PATH + loginID + "Chain.ftbc");
						FileOutputStream fos = new FileOutputStream(file);

						while (fileSize > 0
								&& (len = dis.read(buffer, 0, (int) Math.min(buffer.length, fileSize))) != -1) {
							fos.write(buffer, 0, len);
							fileSize -= len;
						}
						fos.flush();
						fos.close();
						dos.writeUTF(Protocol.UPLOAD_END + Protocol.seperator + loginID);
						isStop = true;
						dos.flush();
						dos.close();
						dis.close();
						fserver.fcSocket.close();
						this.msgServerSend(Protocol.CHAIN_AUTHENTICATE_START + Protocol.seperator + loginID);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				// 서버의 체인을 클라이언트에 다운로드 시킬 때
				case Protocol.CHAIN_SYNC_DOWNLOAD: {
					try {
						loginID = stz.nextToken();
						fserver.jta_log.append("CHAIN_SYNC_DOWNLOAD \n");
						dos.writeUTF(Protocol.CHAIN_SYNC_DOWNLOAD + Protocol.seperator + loginID);
						
						File file = new File(Path.SERVER_ABSOLUTE_PATH);
						dos.writeLong(file.length());
						dos.flush();
						
						FileInputStream fis = new FileInputStream(file);
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						
						while((len = fis.read(buffer)) != -1) {
							dos.write(buffer, 0, len);
						}
						dos.flush();
						fis.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				} //////////////// end of FILE DOWNLOAD
					break;
				case Protocol.DOWNLOAD_END: {
					fserver.jta_log.append("##DOWNLOAD_END \n");
					isStop = true;
					if(dis != null) dis.close();
					if(dos != null) dos.close();
					if(fserver.fcSocket != null) fserver.fcSocket.close();
					fserver.jta_log.append(fserver.fcSocket.toString()+" 연결 종료 \n");
				}
					break;
				case Protocol.AUTOSYNC_CHAIN_UPLOAD: {
					try {
						this.loginID = stz.nextToken();
						fserver.jta_log.append("AUTOSYNC_CHAIN_UPLOAD \n");
						///
						long fileSize = dis.readLong();
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						File file = new File(Path.CLIENT_CHAIN_PATH + loginID + "Chain.ftbc");
						FileOutputStream fos = new FileOutputStream(file);

						while (fileSize > 0
								&& (len = dis.read(buffer, 0, (int) Math.min(buffer.length, fileSize))) != -1) {
							fos.write(buffer, 0, len);
							fileSize -= len;
						}
						fos.flush();
						fos.close();
						dos.writeUTF(Protocol.UPLOAD_END + Protocol.seperator + loginID);
						isStop = true;
						dos.flush();
						dos.close();
						dis.close();
						fserver.fcSocket.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				case Protocol.AUTOSYNC_CHAIN_UPLOAD_END: {
					try {
						this.loginID = stz.nextToken();
						fserver.jta_log.append("AUTOSYNC_CHAIN_UPLOAD_END \n");
						///
						long fileSize = dis.readLong();
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						File file = new File(Path.CLIENT_CHAIN_PATH + loginID + "Chain.ftbc");
						FileOutputStream fos = new FileOutputStream(file);

						while (fileSize > 0
								&& (len = dis.read(buffer, 0, (int) Math.min(buffer.length, fileSize))) != -1) {
							fos.write(buffer, 0, len);
							fileSize -= len;
						}
						fos.flush();
						fos.close();
						dos.writeUTF(Protocol.UPLOAD_END + Protocol.seperator + loginID);
						isStop = true;
						dos.flush();
						dos.close();
						dis.close();
						fserver.fcSocket.close();
						//
						if (fileSize == 0) {
							List<String> syncClientList = fserver.serverMapping.msgServer.syncClientList;
							MajorityElement me = new MajorityElement();
							String result = me.majorityElement(syncClientList);
							fserver.jta_log.append("과반수 결과!! : " + result + "\n");
							// [MsgServerThread] ALERT_ADD_BLOCK 에서 생성해줌
							fserver.serverMapping.msgServer.syncClientList = null;
							// 공유 체인이 채택되었으니 블록을 추가해주라고 서블릿에게 보내기
							URLConnection urlConnection = URLConnection.getInstance();
							urlConnection.connectAddBlock();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}