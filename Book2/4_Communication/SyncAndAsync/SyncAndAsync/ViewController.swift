//
//  ViewController.swift
//  SyncAndAsync
//
//  Created by wannabewize on 2015. 1. 8..
//  Copyright (c) 2015년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // 이미지 뷰의 아웃렛
  @IBOutlet weak var imageView: UIImageView!
  let urlStr = "http://upload.wikimedia.org/wikipedia/commons/4/4d/Klimt_-_Der_Kuss.jpeg"

  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  @IBAction func handleSync(sender: AnyObject) {
    imageView.image = nil

    // 인디케이터 시작 - 그러나 동작하지 않는다.
    indicator.startAnimating()

    let url = NSURL(string: urlStr)!
    
    //NSData(contentsOfURL: url)!
    var error : NSError?
    let data = NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingUncached, error: &error)!
    // 이미지 생성. 이미지 뷰에 반영
    let image = UIImage(data: data)
    imageView.image = image
    
    indicator.stopAnimating()
  }
  
  
  @IBAction func handleASync(sender: AnyObject) {
    imageView.image = nil
    
    // 인디케이터 시작
    indicator.startAnimating()
    
    let url = NSURL(string: urlStr)!
    let request = NSURLRequest(URL: url)

    // 이미지를 화면에 반영하려면 메인 쓰레드에서
    let queue = NSOperationQueue.mainQueue()
    NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response : NSURLResponse!, data : NSData!, error : NSError!) -> Void in
      let image = UIImage(data: data)
      self.imageView.image = image
      println("is Main thread? \(NSThread.isMainThread())")
      // 인디케이터 중지
      self.indicator.stopAnimating()
    }
  }
  
  @IBAction func handleTask(sender: AnyObject) {
    let url = NSURL(string: urlStr)!
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    var error : NSError?
    let task = session.dataTaskWithURL(url, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
      println("isMainThread ? \(NSThread.isMainThread()) data size : \(data.length)")
      NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
        let image = UIImage(data: data)
        self.imageView.image = image
        self.indicator.stopAnimating()
      })
    })
    
    self.indicator.startAnimating()
    task.resume()
  }
}
