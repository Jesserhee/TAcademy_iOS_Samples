//
//  ViewController.swift
//  ScrollViewCodeSnippet
//
//  Created by wannabewize on 2015. 3. 18..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet weak var scrollView : UIScrollView!
  var imageView : UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 이미지와 이미지 뷰 객체 생성
    let image = UIImage(named: "image.jpg")
    imageView = UIImageView(image: image)
    
    // 스크롤 뷰의 자식뷰로 추가
    scrollView.addSubview(imageView)
    // 스크롤 뷰의 컨텐츠 크기 설정
    scrollView.contentSize = imageView.frame.size
    
    // 줌 범위
    scrollView.minimumZoomScale = 0.5
    scrollView.maximumZoomScale = 2.0
  }
  
  override func viewDidAppear(animated: Bool) {
    scrollView.setContentOffset(CGPointMake(400, 400), animated: true)
  }
  
  // 줌 대상 뷰 - 스크롤 뷰의 델리게이트
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidZoom(scrollView: UIScrollView) {
    println("scrollViewDidZoom : \(scrollView.zoomScale)")
  }
  
  func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
    println("scrollViewWillBeginZooming")
  }
  
  func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
    println("scrollViewDidEndZooming")
  }
  
  func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    println("scrollViewWillBeginDragging")
  }
  
  func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    println("scrollViewWillEndDragging")
  }

  func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    println("scrollViewDidEndDragging")
  }

  func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
    println("scrollViewWillBeginDecelerating")
  }

  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    println("scrollViewDidEndDecelerating")
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    println("scrollViewDidScroll")
  }
  
  func scrollViewDidScrollToTop(scrollView: UIScrollView) {
    println("scrollViewDidScrollToTop")
  }
  
  
}
