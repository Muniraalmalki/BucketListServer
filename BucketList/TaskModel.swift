//
//  TaskModel.swift
//  BucketList
//
//  Created by munira almallki on 17/03/1443 AH.
//

import Foundation
import CoreData
import Alamofire

struct AddTask: Codable{
    var id : Int?
    var objective: String
}
struct Delete: Codable{
    let message: String
}
class TaskModel{

    
    static func getAllTask(completionHandler:@escaping (_ taskModel: [AddTask]?, _ error: Error?)->Void){
        
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/", method: .get).responseDecodable(of: [AddTask].self){ response in
            
            switch response.result{
            case .success(let items):

                completionHandler(items,nil)

            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil,error)
            }
        }
    }
    
}

