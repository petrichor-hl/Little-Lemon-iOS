//
//  EmailNotifications.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 10/03/2023.
//

import SwiftUI

struct EmailNotifications: View {
    @State private var isOnOrderStatuses = true
    @State private var isOnPasswordChange = true
    @State private var isOnSpecialOffers = true
    @State private var isOnNewsletter = true

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Email notifications")
                .font(.title3)
                .bold()
            
            Label {
                Text("Order Statuses")
            } icon: {
                Image(systemName: isOnOrderStatuses ? "checkmark.square.fill" : "square")
                    .foregroundColor(deepGreen)
            }
            .onTapGesture {
                isOnOrderStatuses.toggle()
            }

            Label {
                Text("Password changes")
            } icon: {
                Image(systemName: isOnPasswordChange ? "checkmark.square.fill" : "square")
                    .foregroundColor(deepGreen)
            }
            .onTapGesture {
                isOnPasswordChange.toggle()
            }
            
            Label {
                Text("Special Offers")
            } icon: {
                Image(systemName: isOnSpecialOffers ? "checkmark.square.fill" : "square")
                    .foregroundColor(deepGreen)
            }
            .onTapGesture {
                isOnSpecialOffers.toggle()
            }
            
            Label {
                Text("Newsletter")
            } icon: {
                Image(systemName: isOnNewsletter ? "checkmark.square.fill" : "square")
                    .foregroundColor(deepGreen)
            }
            .onTapGesture {
                isOnNewsletter.toggle()
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom)
    }
}
