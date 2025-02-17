//
//  SignUpView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false
   
    var body: some View {
        
        VStack{
            ScrollView{
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        
                        Text("Skip").font(ManropeFont.manrope(.medium, size: 18.0)).frame(width: 90,height: 32).foregroundColor(Color(hex: " #fa7860"))
                        
                    }.background(Color(hex: "#f6e7e9")).cornerRadius(16.0)
                }
                VStack (alignment: .leading) {
                    HStack{
                        Text("Welcome").multilineTextAlignment(.leading).font(ManropeFont.manrope(.extraBold, size: 28.0)).padding(.trailing,10)
                        Spacer()
                    }.padding(0)
                    HStack{
                        
                        Text("Sign up").multilineTextAlignment(.leading).font(ManropeFont.manrope(.regular, size: 18.0)).padding(.trailing,10)
                        Spacer()
                    }.padding(3)
                }.padding(.top,25)
                
                
                VStack (alignment: .leading,spacing: 5) {
                    TextField("Email Address", text: $email).font(ManropeFont.manrope(.regular, size: 16.0))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(email.isEmpty ? Color.red : Color.gray, lineWidth: 1))
                    
                    if (email.isEmpty || !Validator.validateEmail(email)) && showError {
                        Text("Please enter valid email").font(ManropeFont.manrope(.regular, size: 14.0)).multilineTextAlignment(.leading)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.leading, 5)
                    }
                }.padding(.top,25)
                
                VStack (alignment: .leading,spacing: 5) {
                    TextField("User Name", text: $username).font(ManropeFont.manrope(.regular, size: 16.0))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(username.isEmpty ? Color.red : Color.gray, lineWidth: 1))
                    
                    
                    if username.isEmpty && showError {
                        Text("Field must not be empty").font(ManropeFont.manrope(.regular, size: 14.0)).multilineTextAlignment(.leading)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.leading, 5)
                    }
                }.padding(.top,15)
                
                VStack (alignment: .leading,spacing: 5) {
                    
                    HStack{
                        SecureField("Password", text: $password).font(ManropeFont.manrope(.regular, size: 16.0))
                            .padding()
                        // .overlay(RoundedRectangle(cornerRadius: 8).stroke(password.isEmpty ? Color.red : Color.gray, lineWidth: 1))
                        Button {
                            
                        } label: {
                            Image(systemName: "eye.slash.fill")
                        }.padding(.trailing,10)
                        
                    }.overlay(RoundedRectangle(cornerRadius: 8).stroke(password.isEmpty ? Color.red : Color.gray, lineWidth: 1))
                    if password.isEmpty && showError {
                        Text("Field must not be empty").font(ManropeFont.manrope(.regular, size: 14.0)).multilineTextAlignment(.leading)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.leading, 5)
                    }
                }.padding(.top,15)
                
                
                Button(action: {
                    
                    if email.isEmpty || !Validator.validateEmail(email){
                        showError = true
                    }else if  username.isEmpty {
                        showError = true
                        
                    }else if password.isEmpty{
                        showError = true
                        
                    }else{
                        showError = false
                    }
                    
                }) {
                    Text("Verify Email Address").font(ManropeFont.manrope(.regular, size: 16.0))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(8)
                }.padding([.top,.bottom],25)
                
                    .disabled(email.isEmpty || username.isEmpty || password.isEmpty)
                
                HStack {
                    Text("Already have an account?").font(ManropeFont.manrope(.bold, size: 16.0))
                        .foregroundColor(.gray)
                    
                    Button(action: {}) {
                        Text("Log in").foregroundColor(Color(hex: " #fa7860")).underline().font(ManropeFont.manrope(.medium, size: 16.0))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 8)
                
                Text("Or sign in with").font(ManropeFont.manrope(.regular, size: 14.0))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                
                Text("By Signing Up /Logging in, You agree to our").font(ManropeFont.manrope(.regular, size: 14.0))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                HStack{
                    Button {
                        
                    } label: {
                        Text("Terms of Service").underline().foregroundColor(Color(hex: " #fa7860")).font(ManropeFont.manrope(.medium, size: 14.0))
                    }
                    
                    Text("and").font(ManropeFont.manrope(.regular, size: 14.0)).foregroundColor(.gray)
                    
                    Button {
                        
                    } label: {
                        Text("Privacy Policy").underline().foregroundColor(Color(hex: " #fa7860")).font(ManropeFont.manrope(.regular, size: 14.0))
                    }
                    
                }.padding(.top,1)
            }
            .padding()
            Spacer()
        }
        
    }
        }
    

    

#Preview {
    SignUpView()
}




