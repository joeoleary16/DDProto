//
//  PostService.swift
//  DDProto
//
//  Created by joe on 04/02/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import Foundation

class PostService {
    
    var settings:Settings!
    
    init() {
        self.settings = Settings()
    }
    
    func getPosts(callback:(NSDictionary) -> ()) {
        request(settings.viewPosts, callback: callback)
    
    }
    
    /*func request(url:String, callback:(NSDictionary) -> ()) {
        let nsURL = NSURL(string: url)
        
        _ = NSURLSession.sharedSession().dataTaskWithURL(nsURL!) {
        (data, response, error) in
            var error:NSError?
            var response = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: ?error) as NSDictionary
            callback(response)*/
    
    
    func request(url:String,callback:(NSDictionary)->()) {
        guard let nsURL = NSURL(string: url) else { return }
        ///////////////////////////on this line/////////////////////////////////
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL) {
            /////////////////////////////////////////////////////////////////
            (data, response, error) in
            guard let data = data where error == nil else { return }
            do {
                if let response = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    callback(response)
                }
            } catch let error as NSError {
                print("json error: \(error.localizedDescription)")
            }
            
            
        }
        task.resume()
    }
    
        
        }