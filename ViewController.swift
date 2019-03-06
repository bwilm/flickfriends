//
//  ViewController.swift
//  flickfriends
//
//  Created by Brandon Wilmott on 7/9/18.
//  Copyright © 2018 Brandon Wilmott. All rights reserved.
//

import UIKit
import Alamofire
import ChameleonFramework
import Foundation
import SwiftyJSON
import AlamofireObjectMapper






class ViewController: UIViewController {
    
    
    
    let omdbAPI = "http://www.omdbapi.com/?t="
    let omdbIMG = "https://api.themoviedb.org/3/search/movie?"
    let apiKey = "&apikey=f728e718"
    let imgKey = "67a4314cce1817014281029676cd6a54"
    var finalURL = ""
    let apiURL = "api_key="
    let queryURL = "&query="
    
    @IBOutlet weak var movieArt: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBAction func searchAction(_ sender: Any) {
        
        
        finalURL = omdbAPI+userSearch.text!+apiKey
       
//        getPoster()
        
      
    }
    
    guard let url = URL(string: "https://www.omdbapi.com/&apikey=f728e718?t=blade") else {return}
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
            error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return }
        do{
            //here dataResponse received from a network request
            let jsonResponse = try JSONSerialization.jsonObject(with:
                dataResponse, options: [])
            print(jsonResponse) //Response result
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
    task.resume()
    
    guard let jsonArray = jsonResponse as? [[String: Any]] else {
    return
    }
    print(jsonArray)
    //Now get title value
    guard let title = jsonArray[0]["title"] as? String else { return } print(title) // delectus aut autem
    

    override func viewDidLoad() {
        super.viewDidLoad()
       }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userSearch: UITextField!
    
    
}



    
    



