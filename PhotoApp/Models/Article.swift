//
//  Task.swift
//  PhotoApp
//
//  Created by Hernandez, Ronald on 2/16/20.
//  Copyright © 2020 Ronaldoh1. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable {
    
    let articles: [Article]
}

struct Article: Decodable{
    
    let title: String
    let description: String
    
}


