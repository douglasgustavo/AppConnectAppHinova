//
//  CoreDataService.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import CoreData

class CoreDataService {
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "AppConnectData")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Erro no CoreData: \(error.localizedDescription)")
            } else {
                print("Core Data carregado com sucesso.")
            }
        }
    }
    
    func cadastrarAssociadoCoreData(associado: AssociadoModel, completion: @escaping (AssociadoEntity?, Error?) -> Void) {
        let associadoCD = AssociadoEntity(context: persistentContainer.viewContext)
        
        let telefoneAssociado: String = {
            return associado.telefoneCelular != nil ? associado.telefoneCelular! : associado.telefoneFixo != nil ? associado.telefoneFixo! : ""
        }()
        
        associadoCD.nome = associado.nome
        associadoCD.cpf = associado.cpf
        associadoCD.email = associado.email
        associadoCD.telefone = telefoneAssociado
        saveDataCoreData()
        obterAssociadoLogadoCoreData { associado, error in
            if error == nil {
                completion(associado, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func obterAssociadoLogadoCoreData(completion: @escaping (AssociadoEntity?, Error?) -> Void) {
        let fetchRequest = NSFetchRequest<AssociadoEntity>(entityName: "AssociadoEntity")
        do {
            let associadoLogado = try persistentContainer.viewContext.fetch(fetchRequest)
            if associadoLogado.count > 0 {
                completion(associadoLogado[0], nil)
            }
        } catch let error {
            completion(nil, error)
        }
    }
    
    func deslogarAssociadoCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AssociadoEntity")
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try persistentContainer.viewContext.fetch(fetchRequest)
                for object in results {
                    guard let objectData = object as? NSManagedObject else {continue}
                    persistentContainer.viewContext.delete(objectData)
                    self.saveDataCoreData()
                }
            } catch let error {
                print("Erro: ", error.localizedDescription)
            }
    }
    
    func saveDataCoreData() {
        do {
            try persistentContainer.viewContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
