//
//  SelectStockTalkModalView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/18.
//

import SwiftUI

struct TopicModalView: View {
    
    @State var modalOpened = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                TopicListAction(height: TopicListSize.modal.setHeight) {
                    self.presentationMode.wrappedValue.dismiss()
                }.padding(.top)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            
            .navigationBarTitle("会話ネタ選択", displayMode: .inline)
            .navigationBarItems(leading: XmarkButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}


struct TopicModalView_Previews: PreviewProvider {
    static var previews: some View {
        TopicModalView()
    }
}
