# Swift Tutorial

This repository contains the notes and codes I've compiled while progressing through my learning journey of Swift and SwiftUI.

# Develop in Swift

## Chapter I: Explore Xcode

In Swift, the `String` type is used to denote text. **Modifiers** applied consequences to this type can ultimately impact how the UI appears in a real application.

```Swift
//With padding
Text("Hello, World!")
    .padding()
    .background(Color.green, in: RoundedRectangle(cornerRadius: 6))
//Without padding
Text("Hello, World!")
    .background(Color.green, in: RoundedRectangle(cornerRadius: 6))
    .padding()
```

## Chapter II: Views, structures, and properties

### Create a subview

```java 
struct SubView: View {
    var body: some View {
        [View Contents]
    }
}
```

### Add a property

You can incorporate a property using the format `let [name]: [Type]`, which allows you to pass this property into the subviews seamlessly.

## Chapter III: Layout and Style

