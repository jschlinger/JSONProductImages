//
//  ProductViewController.swift
//  JSONImage-Products-JacquelineSchlinger
//
//  Created by Jackie Schlinger on 11/30/18.
//  Copyright © 2018 Jacqueline Schlinger. All rights reserved.
//

import UIKit

/** the next extension is based on the code published by Yash Patel
 **/
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class ProductViewController: UIViewController {

    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    

    @IBOutlet weak var productCategoryLabel: UILabel!
    
    
    
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
    var products : ProductInfo?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = (products?.Name)! + " " + (products?.ProductId)!
        productCategoryLabel.text = products?.Category
        productDescriptionLabel.text = products?.Description
        
        let urlString = (products?.ProductPicUrl)!
        let productImageUrl = URL(string: urlString)
        productImageView.downloadedFrom(url: productImageUrl!)
    }
    

   

}
