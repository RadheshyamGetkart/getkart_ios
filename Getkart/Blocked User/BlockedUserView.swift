//
//  BlockedUserView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 18/02/25.
//

import SwiftUI

struct BlockedUserView: View {
    
        var body: some View {
            Text("Detail View")
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Detail Title")
                // 1
                .toolbar {

                    // 2
                    ToolbarItem(placement: .navigationBarLeading) {

                        Button {
                            // 3
                            print("Custom Action")

                        } label: {
                            // 4
                            HStack {

                                Image(systemName: "chevron.backward")
                                Text("Custom Back")
                            }
                        }
                    }
                }
        }
        
    }


#Preview {
    BlockedUserView()
}
