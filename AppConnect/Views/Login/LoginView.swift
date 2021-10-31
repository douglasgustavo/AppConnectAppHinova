//
//  LoginView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm: LoginViewModel = LoginViewModel()
    @StateObject var loginState = UsuarioStateObject()
    
    var body: some View {
        VStack{
            
        }
        .environmentObject(loginState)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
