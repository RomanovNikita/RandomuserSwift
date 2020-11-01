import Foundation
import EGOCache
import CoreData

struct API: GET, POST {    
    
    static let shared = API()
    
    func loadRandomuser(_ updateDatabase: @escaping (Database) -> Void){
        print("➡️ \(type(of: self)): start of session")

        self.get(.dataTask, URLRequest(url: URL(string: Url.get.rawValue.urlValid)!), { data -> Void in
            if let jsondata = data {
                print("✅ \(type(of: self)): new database received!")
                let operationQueue = OperationQueue()
                operationQueue.name = "API.loadRandomuser.operationQueue"
                operationQueue.qualityOfService = .background
                operationQueue.maxConcurrentOperationCount = 1
                operationQueue.underlyingQueue = .global(qos: .background)
                
                let addPersons = BlockOperation {
                    print("✅ \(type(of: self)): pushing the database to the handler!")
                    JSONHandler.shared.reception(jsondata, { db in
                        updateDatabase(db)
                    })
                }
                
                operationQueue.addOperations([addPersons], waitUntilFinished: true)
                operationQueue.addBarrierBlock {
                    StorageManager.shared.accept(jsondata)
                }
            }
        })
    }
    
    private init() { }

}
