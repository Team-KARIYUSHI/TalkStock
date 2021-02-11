//
//  ActionSheetButton.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/11.
//

import SwiftUI

struct SelectImageButton: View {
    
    @Binding var showingActionSheet: Bool
    @Binding var showingCamera: Bool
    @Binding var showingPhotoLibrary: Bool
    @State var inputImage: UIImage? = UIImage(named: "person.circle")
    @State var image:Image = Image(systemName: "person.circle")
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    var body: some View {
        Button(action: {
            self.showingActionSheet = true
        }) {
            image
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
        }
        ZStack {
            Text("")
                .actionSheet(isPresented: self.$showingActionSheet) {
                    ActionSheet(title: Text("画像を選択してください"),
                                buttons: [
                                    .default(Text("アルバムから選択")) {
                                        self.showingPhotoLibrary.toggle()
                                    },
                                    .default(Text("カメラ撮影")) {
                                        self.showingCamera.toggle()
                                    },
                                    .cancel()
                                ])
                }
                .sheet(isPresented: self.$showingPhotoLibrary,
                       onDismiss: loadImage) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$inputImage)
                }
            Text("")
                .sheet(isPresented: self.$showingCamera,
                       onDismiss: loadImage) {
                    ImagePicker(sourceType: .camera, selectedImage: self.$inputImage)
                }
        }
    }
}

struct SelectImageButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageButton(showingActionSheet: .constant(false),
                          showingCamera: .constant(false),
                          showingPhotoLibrary: .constant(false))
    }
}
