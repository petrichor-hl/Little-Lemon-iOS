//
//  Header.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        Image("Logo")
            .frame(maxWidth: .infinity, minHeight: 70)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
