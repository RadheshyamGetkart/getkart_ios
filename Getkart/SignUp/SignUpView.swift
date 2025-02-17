//
//  SignUpView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct SignUpView: View {
   
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button {
                    
                } label: {
                    
                    Text("Skip").frame(width: 100,height: 30).foregroundColor(Color(hex: " #f8b8af")).overlay(
                        RoundedRectangle(cornerRadius: 15).stroke(Color(hex: "#f6e7e9"), lineWidth: 2)
                    )
                }
                
                Text("Welcome")
                Text("Sign up")

                
            }
        }
    }
}
    

#Preview {
    SignUpView()
}
