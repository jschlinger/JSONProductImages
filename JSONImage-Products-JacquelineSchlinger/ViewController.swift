//
//  ViewController.swift
//  JSONImage-Products-JacquelineSchlinger
//
//  Created by Jackie Schlinger on 11/30/18.
//  Copyright © 2018 Jacqueline Schlinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = productTableView.dequeueReusableCell(withIdentifier: "productCell")
        myCell?.textLabel?.text = product[indexPath.row].Name
        myCell?.detailTextLabel?.text = product[indexPath.row].Category
        return myCell!
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProductDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProductViewController {
            destination.products = product[(productTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    @IBOutlet weak var productTableView: UITableView!
    
    var product = [ProductInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        //construct a path to the file
        let path = Bundle.main.path(forResource: "products", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            self.product = try
                JSONDecoder().decode([ProductInfo].self, from: data)
            
            for eachProduct in self.product {
                print(eachProduct.Name)
            }
        }
        
        catch {
            print("JSON Error.")
        }
        
    }


}

