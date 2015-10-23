//
//  HomeViewController.swift
//  shopify-ios-poc
//
//  Created by Vagmi on 23/10/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import UIKit
import Buy
class HomeViewController: UIViewController {
    let client: BUYClient
    @IBOutlet weak var imageView: UIImageView!
    required init(coder aDecoder: NSCoder) {
        client = BUYClient.init(shopDomain: "vagmis-dev-store.myshopify.com",
            apiKey: "dafd5336ed6e69b7acb0ce31b88e5aa4", channelId: "22700869")
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        client.getProductsPage(1) { (products, page, reachedEnd, error) -> Void in
          let url = NSURL.init(string: (products[0] as! BUYProduct).images[0].src)
            self.imageView.sd_setImageWithURL(url);
            self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        }
    }
}
