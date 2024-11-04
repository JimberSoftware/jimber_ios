import UIKit

class WelcomeViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jimber_bg")
        imageView.contentMode = .scaleAspectFill // Ensures the image fills the view while preserving aspect ratio
        imageView.clipsToBounds = true // Clips the image to the bounds of the imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jimber_logo_full")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#111279")
        button.layer.cornerRadius = 4
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill

        let iconImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysTemplate))
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        stackView.addArrangedSubview(iconImageView)

        let titleLabel = UILabel()
        titleLabel.text = "Sign in to your account"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)

        button.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        ])

        return button
    }()

    private let addConnectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#111279")
        button.layer.cornerRadius = 4
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill

        let iconImageView = UIImageView(image: UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate))
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        stackView.addArrangedSubview(iconImageView)

        let titleLabel = UILabel()
        titleLabel.text = "Add a connection"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)

        button.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        ])

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(backgroundImageView) // Add background image view first
        view.addSubview(logoImageView)
        view.addSubview(signInButton)
        view.addSubview(addConnectionButton)

        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc private func signInButtonTapped() {
        // let signInVC = SignInViewController()
        // navigationController?.pushViewController(signInVC, animated: true)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),

            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            logoImageView.widthAnchor.constraint(equalToConstant: 280),
            logoImageView.heightAnchor.constraint(equalToConstant: 111),

            signInButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 280),
            signInButton.heightAnchor.constraint(equalToConstant: 50),

            addConnectionButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
            addConnectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addConnectionButton.widthAnchor.constraint(equalToConstant: 280),
            addConnectionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
