//
//  PrivacyView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI


enum ViewType{
    
    case privacy
    case termsAndConditions
    case faq
    case blogs
    case aboutUs
    case refundAndCancellationPolicy

}


struct PrivacyView: View {
    @Environment(\.presentationMode) var presentationMode

    var title:String
    var type:ViewType
    
    
  
    
    var body: some View {
        
        VStack{
           
            
            if let url = URL(string:getUrlTYpe(type: type)){
                Webview(url: url).navigationBarBackButtonHidden(true)
               
            }

        } .navigationTitle("")
        // 1
        .toolbar {

            // 2
            ToolbarItem(placement: .navigationBarLeading) {

                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        print("Custom Action")
                        
                    } label: {
                        // 4
                        Image("arrow_left").renderingMode(.template).foregroundColor(.black)
                    }
                    Spacer()
                }
            }
            
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(title).font(Font.manrope(.bold, size: 20))
                        .foregroundColor(.black)
                    Spacer()
                }
            }

        }

        
        
    }
    func getUrlTYpe(type:ViewType) ->String{
       var url:String = ""

       if type == .privacy{
           url = "https://getkart.com/privacy-polic"
       }else if type == .faq{
           url = "https://getkart.com/privacy-polic"
       }else if type == .termsAndConditions{
           url = "https://getkart.com/privacy-polic"
       }else if type == .blogs{
           url = "https://getkart.com/privacy-polic"
       }else if type == .aboutUs{
           url = "https://getkart.com/privacy-polic"
       }else if type == .refundAndCancellationPolicy{
           url = "https://getkart.com/privacy-polic"
       }
        
        
       
        
       return url
   }
}

#Preview {
    PrivacyView(title: "Privacy", type: .privacy)
}
