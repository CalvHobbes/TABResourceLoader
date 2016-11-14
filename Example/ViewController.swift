//
//  ViewController.swift
//  Example
//
//  Created by Luciano Marisi on 17/09/2016.
//  Copyright © 2016 Luciano Marisi. All rights reserved.
//

import UIKit
import TABResourceLoader

class ViewController: UIViewController {

  @IBOutlet private var imageView: UIImageView!
  
  private let operationQueue = OperationQueue()
  private let citiesService = NetworkDataResourceService<CitiesResource>()
  private let imageService = NetworkDataResourceService<NetworkImageResource>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchJSONExample()
    fetchImageExample()
  }
  
  func fetchJSONExample() {
    let americaResource = CitiesResource(continent: "america")
    citiesService.fetch(resource: americaResource) { (result) in
      print(result)
    }
    
    let citiesResourceOperation = ResourceOperation<NetworkDataResourceService<CitiesResource>>(resource: americaResource) { operation, result in
      print(result)
    }
    operationQueue.addOperation(citiesResourceOperation)
  }
  
  func fetchImageExample() {
    let imageURL = URL(string: "http://www.theappbusiness.com/apple-touch-icon-180x180.png")!
    let imageResource = NetworkImageResource(url: imageURL)
    
    imageService.fetch(resource: imageResource) { (result) in
      // Do something with result
    }
    
    let imageOperation = ResourceOperation<NetworkDataResourceService<NetworkImageResource>>(resource: imageResource) { [weak self] _, result in
      if case let .success(image) = result {
        self?.imageView.image = image
      }
    }
    operationQueue.addOperation(imageOperation)
  }

}

