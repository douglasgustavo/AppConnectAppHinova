//
//  OficinasView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct OficinasView: View {
    @StateObject var vm: OficinasViewModel = OficinasViewModel()
    @EnvironmentObject var usuario: UsuarioStateObject
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                if let listaOficinas = vm.listaOficinas.listaOficinas {
                    ForEach(0..<listaOficinas.count, id: \.self) { pos in
                        
                        NavigationLink {
                            OficinaDetalheView(oficina: listaOficinas[pos])
                        } label: {
                            OficinaItemView(imagem: listaOficinas[pos].foto!,
                                            nome: listaOficinas[pos].nome!,
                                            descricao: listaOficinas[pos].descricaoCurta!,
                                            avaliacao: "\(listaOficinas[pos].avaliacaoUsuario!)",
                                            telefone: listaOficinas[pos].telefone1 ?? "Não possui"
                            )
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                            
                        }
                        
                    }
                } else {
                    Text("Erro ao obter")
                }
            }
            
        }
        .environmentObject(vm)
        .onAppear {
            vm.listarOficinas(cpf: "")
        }
        .navigationTitle("Oficinas")
        .navigationBarItems(trailing:
         Button(action: {
                    vm.deslogarUsuario()
                    usuario.usuarioEstaLogado = false
                }, label: {
                    Text("Sair")
                })
        )
    }
}

struct OficinasView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OficinasView()
        }
        
    }
}

