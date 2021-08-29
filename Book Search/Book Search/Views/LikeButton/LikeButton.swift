//
//  LikeButton.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import SwiftUI


struct ScaleUpEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.5 : 1.0)
    }
}

typealias LikeButtonPressed = ((Book) -> Void)?
typealias ButtonPressed = (() -> Void)?
typealias OnButtonPressed = () -> ()

struct LikeButton: View {
    
    @State var isFavorite : Bool = false
    let repository = FavoritesRepository()
    let likeAction: ButtonPressed
    
    var body: some View {
        Button(action: {
            isFavorite.toggle()
            likeAction?()
        }) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .frame(width: 23, height: 25, alignment: .center)
                .foregroundColor(.red)
                
        }
        .buttonStyle(ScaleUpEffectButtonStyle())
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(likeAction: nil)
    }
}
