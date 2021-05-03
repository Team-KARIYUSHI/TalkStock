//
//  PersonListCell.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/07.
//

import SwiftUI
import RealmSwift

struct PersonCell: View {
    
    var relationshipData: RelationshipData?
    var talkpartner: Talkpartners?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: UIComponents.screenWidth / 4, height: UIComponents.screenWidth / 4)
                    .padding()
                
                VStack(alignment: .leading ,spacing: 30) {
                    Text(talkpartner?.personalName ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(relationshipData?.relationName ?? "")
                        
                        Image(systemName: "text.bubble")
                            .padding(.leading)
                        
//                        Text(person.topicNum)
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
        PersonCell()
    }
}
