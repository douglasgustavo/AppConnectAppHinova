//
//  OficinasView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct OficinasView: View {
    @StateObject var vm: OficinasViewModel = OficinasViewModel()
    
    var body: some View {
        ZStack{
            Text("Oficinas")
        }
        .environmentObject(vm)
    }
}

struct OficinasView_Previews: PreviewProvider {
    static var previews: some View {
        OficinasView()
    }
}
