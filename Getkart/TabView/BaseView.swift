//
//  BaseView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct BaseView: View  {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Chat")
                }
                .tag(1)
            
            Button {
                
            } label: {
                Image(systemName: "plus.circle.fill")
                    .renderingMode(.original)
                    .font(.system(size: 32))
            }

//            AddPostView()
//                .tabItem {
//                    Image(systemName: "plus.circle.fill")
//                        .renderingMode(.original)
//                        .font(.system(size: 32))
//                }
//                .tag(2)
            
            MyAdsView()
                .tabItem {
                    Image(systemName: "square.stack.fill")
                    Text("My ads")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.orange)
    }
}

#Preview {
    BaseView()
}


extension BaseView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
      
        GeometryReader { geo in
            
            HStack(spacing: 0){
                Spacer()
                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? .black : .gray)
                    .frame(width: 20, height: 20)
                //   if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
                //  }
                Spacer()
            }
            .frame(width: (UIScreen.main.bounds.size.width)/5.0, height: 50)
        }
//        .background(isActive ? .purple.opacity(0.4) : .clear)
//        .cornerRadius(30)
    }
}


enum TabbedItems: Int, CaseIterable{
   
    case home = 0
    case chat
    case myAds
    case profile
    
    var title: String{
        
        switch self {
        case .home:
            return "Home"
        case .myAds:
            return "My ads"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home-icon"
        case .myAds:
            return "favorite-icon"
        case .chat:
            return "chat-icon"
        case .profile:
            return "profile-icon"
        }
    }
}


struct AddPostView: View {
    var body: some View {
        Text("Add Post Screen")
    }
}
