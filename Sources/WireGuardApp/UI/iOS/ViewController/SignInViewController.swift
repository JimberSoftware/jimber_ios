import UIKit
import GoogleSignIn
import MSAL

class SignInViewController: UIViewController {

    private var microsoftClientApp: MSALPublicClientApplication?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureGoogleSignIn()
        configureMicrosoftSignIn()
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        // Set up custom navigation bar
        navigationItem.title = "Sign In"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add Google Sign-In button
        let googleSignInButton = UIButton(type: .system)
        googleSignInButton.setTitle("Sign in with Google", for: .normal)
        googleSignInButton.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        
        // Add Microsoft Sign-In button
        let microsoftSignInButton = UIButton(type: .system)
        microsoftSignInButton.setTitle("Sign in with Microsoft", for: .normal)
        microsoftSignInButton.addTarget(self, action: #selector(handleMicrosoftSignIn), for: .touchUpInside)
        
        // Add Email Sign-In button
        let emailSignInButton = UIButton(type: .system)
        emailSignInButton.setTitle("Sign in with Email", for: .normal)
        emailSignInButton.addTarget(self, action: #selector(handleEmailSignIn), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [googleSignInButton, microsoftSignInButton, emailSignInButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func configureGoogleSignIn() {
        GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: "YOUR_CLIENT_ID"), presenting: self) { user, error in
            if let error = error {
                print("Google sign-in failed: \(error)")
                return
            }
            
            guard let authentication = user?.authentication else { return }
            let token = authentication.idToken
            
            // Handle Google sign-in success
            self.handleGoogleSignInSuccess(token: token)
        }
    }

    private func configureMicrosoftSignIn() {
        // Initialize Microsoft authentication
        // let authority = try! MSALAuthority(url: URL(string: "https://login.microsoftonline.com/common")!)
        // let config = MSALPublicClientApplicationConfig(clientId: "YOUR_CLIENT_ID", redirectUri: nil, authority: authority)
        // microsoftClientApp = try? MSALPublicClientApplication(configuration: config)
    }

    @objc private func handleGoogleSignIn() {
        GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: "YOUR_CLIENT_ID"), presenting: self) { user, error in
            if let error = error {
                print("Google sign-in failed: \(error)")
                return
            }

            guard let authentication = user?.authentication else { return }
            let token = authentication.idToken
            
            // Handle Google sign-in success
            self.handleGoogleSignInSuccess(token: token)
        }
    }

    @objc private func handleMicrosoftSignIn() {
        let webviewParameters = MSALWebviewParameters(authPresentationViewController: self)
        let parameters = MSALInteractiveTokenParameters(scopes: ["user.read"], webviewParameters: webviewParameters)
        
        microsoftClientApp?.acquireToken(with: parameters, completionBlock: { result, error in
            if let error = error {
                print("Microsoft sign-in failed: \(error)")
                return
            }
            
            guard let result = result else { return }
            let token = result.accessToken
            
            // Handle Microsoft sign-in success
            self.handleMicrosoftSignInSuccess(token: token)
        })
    }

    @objc private func handleEmailSignIn() {
        // let emailRegistrationVC = EmailRegistrationViewController()
       // navigationController?.pushViewController(emailRegistrationVC, animated: true)
    }

    private func handleGoogleSignInSuccess(token: String?) {
        // Implement the logic for handling Google sign-in success
        print("Google sign-in success with token: \(token ?? "")")
        // Perform navigation or other actions
    }

    private func handleMicrosoftSignInSuccess(token: String?) {
        // Implement the logic for handling Microsoft sign-in success
        print("Microsoft sign-in success with token: \(token ?? "")")
        // Perform navigation or other actions
    }
}
