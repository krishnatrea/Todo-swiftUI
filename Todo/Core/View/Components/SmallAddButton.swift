//
//  SmallAddButton.swift
//  Todo
//
//  Created by Krishnatrea on 15/09/23.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 0.325, saturation: 0.796, brightness: 0.408))
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
        }
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
