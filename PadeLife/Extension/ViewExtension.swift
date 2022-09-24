//
//  ViewExtension.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
    
    func defaultButtonText() -> some View {
        self
            .bold()
            .frame(width: 200, height: 40)
            .foregroundColor(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.secondary, lineWidth: 2)
            )
    }
}
