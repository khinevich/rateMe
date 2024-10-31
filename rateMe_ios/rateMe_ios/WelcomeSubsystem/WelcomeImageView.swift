//
//  LoadingImageView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 14.04.24.
//

import SwiftUI

struct WelcomeImageView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image("rateMeLogo")
                //.resizable()
                //.scaledToFill()
                .scaleEffect(CGSize(width: 3, height: 3))
        }
    }
}

#Preview {
    WelcomeImageView()
}
