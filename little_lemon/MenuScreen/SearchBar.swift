//
//  SearchBar.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 14/03/2023.
//

import SwiftUI

struct SearchBar: View {
    var prompt: String
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField(prompt, text: $searchText)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding(.horizontal, 8)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                })
            }
        }
        .padding(8)
        .background(.white)
        .cornerRadius(10)
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    @State var searchText = ""
//    
//    static var previews: some View {
//        let searchBar = SearchBar_Previews()
//        return SearchBar(prompt: "Search Menu", searchText: searchBar.$searchText)
//    }
//}
