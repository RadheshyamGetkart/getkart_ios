//
//  MyAdsView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct MyAdsView: View {
    
    @State private var selectedFilter = "All ads"
    let filters = ["All ads", "Live", "Deactivate", "Under Review","Sold out","Rejected"]
    
    var body: some View {
        VStack {
            // Top Filter Buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(filters, id: \.self) { filter in
                        Button(action: {
                            selectedFilter = filter
                        }) {
                            Text(filter).frame(width: 110, height: 25, alignment: .center)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(selectedFilter == filter ? Color.orange : Color(.systemGray5))
                                .foregroundColor(selectedFilter == filter ? .white : .black)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }


            // Empty State
            VStack {
                Spacer()

                Image("no_data_found_illustrator") // Replace with your custom image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray)
                
                Text("No Ads Found")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                
                Text("There are currently no ads available. Start by creating your first ad now!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .foregroundColor(.gray)
                Spacer()

            }


        }.background(Color(.systemGray6))
        //.navigationBarTitle(HStack{Text("My Advertisement")}, displayMode:.inline)
    }
}

#Preview {
    MyAdsView()
}



struct AdsOption: View {
   
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.body)
            Spacer()
        }.frame(width: 120)
        .padding()
        .cornerRadius(10)
    }
}


