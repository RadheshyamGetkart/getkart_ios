//
//  BlockedUserView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 18/02/25.
//

import SwiftUI

struct BlockedUserView: View {
    @Environment(\.presentationMode) var presentationMode

        var body: some View {
            Text("Detail View")
                .navigationBarBackButtonHidden(true)
                .navigationTitle("")
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
                            Text("Blocked User").font(Font.manrope(.bold, size: 20))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }

                }
        }
        
    }


#Preview {
    BlockedUserView()
}
