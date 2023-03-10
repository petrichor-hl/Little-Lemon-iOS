//
//  HeroSection.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

struct HeroSection: View {
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
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .font(Font.system(size: 16).bold())
                        .foregroundColor(Color(.white))
                        .frame(width: 220, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Image("HeroImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .cornerRadius(10)
                    // trying remove cornerRadius(10) to see amazing things.
                    // Then, read docs: https://sarunw.com/posts/how-to-resize-swiftui-image-and-keep-aspect-ratio/
            }
        }
        .padding()
        .background(deepGreen)

    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection()
    }
}
