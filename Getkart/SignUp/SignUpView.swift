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
            ScrollView{
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        
                        Text("Skip").font(ManropeFont.manrope(.medium, size: 18.0)).frame(width: 100,height: 35).foregroundColor(Color(hex: " #fa7860"))
                        
                    }.background(Color(hex: "#f6e7e9")).cornerRadius(17.5).padding(10)
                }
                VStack{
                    HStack{
                        Text("Welcome").multilineTextAlignment(.leading).font(ManropeFont.manrope(.extraBold, size: 22.0)).padding(.trailing,10)
                        Spacer()
                    }.padding(5)
                    HStack{
                        
                        Text("Sign up").multilineTextAlignment(.leading).font(ManropeFont.manrope(.regular, size: 18.0)).padding(.trailing,10)
                        Spacer()
                    }.padding(5)
                }.padding([.leading,.trailing],15)
                Spacer()
            }
          
            }
        }
    }

    

#Preview {
    SignUpView()
}
