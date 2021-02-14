//
//  PersonListCell.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/07.
//

import SwiftUI

struct PersonCell: View {
    
    var person:PersonSummary
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: UIComponents.screenWidth / 4, height: UIComponents.screenWidth / 4)
                    .padding()
                
                VStack(alignment: .leading ,spacing: 30) {
                    Text(person.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(person.relationship)
                        
                        Image(systemName: "text.bubble")
                            .padding(.leading)
                        
                        Text(person.topicNum)
                    }
                }
            }
        }
        .frame(width: UIComponents.screenWidth / 1.2, height: UIComponents.screenWidth / 3, alignment: .leading)
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell(person: PersonSummary(id: 0, name: "", relationship: "", topicNum: ""))
    }
}
