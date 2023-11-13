//
//  SignInView.swift
//  ProjetMobile
//
//  Created by IssamGuezmir on 6/11/2023.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var remembreMe = false
    @State private var isEmailValid = true
        @State private var isPasswordValid = true
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                VStack{
                    Text("Hi , Welcome back ! 👋")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                    
                    Text("Hello again , you've been missed !")
                        .font(.title3)
                        .foregroundColor(.gray)
                   
                }
                VStack{
                    Text("Email")
                        .font(.title3)
                        .foregroundColor(.green)
                    
                        .frame(alignment: .leading)
                }
                
                VStack{
                    TextField("Enter Your Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: email, perform: { newValue in
                            isEmailValid = isValidEmail(newValue)
                                               })
                }
                if !isEmailValid {
                                    Text("Invalid email address")
                                        .foregroundColor(.red)
                                }
                
                VStack{
                    Text("Password")
                        .font(.title3)
                        .foregroundColor(.green)
                    
                        .frame(alignment: .leading)
                }
                
                VStack{
                    SecureField("Please Enter your Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: password, perform: { newValue in
                                                    isPasswordValid = isValidPassword(newValue)
                                                })
                }
                
                if !isPasswordValid {
                                  Text("Password must be at least 8 characters")
                                      .foregroundColor(.red)
                              }
                
                HStack{
                    Spacer()
                   Text(" Fogot Password ? ")
                        .font(.callout)
                        .foregroundColor(.gray)
                        
                }
                VStack{
                
                Button("Login"){
                    
                }
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Text("Or With")
                    
                    .foregroundColor(.gray)
                    .frame(alignment: .leading)
                    
                }
                HStack {
                    Button(action: {
                        // Action à effectuer lorsque le bouton Facebook est pressé
                    }) {
                        HStack {
                            Image("facebook") // Remplacez "facebook_icon" par le nom de votre image Facebook
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20) // Ajustez la taille de l'image selon vos besoins
                            
                            Text("Facebook")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button(action: {
                        // Action à effectuer lorsque le bouton Email est pressé
                    }) {
                        HStack {
                            Image("Gmail") // Remplacez "email_icon" par le nom de votre image Gmail ou Email
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20) // Ajustez la taille de l'image selon vos besoins
                            
                            Text("Gmail")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                
               
              
                
                
                
                
          
            
                
            }.padding()
            VStack{
                Spacer()
                HStack{
                    Text("Don't have an account ?")
                        .font(.title3)
                    Text("Sign up")
                        .font(.title3)
                        .foregroundColor(.green)
                    
                }
            }.navigationBarBackButtonHidden(true)
            
         
            
            
        }
        
    }
    func isValidEmail(_ email: String) -> Bool {
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
            return emailPredicate.evaluate(with: email)
        }

        func isValidPassword(_ password: String) -> Bool {
            return password.count >= 8
        }
    
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
    }
}
