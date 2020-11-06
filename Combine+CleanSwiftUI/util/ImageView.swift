//
//  ImageView.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/05.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    private var placeHolder: Image
    
    
    init(with urlString: String, placeHolder: Image) {
        self.imageLoader = ImageLoader(urlString: urlString)
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        getImage()
            .resizable()
            .cornerRadius(10)
            .onAppear {
                
            }.onDisappear {
                self.imageLoader.cancelImage()
            }
    }
    
    func getImage() -> Image {
        guard let image = imageLoader.image else { return placeHolder }
        return Image(uiImage: image)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(with: "https://madi-1302397712.cos.ap-seoul.myqcloud.com/images/5f027fbcc9986921824aae6f_1602646108078.jpg", placeHolder: Image("whiteImage"))
    }
}
