//
//  UserProfile.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = UserDefaults.standard.string(forKey: kFirstName)!
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName)!
    @State private var email = UserDefaults.standard.string(forKey: kEmail)!
    @State private var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    var body: some View {
        VStack(spacing: 0) {
            Header()
            ScrollView(showsIndicators: false) {
                Text("Personal information")
                    .font(.title3)
                    .bold()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Avatar()
                
                Group {
                    Text("First Name")
                        .font(Font.system(size: 14).bold())
                        .foregroundColor(deepGreen)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(prompt: "", bindingVariable: $firstName)
                        .padding(.bottom)
                    Text("Last Name")
                        .font(Font.system(size: 14).bold())
                        .foregroundColor(deepGreen)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(prompt: "", bindingVariable: $lastName)
                        .padding(.bottom)
                    
                    Text("Email")
                        .font(Font.system(size: 14).bold())
                        .foregroundColor(deepGreen)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(prompt: "", bindingVariable: $email)
                        .padding(.bottom)

                    Text("Phone Number")
                        .font(Font.system(size: 14).bold())
                        .foregroundColor(deepGreen)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(prompt: "Enter your phone ...", bindingVariable: $phoneNumber)
                        .padding(.bottom)
                }
                
                EmailNotifications()
                
                HStack {
                    Button(action: {
                        firstName = UserDefaults.standard.string(forKey: kFirstName)!
                        lastName = UserDefaults.standard.string(forKey: kLastName)!
                        email = UserDefaults.standard.string(forKey: kEmail)!
                        phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
                        
                    }, label: {
                        Text("Discard Changes")
                            .font(Font.system(size: 14).bold())
                            .frame(width: 130)
                            .foregroundColor(deepGreen)
                    })
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(deepGreen, style: StrokeStyle(lineWidth: 1.0)))
                    
                    Spacer()
                    
                    Button(action: {
                        if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !phoneNumber.isEmpty) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        }
                        
                    }, label: {
                        Text("Save Changes")
                            .font(Font.system(size: 14).bold())
                            .frame(width: 130)
                            .foregroundColor(.white)
                    })
                    .padding(10)
                    .background(deepGreen)
                    .cornerRadius(8)
                }
                .padding(.bottom)
                
                LogoutButton(presentation)
                    
            }
            .padding([.leading, .trailing])
            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
            .padding([.leading, .trailing, .bottom])
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
