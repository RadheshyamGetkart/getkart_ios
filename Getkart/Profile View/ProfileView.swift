//
//  ProfileView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack{
            
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            
            HStack{
                
                Text("My Profile").padding(.leading,10)
                Spacer()
            }.frame(height:((keyWindow?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0.0) + 44.0)).background()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
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
                        Button(action: {}) {
                            Text("Login")
                                .padding().frame(width: 110, height: 35)
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
                    ProfileOption(icon: "play.rectangle.fill", text: "Subscription").onTapGesture {
                        
                    }
                    ProfileOption(icon: "creditcard.fill", text: "Transaction History").onTapGesture {
                        
                    }
                    ProfileOption(icon: "globe", text: "Language").onTapGesture {
                        
                    }
                    ProfileToggleOption(icon: "sun.max.fill", text: "Dark Theme")
                    ProfileOption(icon: "bell.fill", text: "Notifications").onTapGesture {
                        
                    }
                    ProfileOption(icon: "doc.text.fill", text: "Blogs").onTapGesture {
                        
                    }
                    ProfileOption(icon: "doc.text.fill", text: "Favorites").onTapGesture {
                        
                    }

                    ProfileOption(icon: "doc.text.fill", text: "FAQs").onTapGesture {
                        
                    }

                    ProfileOption(icon: "share", text: "Share this App").onTapGesture {
                        
                    }
                    ProfileOption(icon: "rate_us", text: "Rate us").onTapGesture {
                        
                    }

                    ProfileOption(icon: "doc.text.fill", text: "Contact us").onTapGesture {
                        
                    }
                    
                    ProfileOption(icon: "doc.text.fill", text: "About us").onTapGesture {
                        
                    }
                    ProfileOption(icon: "doc.text.fill", text: "Terms & Conditions").onTapGesture {
                        
                    }
                    ProfileOption(icon: "privacypolicy", text: "Privacy Policy").onTapGesture {
                        
                    }
                    ProfileOption(icon: "privacypolicy", text: "Refunds & Cancellation policy").onTapGesture {
                        
                    }
                  

                    Spacer()
                }
                .padding()
            }
            .background(Color(.systemGray6))

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
            Image(systemName: icon)
                .foregroundColor(.orange)
                .frame(width: 30, height: 30)
                .background(Color(.systemYellow).opacity(0.2))
                .cornerRadius(8)
            Text(text)
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
            Image(systemName: icon)
                .foregroundColor(.orange)
                .frame(width: 30, height: 30)
                .background(Color(.systemYellow).opacity(0.2))
                .cornerRadius(8)
            Text(text)
                .font(.body)
            Spacer()
            Toggle("", isOn: $isOn)
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(10)
    }
}
