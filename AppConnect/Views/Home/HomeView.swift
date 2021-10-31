//
//  HomeView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        Text("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
