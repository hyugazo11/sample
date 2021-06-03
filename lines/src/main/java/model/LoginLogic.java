package model;
//ログイン処理担当クラス
import dao.AccountDAO;

public class LoginLogic {
	public boolean execute(Login login) {
		AccountDAO dao = new AccountDAO();
		Account account = dao.findByLogin(login);
		return account != null;
	}

}
