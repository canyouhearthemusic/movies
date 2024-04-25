import UIKit
import SnapKit
import FirebaseAuth

final class LoginViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var goToRegistrationScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Don't have an account? Register", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(goToRegistrationScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(usernameTextField)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.equalTo(50)
        }
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        view.addSubview(goToRegistrationScreenButton)
        goToRegistrationScreenButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    @objc func loginButtonTapped() {
        guard let email = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { r, e in
            if let e {
                print("Ошибка ")
            } else {
                let network = Network()
                let dataSource  = MoviesByCatagoryRemoteDataSource(network: network)
                let repository = MoviesByCategoryRepository(remoteDataSource: dataSource)
                let viewModel = MainPageViewModel(repository: repository)
                let view = MainPageViewController(viewModel: viewModel)
                UIHelper.setRoot(UINavigationController(rootViewController: view))
            }
        }
    }
    
    @objc func goToRegistrationScreen() {
        UIHelper.setRoot(UINavigationController(rootViewController: RegistrationViewController()))
    }
}
