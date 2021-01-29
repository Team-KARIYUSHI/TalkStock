//
//  a.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/17.
//


import SwiftUI

struct PersonListModalView: View {
    
    @State var modalOpened = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                PersonListAction(height: PersonListSize.modal.setHeight) {
                    self.presentationMode.wrappedValue.dismiss()
                }.padding(.top, 120)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .padding(.top, 40)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("話したい人一覧", displayMode: .inline)
            .navigationBarItems(leading: XmarkButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }), trailing: PlusButton(isPresented: self.$modalOpened, view: PersonCreateView()))
        }
    }
}

struct PersonListModalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListModalView()
    }
}
