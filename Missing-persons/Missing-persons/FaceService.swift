//
//  FaceService.swift
//  Missing-persons
//
//  Created by Kevin Amiranoff on 12/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation
import ProjectOxfordFace


class FaceService {
  static let instance = FaceService()
  
  let client = MPOFaceServiceClient(subscriptionKey:"142a041be98a4333b8b73571f9e6b351")
}