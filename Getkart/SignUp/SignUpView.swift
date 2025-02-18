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
    @Binding var navigateToSignUp: Bool

    var body: some View {
        
        VStack{
            ScrollView{
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        
                        Text("Skip")
                            .font(Font.manrope(.medium, size: 18.0))
                            .frame(width: 90,height: 32)
                            .foregroundColor(Color(hex: " #fa7860"))
                        
                    }.background(Color(hex: "#f6e7e9")).cornerRadius(16.0)
                }
                VStack (alignment: .leading) {
                    HStack{
                        Text("Welcome").multilineTextAlignment(.leading).font(Font.manrope(.extraBold, size: 28.0)).padding(.trailing,10)
                        Spacer()
                    }.padding(0)
                    HStack{
                        
                        Text("Sign up").multilineTextAlignment(.leading).font(Font.manrope(.regular, size: 18.0)).padding(.trailing,10)
                        Spacer()
                    }.padding(3)
                }.padding(.top,25)
                
                
                VStack (alignment: .leading,spacing: 5) {
                    TextField("Email Address", text: $email).font(Font.manrope(.regular, size: 16.0))
                      .frame(height: 55)
                        .padding([.leading, .trailing])
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke((email.isEmpty && showError)  ? Color(hex: "#a60404") : Color.gray, lineWidth: 1))
                    
                    if (email.isEmpty || !Validator.validateEmail(email)) && showError {
                        Text("Please enter valid email").font(Font.manrope(.regular, size: 14.0)).multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: "#a60404"))
                            .font(.caption)
                            .padding(.leading, 5)
                    }
                }.padding(.top,25)
                
                VStack (alignment: .leading,spacing: 5) {
                    TextField("User Name", text: $username).font(Font.manrope(.regular, size: 16.0))
                    .frame(height: 55)
                        .padding([.leading, .trailing])
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke((username.isEmpty && showError) ? Color(hex: "#a60404") : Color.gray, lineWidth: 1))
                    
                    
                    if username.isEmpty && showError {
                        Text("Field must not be empty").font(Font.manrope(.regular, size: 14.0)).multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: "#a60404"))
                            .font(.caption)
                            .padding(.leading, 5)
                    }
                }.padding(.top,15)
                
                VStack (alignment: .leading,spacing: 5) {
                    
                    HStack{
                        SecureField("Password", text: $password).font(Font.manrope(.regular, size: 16.0))
                          .frame(height: 55)
                            .padding([.leading, .trailing])
                        // .overlay(RoundedRectangle(cornerRadius: 8).stroke(password.isEmpty ? Color.red : Color.gray, lineWidth: 1))
                        Button {
                            
                        } label: {
                            Image(systemName: "eye.slash.fill")
                        }.padding(.trailing,10)
                        
                    }.overlay(RoundedRectangle(cornerRadius: 8).stroke((password.isEmpty && showError) ? Color(hex: "#a60404") : Color.gray, lineWidth: 1))
                   
                    if password.isEmpty && showError {
                        let msg = password.isEmpty ? "Field must not be empty" : "Password must be 6 character long."
                        Text(msg).font(Font.manrope(.regular, size: 14.0)).multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: "#a60404"))
                            .font(.caption)
                            .padding(.leading, 5)
                    }
                }.padding(.top,15)
                
                
                Button(action: {
                    
                    if email.isEmpty || !Validator.validateEmail(email){
                        showError = true
                    }else if  username.isEmpty {
                        showError = true
                        
                    }else if password.isEmpty || password.count < 6{
                        showError = true
                        
                    }else{
                        showError = false
                    }
                    
                }) {
                    Text("Verify Email Address").font(Font.manrope(.regular, size: 16.0))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity).frame(minHeight:50, maxHeight: 50)
                        .background(Color(hex: "#ffad33"))
                        .cornerRadius(8)
                }.padding([.top,.bottom],25)
                
                   // .disabled(email.isEmpty || username.isEmpty || password.isEmpty)
                
                HStack {
                    Text("Already have an account?").font(Font.manrope(.bold, size: 16.0))
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        
                        self.navigateToSignUp = false
                    }) {
                        Text("Log in").foregroundColor(Color(hex: " #fa7860")).underline().font(Font.manrope(.medium, size: 16.0))
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 8)
                
                Text("Or sign in with").font(Font.manrope(.regular, size: 14.0))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                
                
                    Button(action:{
                        
                    }) {
                        HStack{
                            Spacer()
                            Image("login_Google").resizable().frame(width: 30,height: 30)
                               
                            Text("Continue with Google")
                                .font(Font.manrope(.medium, size: 16.0))
                                .foregroundColor(.black)
                                .frame(height: 50)
                            
                       Spacer()
                            
                        }
                            .frame(maxWidth: .infinity).frame(minHeight:50, maxHeight: 50) .padding([.leading, .trailing]).overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1))
                        
                    }.padding(.top,25)
                    

                
                Text("By Signing Up /Logging in, You agree to our").font(Font.manrope(.regular, size: 14.0))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 15)
                
                HStack{
                    Button {
                        
                    } label: {
                        Text("Terms of Service").underline().foregroundColor(Color(hex: " #fa7860")).font(Font.manrope(.medium, size: 14.0))
                    }
                    
                    Text("and").font(Font.manrope(.regular, size: 14.0)).foregroundColor(.gray)
                    
                    Button {
                        
                    } label: {
                        Text("Privacy Policy").underline().foregroundColor(Color(hex: " #fa7860")).font(Font.manrope(.regular, size: 14.0))
                    }
                    
                }.padding(.top,1)
            }
            .padding()
            Spacer()
        }
        
    }
        }
    

    

#Preview {
    SignUpView(navigateToSignUp: .constant(false))
}




