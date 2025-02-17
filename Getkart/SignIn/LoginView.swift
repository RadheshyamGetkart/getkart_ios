//
//  ContentView.swift
//  Getkart
//
//  Created by gurmukh singh on 1/15/25.
//

import SwiftUI

struct LoginView: View {
    @State private var emailPhone: String = "naresh.kumar@getkart.com"
    @State private var navigateToOTP = false
    @State private var navigateToSignUp = false
    var body: some View {
        NavigationView  {
            VStack {
                
                // Hidden NavigationLink for the first screen
                NavigationLink(destination: OTPView(emailPhone: emailPhone), isActive: $navigateToOTP) {
                                   //EmptyView()
                               }
                NavigationLink(destination: SignUpView(), isActive: $navigateToSignUp) {
                                   //EmptyView()
                               }
                               
                ScrollView{
                    HStack{
                        Spacer()
                        Button( action: {
                            
                        }){
                            Text("Skip")
                                .multilineTextAlignment(.center)
                                .font(ManropeFont.manrope(.bold, size: 12.0))
                                .padding(.horizontal)
                                .frame(width: 80,height: 25)
                            
                            
                        }.foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(12.5)
                            .padding(.trailing,10)
                        
                        
                        
                    }
                    HStack{
                        Text("Welcome")
                            .font(ManropeFont.manrope(.bold, size: 20.0))
                            .padding(.horizontal)
                            .frame(height: 50)
                        Spacer()
                    }.padding(.top ,100)
                    
                    HStack {
                        Text("Login to Getkart")
                            .font(ManropeFont.manrope(.regular, size: 15.0))
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        TextField("Enter Email or Phone", text: $emailPhone)
                            .font(ManropeFont.manrope(.regular, size: 15.0))
                            .background(.white)
                            .frame(height: 40)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(10)
                        
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("0/50")
                            .padding(.trailing, 20).foregroundColor(.gray)
                    }.padding(.top ,-10)
                    
                    
                    HStack{
                        Button( action: loginWithEmailPhone){
                            Text("Continue")
                                .font(ManropeFont.manrope(.bold, size: 15.0))
                                
                                .frame(width: (UIScreen.main.bounds.size.width - 60),height: 50)
                            
                        }.foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(10)
                        
                        
                    }
                    
                    HStack{
                        Text("Don't have an account?")
                            .font(ManropeFont.manrope(.regular, size: 12.0))
                            .padding(.top ,10)
                        Button(action:{
                            navigateToSignUp = true
                        }){
                            Text("Sign up")
                                .font(ManropeFont.manrope(.regular, size: 12.0))
                                .foregroundColor(.orange)
                                .underline()
                        }
                        
                        
                    }
                    HStack {
                        Text("Or sign in with")
                            .font(ManropeFont.manrope(.regular, size: 12.0))      .padding(.top ,10)
                    }
                    
                    HStack {
                        Button(action:{
                            
                        }) {
                            HStack{
                                Spacer()
                                Image("login_Google").resizable().frame(width: 30,height: 30)
                                    .padding(.trailing ,10)
                                Text("Continue with Google")
                                    .font(ManropeFont.manrope(.regular, size: 15.0))
                                    .foregroundColor(.black)
                                    .frame(height: 50)
                                
                                
                                
                                Spacer()
                                
                            }.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1))
                            .padding()
                            
                            
                        }
                        
                    }
                    HStack {
                        Button(action:{
                            
                        }) {
                            HStack{
                                Spacer()
                                Image("login_Apple").resizable().frame(width: 30,height: 30)
                                    .padding(.trailing ,10)
                                    .frame(width: 30, height: 30)
                                Text("Continue with Apple")
                                    .font(ManropeFont.manrope(.regular, size: 15.0))
                                    .foregroundColor(.black).frame(height: 50)
                                
                                Spacer()
                                
                            }.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1))
                            .padding()
                            
                            
                        }
                        
                    }
                }
                Spacer()
                HStack {
                    Text("By Signning Up/Logging in, you agree to our")
                        .font(ManropeFont.manrope(.regular, size: 10.0))
                        .padding(.horizontal)
                }
                
                HStack {
                    Spacer()
                    Button(action:{
                        
                    }){
                        Text("Terms of Service")
                            .font(ManropeFont.manrope(.regular, size: 12.0))
                            .foregroundColor(.orange)
                            .underline()
                    }
                    
                    Text("and")
                        .font(ManropeFont.manrope(.regular, size: 12.0))
                    
                    
                    Button(action:{
                        
                    }){
                        Text("Privacy Policy")
                            .font(ManropeFont.manrope(.regular, size: 12.0))
                            .foregroundColor(.orange)
                            .underline()
                    }
                    Spacer()
                }
                
                
            }
            .padding()
            
        }
    }
    func loginWithEmailPhone(){
        print("Text entered", $emailPhone.wrappedValue)
        if validatePhoneNumber($emailPhone.wrappedValue) == true {
            print("Login via Phone")
            navigateToOTP = true
        }else if validateEmail( $emailPhone.wrappedValue) == true {
            print("Login via Email")
            navigateToOTP = true
        }else {
            print("Enter validEmail or Phone")
            navigateToOTP = false
        }
    }
    
    func validateEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        // Define the regex pattern for a valid phone number (10 digits)
        let phoneRegex = "^[0-9]{10}$"
        
        // Use NSPredicate to match the phone number with the regex pattern
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        // Check if the phone number matches the pattern
        let isValidFormat = phoneTest.evaluate(with: phoneNumber)
        
        // Additional check to ensure that all digits are not the same (e.g., 9999999999)
        let allCharactersAreSame = Set(phoneNumber).count == 1
        
        // Return true if the phone number is valid and not a repeated digit
        return isValidFormat && !allCharactersAreSame
    }

}




#Preview {
    LoginView()
}
