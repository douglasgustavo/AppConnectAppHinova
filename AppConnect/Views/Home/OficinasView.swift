//
//  NewOficinasView.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI

struct OficinasView: View {
    @State var mostrandoOficina: Bool = false
    
    @StateObject var vm: OficinasViewModel = OficinasViewModel()
    @EnvironmentObject var usuario: UsuarioStateObject
    @State private var oficinaSelecionada: ListaOficina = ListaOficina()
    
    var body: some View {
        VStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                if let oficina = vm.listaOficinas.listaOficinas {
                    ForEach(0..<oficina.count, id: \.self) { pos in
                        
                        Button {
                            self.oficinaSelecionada = oficina[pos]
                            self.mostrandoOficina.toggle()
                        } label: {
                            OficinaItemView(
                                nome: oficina[pos].nome ?? "",
                                endereco: oficina[pos].endereco ?? "",
                                telefone1: oficina[pos].telefone1 ?? "",
                                telefone2: oficina[pos].telefone2 ?? "",
                                imagem: oficina[pos].foto ?? ""
                            )
                                .padding(.bottom, 10)
                                .frame(width: UIScreen.main.bounds.width)
                        }
                        .sheet(isPresented: $mostrandoOficina) {
                            OficinasDetalheView(oficinaRecebida: self.$oficinaSelecionada)
                        }
                        
                    }
                } else {
                    Text("Erro ao obter")
                }
            }
        }
        .environmentObject(vm)
        .onAppear {
            vm.listarOficinas(cpf: self.usuario.usuarioLogado.cpf!)
        }
        .navigationTitle("Lista de Oficinas")
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

struct NewOficinasView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OficinasView()
        }
    }
}
