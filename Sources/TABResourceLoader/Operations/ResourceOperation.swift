//
//  ResourceOperation.swift
//  TABResourceLoader
//
//  Created by Luciano Marisi on 10/09/2016.
//  Copyright © 2016 Luciano Marisi. All rights reserved.
//

import Foundation

public final class ResourceOperation<T: ResourceServiceType>: BaseAsynchronousOperation, ResourceOperationType {
  
  public typealias ResourceService = T
  
  public typealias DidFinishFetchingResourceCallback = (ResourceOperation<ResourceService>, Result<ResourceService.Resource.Model>) -> Void
  
  private let resource: ResourceService.Resource
  private let service: ResourceService
  private let didFinishFetchingResourceCallback: DidFinishFetchingResourceCallback
  
  public init(resource: ResourceService.Resource, service: ResourceService = ResourceService(), didFinishFetchingResourceCallback: @escaping DidFinishFetchingResourceCallback) {
    self.resource = resource
    self.service = service
    self.didFinishFetchingResourceCallback = didFinishFetchingResourceCallback
    super.init()
  }
  
  override public func execute() {
    fetch(resource: resource, usingService: service)
  }
  
  public func didFinishFetchingResource(result: Result<ResourceService.Resource.Model>) {
    didFinishFetchingResourceCallback(self, result)
  }
  
}
