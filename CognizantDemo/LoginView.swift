//
//  LoginView.swift
//  CognizantDemo
//
//  Created by Jalp on 15/04/2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: Session
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    var body: some View {
        ZStack {
            // Linear Gradient as background
            LinearGradient(gradient: Gradient(colors: [.red, .purple, .blue, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Cognizant Login")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                }
                
                Spacer()
                
                VStack {
                    // Username field
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color("bkg"))
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)).opacity(0.1), radius: 5, x: 0, y: 5)
                            .padding(.all)
                        TextField("Username", text: $userEmail)
                            .frame(height: 60)
                            .keyboardType(.emailAddress)
                    }
                    Divider()
                    // Password field
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color("bkg"))
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)).opacity(0.1), radius: 5, x: 0, y: 5)
                            .padding(.all)
                        SecureField("Password", text: $userPassword)
                            .frame(height: 60)
                    }
                }
                .frame(width: 360, height: 190)
                .background(VisualBlur(blurStyle: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)).opacity(0.3), radius: 20, x: 10, y: 10)
                
                Spacer()
                
                // Login Button
                Button(action: {
                    // Set the autenticated value in session class to true
                    self.session.authenticated = true
                }
                ) {
                    Text("Sign In")
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: ScreenBounds.deviceWidth - 200)
                        .padding(12)
                        .padding(.horizontal, 30)
                        .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                Spacer()
            }
        }
    }
}

