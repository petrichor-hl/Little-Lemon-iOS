//
//  MenuBreakdownComponent.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

struct MenuBreakdownComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order For Delivery!")
                .font(Font.system(size: 24).bold())
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Categories.allCases, id: \.self) { category in
                        CategoryItem(category.rawValue)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding([.horizontal, .bottom])
        .padding(.top, 10)
    }
}

struct MenuBreakdownComponent_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdownComponent()
    }
}
