//
//  PersonListCell.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/07.
//

import SwiftUI

struct PersonCell: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: UIComponents.screenWidth / 4, height: UIComponents.screenWidth / 4)
                    .padding()
                
                VStack(alignment: .leading ,spacing: 30) {
                    Text("愛知 太郎")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("友達")
                        
                        Image(systemName: "text.bubble")
                            .padding(.leading)
                        
                        Text("4")
                    }
                }
            }
        }
        .frame(width: UIComponents.screenWidth / 1.2, height: UIComponents.screenWidth / 3, alignment: .leading)
        
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell()
    }
}
