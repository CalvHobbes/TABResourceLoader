//
//  ImageResourceType.swift
//  TABResourceLoader
//
//  Created by Luciano Marisi on 10/09/2016.
//  Copyright © 2016 Luciano Marisi. All rights reserved.
//

import UIKit

public enum ImageDownloadingError: Error {
  case invalidImageData
}

/**
 *  Defines a specific ResourceType for Image resources
 */
public protocol ImageResourceType: DataResourceType {

  associatedtype Model: UIImage

  /**
   Takes NSData and returns a result which is either Success with an Image or Failure with an error

   - parameter data: Input Image Data

   - returns: Result of image decoding.
   */
  func model(from data: Data) throws -> Model
}

// MARK: - Convenince parsing functions
extension ImageResourceType {

  public func model(from data: Data) throws -> UIImage {
    guard let image = UIImage(data: data) else {
      throw ImageDownloadingError.invalidImageData
    }
    return image
  }

}
