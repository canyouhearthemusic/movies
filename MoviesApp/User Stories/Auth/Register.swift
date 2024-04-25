import UIKit
import SnapKit
import FirebaseAuth

final class RegistrationViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .green
        return label
    }()
    
    private let loginTextField: UITextField = {
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

    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var goToLoginScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Already have an account? Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(goToLoginScreen), for: .touchUpInside)
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
        
        view.addSubview(loginTextField)
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(loginTextField)
        }
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalTo(loginTextField)
            make.height.equalTo(50)
        }
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        view.addSubview(goToLoginScreenButton)
        goToLoginScreenButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    @objc func continueButtonTapped() {
        guard let email = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { r, e in
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
    
    @objc func goToLoginScreen() {
        UIHelper.setRoot(UINavigationController(rootViewController: LoginViewController()))
    }
}
