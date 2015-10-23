//
//  ShopifyApi.swift
//  shopify-ios-poc
//
//  Created by Vagmi on 23/10/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import Foundation
import Buy
class ShopifyApi {
  static var instance:ShopifyApi?
  var client:BUYClient?
  static func getInstance() -> ShopifyApi {
    if let inst = ShopifyApi.instance {
      return inst;
    } else {
      ShopifyApi.instance = ShopifyApi.init();
      return ShopifyApi.instance!
    }
  }
  init() {
    if let path = NSBundle.mainBundle().pathForResource("shopify_api", ofType: "plist") {
      if let myDict = NSDictionary(contentsOfFile: path) {
        let domain = myDict.valueForKey("domain") as! String
        let apiKey = myDict.valueForKey("api_key") as! String
        let channelId = myDict.valueForKey("channel_id") as! String
        self.client = BUYClient.init(shopDomain: domain, apiKey: apiKey, channelId: channelId)
      }
    }
  }
}