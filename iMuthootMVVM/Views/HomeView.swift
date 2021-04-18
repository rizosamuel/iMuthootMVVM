//
//  ContentView.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var isLoggedIn = false
    @State private var isRoute = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    NavigationLink(destination: LoginView(), isActive: $isRoute) { EmptyView() }
                    Text("You aren't signed in")
                        .font(.largeTitle)
                    Button(action: {
                        isRoute.toggle()
                    }, label: {
                        Text("Login")
                            .textCase(.uppercase)
                            .padding()
                    })
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Globals.Color.primary)
                    .cornerRadius(15)
                    .padding()
                }
                .opacity(isLoggedIn ? 0 : 1)
                .onAppear {
                    viewModel.fetchOffers()
                }
                
                VStack {
                    Text("You are signed in")
                        .font(.largeTitle)
                }
                .opacity(isLoggedIn ? 1 : 0)
            }
            .navigationTitle("Home")
            .toolbar {
                Button {
                    isRoute.toggle()
                } label: {
                    Label("Login", systemImage: "arrow.right.square")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
