//
//  OTPView.swift
//  Getkart
//
//  Created by gurmukh singh on 2/11/25.
//
import SwiftUI

struct OTPView: View {
    @State var emailPhone: String = ""
    @State var otp: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateMyLocation = false
    var body: some View {
        VStack {
            NavigationLink(destination: MyLocationView(), isActive: $navigateMyLocation) {
                               //EmptyView()
                           }
            
            HStack{
                Spacer()
                Button( action: {
                    
                }){
                    
                    
                    Text("Skip")
                        .frame(width: 80,height: 25)
                    
                    
                    
                    
                }.foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(12.5)
                    .padding(.trailing,10)
                
                
                
            }.padding(.top ,10)
            
            HStack{
                Text("Sign in with mobile")
                    .font(Font.manrope(.bold, size: 20.0))
                    .padding(.horizontal)
                    .frame(height: 50)
                Spacer()
            }.padding(.top ,100)
            
            
            HStack{
                Text(emailPhone)
                    .font(Font.manrope(.regular, size: 20.0))
                    .padding(.horizontal)
                    .frame(height: 50)
                
                
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Change")
                        .font(Font.manrope(.regular, size: 15.0))
                        .foregroundColor(.orange)
                        .underline()
                }
                Spacer()
            }.padding(.top ,10)
            
            HStack{
                Spacer()
                TextField("Enter OTP", text: $otp)
                    .font(Font.manrope(.regular, size: 15.0))
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
            HStack{
                Button( action: validateOTP){
                    Text("Continue")
                        .font(Font.manrope(.regular, size: 15.0))
                        .frame(width: (UIScreen.main.bounds.size.width - 60),height: 40)
                        .padding([.leading,.trailing],10)
                }.foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
                
                
            }
            Spacer()
            
        }
        
    }
    func validateOTP(){
        
        navigateMyLocation = true
    }
}


#Preview {
    OTPView()
}
