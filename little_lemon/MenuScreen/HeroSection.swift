//
//  HeroSection.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

struct HeroSection: View {
    @Binding var searchText: String
    
    var body: some View {

        VStack(spacing: 0) {
            Text("Little Lemon")
                .font(Font.system(size: 40).bold())
                .foregroundColor(yellow)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                
                VStack {
                    Text("Chicago")
                        .font(Font.system(size: 28).bold())
                        .foregroundColor(Color(.white))
                        .padding(.bottom, 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .font(Font.system(size: 14).bold())
                        .foregroundColor(Color(.white))
                        .padding(.trailing, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 120)
                
                Image("HeroImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                    // trying remove cornerRadius(10) to see amazing things.
                    // Then, read docs: https://sarunw.com/posts/how-to-resize-swiftui-image-and-keep-aspect-ratio/
            }
            .padding(.bottom)
            
            SearchBar(prompt: "Search Menu", searchText: $searchText)

        }
        .padding()
        .background(deepGreen)
    }
}

struct HeroSection_Previews: PreviewProvider {
    @State var searchText = ""

    static var previews: some View {
        let heroSection = HeroSection_Previews()
        return HeroSection(searchText: heroSection.$searchText)
    }
}
