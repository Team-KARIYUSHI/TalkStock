//
//  SelectStockTalkModalView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/18.
//

import SwiftUI
import RealmSwift

struct TopicListModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isChecked: Bool = false
    @ObservedObject var viewModel = TopicListModalViewModel()
    @EnvironmentObject var objects: SelectState
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    List {
                        ForEach(self.viewModel.myTopicData) { topic in
                            HStack {
                                TagText(tagName: topic.topicTag.first?.tagName ?? "")
                                Text(topic.title).lineLimit(1)
                                Spacer()
                                topic.isChecked
                                    ?
                                    Image(systemName:"checkmark.square")
                                    :
                                    Image(systemName: "square")
                            }
                            .background(Color(UIColor.systemBackground))
                            .onTapGesture {
                                print("tapped:", topic.id)
                                if let matchIndex = self.viewModel.myTopicData.firstIndex(where: {
                                    $0.id == topic.id
                                }) {
                                    self.viewModel.myTopicData[matchIndex].isChecked.toggle()
                                    self.viewModel.myTopicData[matchIndex].isChecked
                                    ?
                                        self.objects.selectedTopics.append(self.viewModel.myTopicData[matchIndex])
                                        :
                                        self.objects.selectedTopics.removeAll(where: {
                                            $0.id == self.viewModel.myTopicData[matchIndex].id
                                        })
                                }
                                print(objects.selectedTopics)
                            }
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height)
                }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .navigationBarTitle("会話ネタ選択", displayMode: .inline)
            .navigationBarItems(leading: XmarkButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}

class TopicListModalViewModel: ObservableObject {
    @Published var myTopicData: [TopicData] = try! Realm().objects(Topic.self).map {
        TopicData(title: $0.title,
                  memo: $0.memo,
                  url: $0.url,
                  topicTag: $0.topicTag,
                  talkpartnerTopic: $0.talkpartnerTopic)
    }
}

class SelectState: ObservableObject {
    @Published var selectedTopics: [TopicData] = []
}



struct TopicModalView_Previews: PreviewProvider {
    static var previews: some View {
        TopicListModalView()
    }
}
