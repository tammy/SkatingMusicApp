//
//  CardView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/6/24.
//

import SwiftUI


struct CardView: View {
    let program: Program
    
    var body: some View {
        VStack(alignment: .leading) {
    
            HStack {
                Text(program.title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
            }
            HStack {
                Text(program.label)
                    .font(.subheadline)
                Spacer()
                Label("\(program.totalLength)", systemImage: "clock")
                    .font(.subheadline)
//                    .padding(.trailing, 10)
                    .accessibilityLabel("\(program.totalLength) minute music")
                    .labelStyle(.trailingIcon)
            }
        }.padding()
            .foregroundColor(program.theme.accentColor)
    }
}


struct CardView_Previews: PreviewProvider {
    static var program = Program.sampleData[0]
    static var previews: some View {
        CardView(program: program)
            .background(program.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
