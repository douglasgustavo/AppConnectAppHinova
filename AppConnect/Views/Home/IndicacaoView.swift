//
//  IndicacaoView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct IndicacaoView: View {
    @StateObject var vm: IndicacaoViewModel = IndicacaoViewModel()
    
    var body: some View {
        ZStack{
            Text("Indicacao")
        }
        .environmentObject(vm)
    }
}

struct IndicacaoView_Previews: PreviewProvider {
    static var previews: some View {
        IndicacaoView()
    }
}
