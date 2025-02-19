//
//  ChatView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct ChatView: View {
    
    @State private var selectedTab = 0
    
   
    var body: some View {
        
        VStack{
            HStack(spacing: 0){
                VStack{
                    Spacer()

                    Button {
                        selectedTab = 0
                    } label: {
                        Text("Buying").font(Font.manrope(.bold, size: 17)).foregroundColor((selectedTab == 0) ? Color.black : Color.gray)
                    }
                    Spacer()

                    Divider().frame(height: 2).background((selectedTab == 0) ? Color.black : Color.gray)
                }
                
                VStack{
                    Spacer()

                    Button {
                        selectedTab = 1
                    } label: {
                        Text("Selling").font(Font.manrope(.bold, size: 17)).foregroundColor((selectedTab == 1) ? Color.black : Color.gray)
                    }
                    Spacer()
                    Divider().frame(height: 2).background((selectedTab == 1) ? Color.black : Color.gray)
                }
                
            }.frame(height: 45)
            
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    PurchaseView(name: "Nitish Kulkarni", item: "MI Android TV", icon: "delete_illustrator")
                    PurchaseView(name: "Nitish Kulkarni", item: "MI Android TV", icon: "delete_illustrator")
                    
                    PurchaseView(name: "Nitish ", item: "MI Android TV", icon: "delete_illustrator")
                    PurchaseView(name: "Nitish Kulkarni", item: "MI Android TV", icon: "delete_illustrator")
                    PurchaseView(name: "Nitish Kulkarni", item: "MI Android TV", icon: "delete_illustrator")
                }
                
            }.background(Color.clear).padding([.leading,.trailing],10)
            
            Spacer()
        }.background(Color(.systemGray6))
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                // 2
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    NavigationLink(destination: BlockedUserView().navigationBarBackButtonHidden(true)) {
                        
                        Image("blockuser")
                        
                    }
                    
                }
                
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Chats").font(Font.manrope(.bold, size: 20))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }

            }

           /* .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Chats").font(Font.manrope(.bold, size: 20))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                
//                Spacer()
//                
//                ToolbarItem(placement: .navigationBarLeading) {
//                    
//                    NavigationLink(destination: BlockedUserView().navigationBarBackButtonHidden(true)) {
//                        
//                        Image("blockuser")
//                        
//                    }
//                }
                
            }*/
    }
}

#Preview {
    ChatView()
}



struct PurchaseView: View {
    var name: String
    var item: String
    var icon: String

    var body: some View {
            HStack{
                Image(icon).resizable().frame(width: 70,height: 70).cornerRadius(35).padding(10)
                VStack(alignment: .leading) {
                    Spacer(minLength: 10)
                    Text(name)
                        .font(.headline)
                    Text(item)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer(minLength: 10)

                }.padding(0)
                
                Spacer(minLength: 10)
            }.background(Color.white).cornerRadius(10)
    }
}

