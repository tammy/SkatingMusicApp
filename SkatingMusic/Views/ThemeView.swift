import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        HStack {
            Circle()
                .fill(theme.mainColor)
                .frame(width: 20, height: 20)
                .shadow(radius: 0) // Adds a shadow
//            Spacer()
            Text(theme.name)
        }
        .padding(4)
        
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
