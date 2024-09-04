@_private(sourceFile: "OnboardingView.swift") import WorkoutDiary
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension OnboardingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/Onboarding/OnboardingView.swift", line: 15)
        NavigationStack {
            VStack(spacing: __designTimeInteger("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: 20)) {
                let currentItem = OnboardingData.sampleData[currentIndex]

                Text(currentItem.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(currentItem.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Force unwrapped image will crash if nil
                (currentItem.image ?? Image(systemName: __designTimeString("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[3].[0].[0]", fallback: "star.fill")))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: __designTimeInteger("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[3].modifier[2].arg[0].value", fallback: 150), height: __designTimeInteger("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[3].modifier[2].arg[1].value", fallback: 150))
                                    .foregroundColor(currentItem.image == nil ? .gray : .primary)

                Button(action: {
                    if    currentItem.image == nil {
                        self.isActive = __designTimeBoolean("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[4].arg[0].value.[0].[0].[0].[0]", fallback: true)
                    } else {
                        self.currentIndex += __designTimeInteger("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[4].arg[0].value.[0].[1].[0].[0]", fallback: 1)
                    }
                }) {
                    Text(currentIndex == OnboardingData.sampleData.count - __designTimeInteger("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[4].arg[1].value.[0].arg[0].value.if.[0]", fallback: 1) ? __designTimeString("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[4].arg[1].value.[0].arg[0].value.then", fallback: "Finish") : __designTimeString("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[4].arg[1].value.[0].arg[0].value.else", fallback: "Next"))
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(__designTimeInteger("#8637.[1].[2].property.[0].[0].arg[0].value.[0].arg[1].value.[4].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10))
                }
                .background(
                    NavigationLink  (
                        destination: WorkoutListView(),
                        isActive: $isActive,
                        label: { EmptyView() }
                    )
                )
            }
            .padding()
        }
    
#sourceLocation()
    }
}

import struct WorkoutDiary.OnboardingView
import struct WorkoutDiary.OnboardingData
#Preview {
    OnboardingView()
}



