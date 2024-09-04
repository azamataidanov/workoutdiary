@_private(sourceFile: "ContentView.swift") import WorkoutDiary
import func SwiftUI.__designTimeSelection
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/ContentView.swift", line: 12)
        __designTimeSelection(VStack {
            __designTimeSelection(Image(systemName: __designTimeString("#9192.[1].[0].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "globe"))
                .imageScale(.large)
                .foregroundStyle(.tint), "#9192.[1].[0].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(Text(__designTimeString("#9192.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Hello, world!")), "#9192.[1].[0].property.[0].[0].arg[0].value.[1]")
        }
        .padding(), "#9192.[1].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct WorkoutDiary.ContentView
#Preview {
    ContentView()
}



