//
//  DataService.swift
//  RingtonesProject
//
//  Created by Hong Chinh on 6/10/19.
//  Copyright © 2019 Hong Chinh. All rights reserved.
//

import UIKit

//    typealias JSON = Dictionary<AnyHashable, Any>
//class DataService {
//
//        static var shared: DataService = DataService()
//        var service: [Entities] = []
//        func getData(completedHandler: @escaping([Entities]) -> Void){
//            guard let url = URL(string: "https://raw.githubusercontent.com/kidanh/ringtones/master/ringtones.json") else {return}
//
//
//            var selectedService: Entities?
//            let urlRequest = URLRequest(url: url)
//
//            let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, _, error) in
//                guard error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return
//                }
//                guard let aData = data else {return}
//
//                do {
//                    if let jsonResponse = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? JSON {
//                        completedHandler([try Entities(from: jsonResponse as! JSONDecoder as! Decoder)])
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//            dataTask.resume()
//        }
//
//}
struct Ringtone: Codable{
    var id: Int
    var title: String
    var genre: String
    var artist: String
    var duration: Double
    var rate: Double
    var filename: String
}
class DataService{
    static var share = DataService()
    var ringtone = [Ringtone]()
    func getDataApi(completedHandle: @escaping([Ringtone]) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/kidanh/ringtones/master/ringtones.json") else {return}
        var urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 1000)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data,response, error) in
            guard error == nil else {return}
            guard let data = data else {return}
            guard (response as! HTTPURLResponse).statusCode == 200 else {return}
            do{
                let ringtones = try JSONDecoder().decode([Ringtone].self, from: data)
                self.ringtone = ringtones
                DispatchQueue.main.async {
                    completedHandle(self.ringtone)
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }).resume()
    }
}
