//
//  InputFieldView.swift
//  rateMe_ios
//
//  Created by Mikhail Khinevich on 14.08.24.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var inputText: String
    let inpuTextFieldTitle: String
    let inputTextPlaceholder: String
    let isSecureField: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(inpuTextFieldTitle)
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
                .font(.footnote)

            if isSecureField {
                SecureField(inputTextPlaceholder, text: $inputText)
                    .font(.system(size: 18))
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .padding(10)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(
                            Color("PinkTextField")))
            } else {
                TextField(inputTextPlaceholder, text: $inputText)
                    .font(.system(size: 18))
                    .frame(maxWidth: UIScreen.main.bounds.width)

                    .padding(10)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(
                            Color("PinkTextField")))
            }
        }
    }
}

#Preview {
    InputFieldView(
        inputText: .constant(""), inpuTextFieldTitle: "Email or Username",
        inputTextPlaceholder: "name@example.de", isSecureField: false)
    //.constand("") makes it blank
}
