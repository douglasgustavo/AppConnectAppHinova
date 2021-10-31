//
//  LoginView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm: LoginViewModel = LoginViewModel()
    
    var body: some View {
        Text("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
