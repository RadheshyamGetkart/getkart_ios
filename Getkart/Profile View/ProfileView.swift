//
//  ProfileView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack{
            
           /* let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            
            HStack{
                
                Text("My Profile").padding(.leading,10)
                Spacer()
            }.frame(height:((keyWindow?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0.0))).background()*/
            //+ 44.0
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.orange)
                        VStack(alignment: .leading) {
                            Text("Anonymous")
                                .font(.headline)
                            Text("Login first")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            print("Login")
                            authManager.logout()
                           // presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Login")
                                .padding().frame(width: 100, height: 35)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
                                        
                    
                    ProfileOption(icon: "crown.fill", text: "My Boost Ads").onTapGesture {
                        
                    }
                    ProfileOption(icon: "subscription", text: "Subscription").onTapGesture {
                        
                    }
                    ProfileOption(icon: "transaction", text: "Transaction History").onTapGesture {
                        
                    }
                    ProfileOption(icon: "language", text: "Language").onTapGesture {
                        
                    }
                    ProfileToggleOption(icon: "dark_theme", text: "Dark Theme")
                    
                    ProfileOption(icon: "notification", text: "Notifications").onTapGesture {
                        
                    }
                    
                    NavigationLink(destination: PrivacyView(title: "Blogs", type: .blogs).navigationBarBackButtonHidden(true)) {

                    ProfileOption(icon: "article", text: "Blogs")
                        
                    }
                    ProfileOption(icon: "like_fill", text: "Favorites").onTapGesture {
                        
                    }

                    NavigationLink(destination: PrivacyView(title: "FAQs", type: .faq).navigationBarBackButtonHidden(true)) {

                    ProfileOption(icon: "doc.text.fill", text: "FAQs")
                        
                    }

                    ProfileOption(icon: "share", text: "Share this App").onTapGesture {
                        
                    }
                    ProfileOption(icon: "rate_us", text: "Rate us").onTapGesture {
                        
                    }

                    ProfileOption(icon: "contact_us", text: "Contact us").onTapGesture {
                        
                    }
                    
                    NavigationLink(destination: PrivacyView(title: "About us", type: .aboutUs).navigationBarBackButtonHidden(true)) {

                    ProfileOption(icon: "about_us", text: "About us")
                        
                    }
                    
                    NavigationLink(destination: PrivacyView(title: "Terms of Service", type: .termsAndConditions).navigationBarBackButtonHidden(true)) {

                    ProfileOption(icon: "t_c", text: "Terms & Conditions")
                        
                    }
                    NavigationLink(destination: PrivacyView(title: "Privacy Policy", type: .privacy).navigationBarBackButtonHidden(true)) {
                        
                        ProfileOption(icon: "privacypolicy", text: "Privacy Policy")
                    }
                    
                    
                    NavigationLink(destination: PrivacyView(title: "Privacy Policy", type: .refundAndCancellationPolicy).navigationBarBackButtonHidden(true)) {

                    ProfileOption(icon: "privacypolicy", text: "Refunds & Cancellation policy")
                        
                    }
                    
                    
                    
                    //delete_account
                  

                    Spacer()
                }
                .padding()
            }
            .background(Color(.systemGray6))

        } 

            .onAppear{
                
            }
    }
}

#Preview {
    ProfileView()
}





struct ProfileOption: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(icon)
                .foregroundColor(.orange)
                .frame(width: 30, height: 30)
                .background(Color(.systemYellow).opacity(0.2))
                .cornerRadius(8)
            Text(text).foregroundColor(.black)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(10)
    }
}

struct ProfileToggleOption: View {
    var icon: String
    var text: String
    @State private var isOn = false
    
    var body: some View {
        HStack {
            Image(icon)
                .foregroundColor(.orange)
                .frame(width: 30, height: 30)
                .background(Color(.systemYellow).opacity(0.2))
                .cornerRadius(8)
            Text(text)
                .font(.body)
            Spacer()
            Toggle("", isOn: $isOn).tint(.orange)
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(10)
    }
}
