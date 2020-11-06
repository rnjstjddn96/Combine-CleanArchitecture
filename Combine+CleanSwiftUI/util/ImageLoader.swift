//
//  ImageLoader.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/05.
//

import Foundation
import Combine
import SwiftUI
import class Kingfisher.ImageDownloader
import struct Kingfisher.DownloadTask
import class Kingfisher.ImageCache
import class Kingfisher.KingfisherManager

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    
    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func cancelImage() {
        cancellable?.cancel()
    }
    
    func loadImage() {
        if loadImageFromCache() { return }
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        guard let urlString = self.urlString else { return }
        guard let url = URL(string: urlString) else { print("wrongURL"); return }
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { UIImage(data: $0.data) }
            .map { result in
                if let imageResult = result {
                    self.imageCache.set(forKey: urlString, image: imageResult)
                }
                return result
            }
            .replaceError(with: UIImage(named: "whiteImage"))
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
//    func loadImageFromUrl() {
//        guard let urlString = urlString else {
//            return
//        }
//        guard let url = URL(string: urlString) else { return }
//        KingfisherManager.shared.retrieveImage(with: url) { result in
//            switch result {
//            case .success(let imageResult):
//                self.imageCache.set(forKey: self.urlString!, image: imageResult.image)
//            case .failure:
//                break
//            }
//        }
//    }

    func loadImageFromCache() -> Bool {
        guard let urlString = self.urlString else { return false }
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        image = cacheImage
        return true
    }
}



class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
