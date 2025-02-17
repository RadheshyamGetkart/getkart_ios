//
//  OTPView.swift
//  Getkart
//
//  Created by gurmukh singh on 2/11/25.
//
import SwiftUI

struct OTPView: View {
    @State var emailPhone: String = ""
    
    var body: some View {
        VStack {
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
                
                
                
            }.padding(.top ,10)
            
            HStack{
                Text("Sign in with mobile")
                    .bold()
                    .font(ManropeFont.manrope(.bold, size: 20.0))
                    .padding(.horizontal)
                    .frame(height: 50)
                Spacer()
            }.padding(.top ,100)
            
            HStack{
                Text(emailPhone)
                    .font(ManropeFont.manrope(.regular, size: 20.0))
                    .padding(.horizontal)
                    .frame(height: 50)
                
               
                Button(action:{
                    
                }){
                    Text("Change")
                        .font(ManropeFont.manrope(.regular, size: 15.0))
                        .foregroundColor(.orange)
                        .underline()
                }
                Spacer()
            }.padding(.top ,10)
            
            HStack{
                Spacer()
                TextField("Enter OTP", text: $emailPhone)
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
            HStack{
                Button( action: validateOTP){
                    Text("Continue")
                        .bold()
                        .font(.system(size: 12.0))
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
        
    }
}


#Preview {
    OTPView()
}
