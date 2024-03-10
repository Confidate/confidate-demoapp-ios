//
//  SignUpViewController.swift
//  Confidate
//
//  Created by Maxim Perehod on 09.03.2024.
//

import UIKit

final class SetUpViewController: UIViewController {
    
    let viewModel: SetUpViewModel
    
    init(viewModel: SetUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private struct Consts {
        static let initialImageName1 = "initial_image_1"
        static let initialImageName2 = "initial_image_2"
    }
    
    // MARK: - UI Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: Consts.initialImageName1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your gender"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var hobbieTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your hobbie"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var animalPrefferenceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your favorite animal"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var autoFillButton: UIButton = {
        let button = UIButton()
        button.setTitle("AI Fill", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(autoFillTouchUpInside), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var finishButton: UIButton = {
        let button = UIButton()
        button.setTitle("Finish", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(finishTouchInside), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(nextTouchInside), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Sign Up"
    }
    
    // MARK: - Setup UI components
    
    private func setupUI() {
        view.backgroundColor = .white
        setupImageView()
        setupGenderTextField()
        setupAnimalTextField()
        setupHobbieTextField()
        setupAutoFillButton()
        setupFinishButton()
        setupNextButton()
        setupActivityIndicator()
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupGenderTextField() {
        view.addSubview(genderTextField)
        genderTextField.leftAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16)
            .isActive = true
        genderTextField.rightAnchor
            .constraint(equalTo: view.rightAnchor, constant: -16)
            .isActive = true
        genderTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        genderTextField.heightAnchor
            .constraint(equalToConstant: 30)
            .isActive = true
    }
    
    private func setupAnimalTextField() {
        view.addSubview(animalPrefferenceTextField)
        animalPrefferenceTextField.leftAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16)
            .isActive = true
        animalPrefferenceTextField.rightAnchor
            .constraint(equalTo: view.rightAnchor, constant: -16)
            .isActive = true
        animalPrefferenceTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 16).isActive = true
        animalPrefferenceTextField.heightAnchor
            .constraint(equalToConstant: 30)
            .isActive = true
    }
    
    private func setupHobbieTextField() {
        view.addSubview(hobbieTextField)
        hobbieTextField.leftAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16)
            .isActive = true
        hobbieTextField.rightAnchor
            .constraint(equalTo: view.rightAnchor, constant: -16)
            .isActive = true
        hobbieTextField.topAnchor.constraint(equalTo: animalPrefferenceTextField.bottomAnchor, constant: 16).isActive = true
        hobbieTextField.heightAnchor
            .constraint(equalToConstant: 30)
            .isActive = true
    }
    
    private func setupAutoFillButton() {
        view.addSubview(autoFillButton)
        autoFillButton.heightAnchor.constraint(equalToConstant: 45)
            .isActive = true
        autoFillButton.widthAnchor.constraint(equalToConstant: 120)
            .isActive = true
        autoFillButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
            .isActive = true
        autoFillButton.topAnchor.constraint(equalTo: hobbieTextField.bottomAnchor, constant: 16)
            .isActive = true
    }
    
    private func setupFinishButton() {
        view.addSubview(finishButton)
        finishButton.heightAnchor.constraint(equalToConstant: 45)
            .isActive = true
        finishButton.widthAnchor.constraint(equalToConstant: 120)
            .isActive = true
        finishButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16)
            .isActive = true
        finishButton.topAnchor.constraint(equalTo: hobbieTextField.bottomAnchor, constant: 16)
            .isActive = true
    }
    
    private func setupNextButton() {
        view.addSubview(nextButton)
        nextButton.heightAnchor.constraint(equalToConstant: 45)
            .isActive = true
        nextButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        nextButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16)
            .isActive = true
        nextButton.topAnchor.constraint(equalTo: hobbieTextField.bottomAnchor, constant: 16)
            .isActive = true
    }
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isHidden = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: hobbieTextField.bottomAnchor, constant: 32).isActive = true
    }
    
    
    // MARK: - Events
    @objc private func autoFillTouchUpInside() {
        viewModel.autoFillTapped()
    }
    
    @objc private func finishTouchInside() {
        let gender = genderTextField.text ?? ""
        let animal = animalPrefferenceTextField.text ?? ""
        let hobbie = hobbieTextField.text ?? ""
        viewModel.finishTapped(genderText: gender, animalText: animal, hobbieText: hobbie)
    }
    
    @objc private func textFieldDidChange() {
        guard let gender = genderTextField.text,
              let animal = animalPrefferenceTextField.text,
              let hobbie = hobbieTextField.text else { return }
        finishButton.isHidden = gender.isEmpty || animal.isEmpty || hobbie.isEmpty
    }
    
    func show(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func setAnimalTextField(text: String) {
        animalPrefferenceTextField.text = text
        textFieldDidChange()
    }
    
    func setHobbieTextField(text: String) {
        hobbieTextField.text = text
        textFieldDidChange()
    }
    
    func approveFields() {
        genderTextField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        animalPrefferenceTextField.backgroundColor = .green.withAlphaComponent(0.1)
        hobbieTextField.backgroundColor = .green.withAlphaComponent(0.1)
    }
    
    func unapproveFields() {
        genderTextField.backgroundColor = .gray.withAlphaComponent(0.1)
        animalPrefferenceTextField.backgroundColor = .red.withAlphaComponent(0.1)
        hobbieTextField.backgroundColor = .gray.withAlphaComponent(0.1)
    }
    
    func showNext() {
        autoFillButton.isHidden = true
        finishButton.isHidden = true
        nextButton.isHidden = false
        genderTextField.isEnabled = false
        animalPrefferenceTextField.isEnabled = false
        hobbieTextField.isEnabled = false
    }
    
    @objc private func nextTouchInside() {
        viewModel.nextTapped()
    }
    
    func present(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func startAnimating() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.stopAnimating()
        }
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }

}

// MARK: - TextField delegate
extension SetUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        animalPrefferenceTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
        hobbieTextField.resignFirstResponder()
        return true
    }
}
