//
//  SelectStockTalkModalView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/18.
//

import SwiftUI

struct TopicListModalView: View {
    
    @Binding var modalOpened: Bool
    @Binding var selectionItems: Set<Int>
    
    @Environment(\.presentationMode) var presentationMode
    
    init(modalOpened: Binding<Bool>, selectionItems: Binding<Set<Int>>) {
        UIComponents.setupNavigationBar()
        self._modalOpened = modalOpened
        self._selectionItems = selectionItems
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                LazyVStack {
                    List(selection: $selectionItems) {
                        ForEach(memoTitles) { memoTitle in
                            TopicCell(title: memoTitle.title)
                        }
                    }.environment(\.editMode, .constant(.active))
                    .frame(height: TopicListSize.modal.setHeight)
                }
                .padding(.top)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .onDisappear() {
                print("selectedItems->", selectionItems)
            }
            .navigationBarTitle("会話ネタ選択", displayMode: .inline)
            .navigationBarItems(leading: XmarkButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}




struct TopicModalView_Previews: PreviewProvider {
    static var previews: some View {
        TopicListModalView(modalOpened: .constant(false), selectionItems: .constant([]))
    }
}
