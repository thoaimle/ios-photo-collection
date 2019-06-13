//
//  Photo.swift
//  PhotoCollection
//
//  Created by Thoai Le on 6/13/19.
//  Copyright © 2019 Thoai Le. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
