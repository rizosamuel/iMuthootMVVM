//
//  LoginView.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    @State private var isLogin = false
    @State private var isRoute = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Username")
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Username", text: $viewModel.username) .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                    .padding(.trailing)
                    .autocapitalization(.none)
                Text(viewModel.errorUsername)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Password")
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 12))
                    .padding(.top)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Password", text: $viewModel.password) .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing)
                    .padding(.leading)
                Text(viewModel.errorPassword)
                    .foregroundColor(.red)
                    .font(.system(size: 12))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Button(action: {
                    if viewModel.isValid {
                        viewModel.loginToMuthoot()
                        isLogin.toggle()
                    }
                }, label: {
                    Text("Login")
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .padding()
                        .popover(isPresented: $isRoute) {
                            HomeView()
                        }
                })
                .alert(isPresented: $isLogin) {
                    Alert(title: Text("Login Successful"), message: Text(viewModel.mobile), dismissButton: .default(Text("Okay"), action: {
                        isRoute.toggle()
                    }))
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Globals.Color.primary)
                .cornerRadius(15)
                .padding()
                .disabled(!viewModel.isValid)
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().colorScheme(.dark)
    }
}
