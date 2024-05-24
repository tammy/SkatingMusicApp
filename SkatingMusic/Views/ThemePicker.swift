import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                HStack {
                    ThemeView(theme: theme)
                        .tag(theme)
                        .frame(width: 30)
                }
            }
        }.pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Preview: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
