//
//  PrivacyView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        
        VStack{
           
            if let url = URL(string: ""){
                Webview(url: url)
            }
            
        }
    }
}

#Preview {
    PrivacyView()
}
