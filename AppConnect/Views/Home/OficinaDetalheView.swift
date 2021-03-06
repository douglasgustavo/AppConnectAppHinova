//
//  OficinaDetalheView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI
import MapKit

struct OficinasDetalheView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var oficinaRecebida: ListaOficina
    
    var body: some View {
        ZStack{
            mainView
            btnFechar
        }
    }
}

extension OficinasDetalheView {
    var mainView: some View {
        VStack{
            headerTelaDetalhesOficina
            campoDetalhesOficina
        }
        .edgesIgnoringSafeArea(.all)
    }
}

extension OficinasDetalheView {
    var headerTelaDetalhesOficina: some View {
        ZStack{
            if let fotoOficina = oficinaRecebida.foto {
            Image(base64String: fotoOficina)!
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
    }
}

extension OficinasDetalheView {
    var campoDetalhesOficina: some View {
        ZStack{
            Rectangle()
                .fill(Color.principal)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .padding(.top, -40)
            
            ScrollView(.vertical) {
                
                infomacoesPrincipaisOficina
                informacoesDeContatoOficina
                descricaoOficina
                mapaOficina
            }
            .padding(.horizontal)
        }
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -10)
    }
}

extension OficinasDetalheView {
    var infomacoesPrincipaisOficina: some View {
        VStack (alignment: .leading, spacing: 10) {
            if let nomeOficina = oficinaRecebida.nome {
                Text(nomeOficina)
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            if let descricaoCurta = oficinaRecebida.descricaoCurta {
                Text(descricaoCurta)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            
            Rectangle()
                .fill(.white.opacity(0.2))
                .frame(height: 2)
        }
    }
}

extension OficinasDetalheView {
    var informacoesDeContatoOficina: some View {
        VStack (alignment: .leading) {
            Text("Informa????es de Contato")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom, 5)
            
            HStack{
                VStack (spacing: 5) {
                    if let telefone1 = oficinaRecebida.telefone1 {
                        HStack{
                            Image(systemName: "phone.fill")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            Text(telefone1)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    
                    if let telefone2 = oficinaRecebida.telefone2 {
                        HStack{
                            Image(systemName: "phone.fill")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            Text(telefone2)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 2.2, alignment: .leading)
                classificacaoOficina
            }
            HStack{
                Image(systemName: "envelope.fill")
                    .font(.title3)
                    .foregroundColor(.white)
                
                if let email = oficinaRecebida.email {
                    Text(email)
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .font(.title3)
                }
                Spacer()
            }
        }
        
        .padding(.bottom)
    }
}

extension OficinasDetalheView {
    var classificacaoOficina: some View {
        VStack {
            HStack{
                Image(systemName: "star.fill")
                    .font(.title3)
                    .foregroundColor(.yellow)
                
                if let avaliacao = oficinaRecebida.avaliacaoUsuario {
                    Text("Avalia????o: \(avaliacao)")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 2.3, height: 50 , alignment: .leading)
    }
}

extension OficinasDetalheView {
    var descricaoOficina: some View {
        VStack(alignment: .leading){
            Text("Descri????o")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom)
            
            if let descricao = oficinaRecebida.descricao {
                Text(descricao)
                    .foregroundColor(.white)
            }
        }
    }
}

extension OficinasDetalheView {
    var mapaOficina: some View {
        VStack(alignment: .leading, spacing: 10){
            
            Text("Localiza????o no Mapa")
                .font(.title2)
                .foregroundColor(.white)
            
            if let latitude = oficinaRecebida.latitude {
                if let longitude = oficinaRecebida.longitude {
                    MapaView(latitude: Double(latitude)!, longitude: Double(longitude)!)
                        .cornerRadius(15)
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 200)
        .padding(.bottom, 50)
    }
}

extension OficinasDetalheView {
    var btnFechar: some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60, height: 60)
                            .shadow(color: .black.opacity(0.4), radius: 5, x: 5, y: 5)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.principal)
                    }
                    .padding(30)
                }
            }
        }
    }
}

struct OficinasDetalheView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            //OficinasDetalheView()
        }
    }
}




/*
struct OficinaDetalheView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        OficinaDetalheView(oficina: ListaOficina(id: 0, nome: "Oficina do Sr. Jo??o da Nova Rua 16", descricao: "A oficina Gecar presta servi??os em Betim ?? mais de 30 anos, mantendo sempre a qualidade, respeito e transpar??ncia com seus clientes. Atuamos na ??rea de funilaria e pintura, garantindo sempre sua satisfa????o em rela????o aos reparos em seu ve??culo, seja ele, usado ou semi novo, importado ou nacional. A garantia de nossos servi??os ?? de 3 anos, tudo para garantirmos que nossos clientes se sintam sempre tranq??ilos e satisfeitos. Servi??os prestados. \\n-Funilaria\\n-Pintura\\n-Limpeza geral do ve??culo\\n-Servi??os de mec??nica\\n-Revitaliza????o de pintura (contrata????o ?? parte)", descricaoCurta: "Lanternagem e Pintura", endereco: "Rua Ign??s Maria, 326 - Betim Industrial", latitude: "", longitude: "", foto: "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", avaliacaoUsuario: 4, codigoAssociacao: 601, email: "contato@hinovamobile.com.br", telefone1: "31-34193100", telefone2: nil, ativo: true))
        }
    }
}
*/
