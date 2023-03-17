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
