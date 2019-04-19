//
//  Compose.swift
//  Compose
//
//  Created by Artem Karmaz on 4/19/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

protocol Compose {
    var name: String {get set}
    func showContent() -> Any
    func addComponent(c: Compose) // c : compose передавать какие-то компоненты которые будут наследоваться от протокола компоус
    func contentCount() -> Int
}

class File: Compose {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return name // содержимое файла
    }
    
    func addComponent(c: Compose) {
        print("ERROR: Cann't add Folder to File!")
    }
    
    func contentCount() -> Int {
        return 1
    }
}

class Folder: Compose {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    private var contentArray = [Compose]() // храение веток (папки и прочий мусор)
    
    func showContent() -> Any {
        return contentArray
    }
    
    func addComponent(c: Compose) {
        contentArray.append(c)
    }
    
    func contentCount() -> Int {
        return contentArray.count
    }
    
    
}
