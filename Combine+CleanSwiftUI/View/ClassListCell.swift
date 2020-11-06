//
//  ClassListCell.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/05.
//

import SwiftUI

struct ClassListCell: View {
    let _class: ClassListElement
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                    ImageView(with: _class.bannerImages.first?.thumbURL ?? "",
                              placeHolder: Image("whiteImage"))
                        .frame(width: 100, height: 100)
                            .padding()
            }.padding()
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(_class.title ).bold()
                            .foregroundColor(Color.black)
                        Text(_class.subTitle)
                            .foregroundColor(Color.black)
                    }
                }
                Spacer()
                Text(String(_class.price))
                    .foregroundColor(.blue)
                    .bold()
                Spacer()
                HStack(spacing: 15) {
                    Spacer()
                }.padding(.trailing, 15)
            }
            .padding([.top, .bottom], 10)
        }
        .background(Color.white)
    }
}
