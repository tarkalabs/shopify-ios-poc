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
  @IBOutlet weak var imageView: UIImageView!
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  override func viewDidLoad() {
    if let client = ShopifyApi.getInstance().client {
      client.getProductsPage(1) { (products, page, reachedEnd, error) -> Void in
        let url = NSURL.init(string: (products[0] as! BUYProduct).images[0].src)
        self.imageView.sd_setImageWithURL(url);
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
      }
    } else {
      NSLog("Client was null")
    }
  }
}
