//
//  PersonVerticalScroll.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/13.
//

import SwiftUI

struct PersonVerticalScroll: View {
    
    @Binding var isPresented: Bool
    var personSummary: [PersonSummary]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                PlusCircleButton(isPresented: self.$isPresented,
                                    view: SelectPersonModalView())
                // 後で話したい人選択画面に差し替える
                ForEach(personSummary) { personSummary in NavigationLink(destination: EmptyView()) {
                    PersonButton(personName: personSummary.personName,
                                    action: {
                                        
                                    })
                    }
                }
            }.frame(height:100)
        }.frame(width: .infinity, height: 100)
        .padding()
    }
}

struct PersonVerticalScroll_Previews: PreviewProvider {
    static var previews: some View {
        PersonVerticalScroll(isPresented: .constant(false), personSummary: personSummary)
    }
}
