//
//  Onboarding.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kPhoneNumber = "phone number key"

let kIsLoggedIn = "kIsLoggedIn"

let deepGreen = Color(red: 72/255, green: 94/255, blue: 88/255)
let yellow = Color(red: 244/255, green: 206/255, blue: 19/255)

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
//    init() {
//        UserDefaults.standard.removeObject(forKey: kFirstName)
//        UserDefaults.standard.removeObject(forKey: kLastName)
//        UserDefaults.standard.removeObject(forKey: kEmail)
//        UserDefaults.standard.removeObject(forKey: kPhoneNumber)
//        UserDefaults.standard.removeObject(forKey: kIsLoggedIn)
//    }
    
    var body: some View {
        NavigationStack() {

            VStack {
                Header()
                    
                HeroSection()
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Your Name")
                            .foregroundColor(deepGreen)
                        Text("*")
                            .foregroundColor(.red)
                    }
                    .bold()
                    CustomTextField(prompt: "First Name", bindingVariable: $firstName)
                    CustomTextField(prompt: "Last Name", bindingVariable: $lastName)
                    
                    HStack {
                        Text("Email")
                            .foregroundColor(deepGreen)
                        Text("*")
                            .foregroundColor(.red)
                    }
                    .bold()
                    CustomTextField(prompt: "severussnape@hogwarts.com", bindingVariable: $email)
                    
                    Button("Register") {
                        if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            isLoggedIn  = true
                            
                            firstName = ""
                            lastName = ""
                            email = ""
                        }
                    }
                    .buttonStyle(.bordered)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
                Spacer()
            }
            .onAppear(perform: {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            })
            .navigationDestination(isPresented: $isLoggedIn, destination: {
                Home()
            })
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
