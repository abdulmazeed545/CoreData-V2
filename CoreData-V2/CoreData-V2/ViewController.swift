//
//  ViewController.swift
//  CoreData-V2
//
//  Created by Shaik abdul mazeed on 22/03/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ServerData()
    }
    func ServerData(){
        
       // var myContext  = NSManagedObject(entity: <#T##NSEntityDescription#>, insertInto: context)
        var url = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        url.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, re, err) in
            if err == nil{
                
                do{
                    var decoder = JSONDecoder()
                    var serverData = try decoder.decode([MyData].self, from: data!)
                    for i in 0..<serverData.count{
                        
                        print(serverData[i].company.name,"\n", serverData[i].name)
                    }
                    
                }catch{
                    print("error got:\(err?.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }


}

