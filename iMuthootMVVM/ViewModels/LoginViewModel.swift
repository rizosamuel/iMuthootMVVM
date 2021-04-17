//
//  LoginViewModel.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published private(set) var isLoading = false
    
    @Published var username = ""
    @Published var password = ""
    
    @Published var isValid = false
    @Published var isFailure = false
    
    @Published var ApiErrorMessage = ""
    @Published var errorUsername = ""
    @Published var errorPassword = ""
    
    @Published var mobile = ""

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        isFormValid
            .assign(to: \.isValid, on: self)
            .store(in: &cancellables)
    }
    
    func loginToMuthoot() {
        
        let resource = LoginResource()
        
        guard !isLoading else { return }
        isLoading = true
        
        resource.execute() { [weak self] (response, error) in
            
            guard error == nil else {
                self?.isFailure = true
                self?.ApiErrorMessage = error!
                return
            }
            
            self?.mobile = response.data!.mobileNumber
            self?.isLoading = false
        }
    }
    
    func verifyOtp() {
        
        let resource = LoginOtpVerifyResource()
        
        guard !isLoading else { return }
        isLoading = true
        
        resource.execute { [weak self] (response, error) in
            
            guard error == nil else {
                self?.isFailure = true
                self?.ApiErrorMessage = error!
                return
            }
            
            // self?.mobileNumber = response.data!.mobileNumber
            self?.isLoading = false
        }
    }
}

// MARK: - Validations

extension LoginViewModel {
    
    private var isUsernameValid: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { if $0.isEmpty {
                self.errorUsername = "Invalid Username"
                return false
            } else {
                self.errorUsername = ""
                return true
            } }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordValid: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { if $0.isEmpty {
                self.errorPassword = "Invalid Password"
                return false
            } else {
                self.errorPassword = ""
                return true
            } }
            .eraseToAnyPublisher()
    }
    
    private var isFormValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUsernameValid, isPasswordValid)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
}
