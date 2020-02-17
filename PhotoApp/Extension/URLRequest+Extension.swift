//
//  URLRequest+Extension.swift
//  PhotoApp
//
//  Created by Hernandez, Ronald on 2/17/20.
//  Copyright © 2020 Ronaldoh1. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct Resource<T: Decodable> {
    let url: URL
}
extension URLRequest {
    
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        return Observable.from(optional: resource.url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
        }.map { data -> T? in
            return try? JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
