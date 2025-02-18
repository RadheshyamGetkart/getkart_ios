//
//  ContentView.swift
//  Getkart
//
//  Created by gurmukh singh on 1/15/25.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn
import AuthenticationServices

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
                NavigationLink(destination: SignUpView(navigateToSignUp:$navigateToSignUp).navigationBarBackButtonHidden(true), isActive: $navigateToSignUp) {
                                   //EmptyView()
                               }
                               
                ScrollView{
                    HStack{
                        Spacer()
                        Button( action: {
                            
                        }){
                            Text("Skip")
                                .multilineTextAlignment(.center)
                                .font(Font.manrope(.bold, size: 15))
                                .padding(.horizontal)
                                .frame(width: 80,height: 25)
                            
                            
                        }.foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(12.5)
                            .padding(.trailing,10)
                        
                        
                        
                    }
                    HStack{
                        Text("Welcome")
                            .font(Font.manrope(.bold, size: 20.0))
                            .padding(.horizontal)
                            .frame(height: 50)
                        Spacer()
                    }.padding(.top ,100)
                    
                    HStack {
                        Text("Login to Getkart")
                            .font(Font.manrope(.regular, size: 15.0))
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        TextField("Enter Email or Phone", text: $emailPhone)
                            .font(Font.manrope(.regular, size: 15.0))
                            .background(.white)
                            .frame(height: 50)
                            .padding([.leading, .trailing])
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
                                .font(Font.manrope(.bold, size: 15.0))
                                
                                .frame(width: (UIScreen.main.bounds.size.width - 60),height: 50)
                            
                        }.foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(10)
                        
                        
                    }
                    
                    HStack{
                        Text("Don't have an account?")
                            .font(Font.manrope(.regular, size: 12.0))
                            .padding(.top ,10)
                        Button(action:{
                            navigateToSignUp = true
                        }){
                            Text("Sign up")
                                .font(Font.manrope(.regular, size: 12.0))
                                .foregroundColor(.orange)
                                .underline()
                        }
                        
                        
                    }
                    HStack {
                        Text("Or sign in with")
                            .font(Font.manrope(.regular, size: 12.0))      .padding(.top ,10)
                    }
                    
                    HStack {
                        Button(action:signInWithGoogle) {
                            HStack{
                                Spacer()
                                Image("login_Google").resizable().frame(width: 10,height: 10)
                                    .padding(.trailing ,5)
                                Text("Continue with Google")
                                    .font(Font.manrope(.bold, size: 18.0))
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
                        SignInWithAppleButton()
                                        .frame(height: 50)
                                        .padding()
                                        
                        /*Button(action:{
                            
                        }) {
                            HStack{
                                Spacer()
                                Image("login_Apple").resizable().frame(width: 30,height: 30)
                                    .padding(.trailing ,10)
                                    .frame(width: 30, height: 30)
                                Text("Continue with Apple")
                                    .font(Font.manrope(.regular, size: 15.0))
                                    .foregroundColor(.black).frame(height: 50)
                                
                                Spacer()
                                
                            }.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1))
                            .padding()
                            
                            
                        }*/
                        
                    }
                }
                Spacer()
                HStack {
                    Text("By Signning Up/Logging in, you agree to our")
                        .font(Font.manrope(.regular, size: 10.0))
                        .padding(.horizontal)
                }
                
                HStack {
                    Spacer()
                    Button(action:{
                        
                    }){
                        Text("Terms of Service")
                            .font(Font.manrope(.regular, size: 12.0))
                            .foregroundColor(.orange)
                            .underline()
                    }
                    
                    Text("and")
                        .font(Font.manrope(.regular, size: 12.0))
                    
                    
                    Button(action:{
                        
                    }){
                        Text("Privacy Policy")
                            .font(Font.manrope(.regular, size: 12.0))
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
    
   
    func signInWithGoogle() {
            // Replace with your client ID.
            // If using Firebase, you might retrieve it as:
            // guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            
            // Get the root view controller to present the sign-in flow
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first?.rootViewController else {
                print("Unable to access root view controller.")
                return
            }
            
            // Start the sign-in flow
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) {  result, error in
                if let error = error {
                    print("Error signing in: \(error.localizedDescription)")
                    return
                }
                
                // Successful sign-in
                guard let user = result?.user else { return }
                let fullName = user.profile?.name ?? "No Name"
                let email = user.profile?.email ?? "No Email"
                
                print("User signed in: \(fullName) (\(email))")
                
                // You can now pass this user info to your view model, store tokens, etc.
            }
        
        
        }
    /*func signInWithAppleID(){
        SignInWithAppleButton(.signUp) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { result in
            // ...
            switch result {
            case .success(let authorization):
                if let userCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                    print(userCredential.user)
                
                    if userCredential.authorizedScopes.contains(.fullName) {
                        print(userCredential.fullName)
                    }
                
                    if userCredential.authorizedScopes.contains(.email) {
                        print(userCredential.email)
                    }
                    
                }
            case .failure(let error):
                print("Could not authenticate: \\(error.localizedDescription)")
            }
        }
    }*/
    
    
       
    
        
        

}



struct SignInWithAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton(type: .continue, style: .whiteOutline)
        button.cornerRadius = 10
        button.addTarget(context.coordinator, action: #selector(Coordinator.handleSignInWithApple), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        @objc func handleSignInWithApple() {
            let request = ASAuthorizationAppleIDProvider().createRequest()
            request.requestedScopes = [.fullName, .email]

            let controller = ASAuthorizationController(authorizationRequests: [request])
            controller.delegate = self
            controller.presentationContextProvider = self
            controller.performRequests()
        }

        // MARK: - ASAuthorizationControllerDelegate
        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                let userId = appleIDCredential.user
                let givenName = appleIDCredential.fullName?.givenName ?? ""
                let familyName = appleIDCredential.fullName?.familyName ?? ""
                let email = appleIDCredential.email ?? ""

                print("User ID: \(userId)")
                print("Name: \(givenName) \(familyName)")
                print("Email: \(email)")
            }
        }

        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            print("Sign in with Apple failed: \(error.localizedDescription)")
        }

        // MARK: - ASAuthorizationControllerPresentationContextProviding
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            guard let window = UIApplication.shared.windows.first else {
                fatalError("No window available for presentation")
            }
            return window
        }
    }
}


#Preview {
    LoginView()
}
