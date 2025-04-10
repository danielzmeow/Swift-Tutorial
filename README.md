# Swift Tutorial

This repository contains the notes and codes I've compiled while progressing through my learning journey of Swift and SwiftUI.
<<<<<<< HEAD
=======

# Developer in Swift Tutorials
>>>>>>> 012fba075d1df87667f5ff8a40a970dc8b5ec385

# Develop in Swift

<<<<<<< HEAD
## Chapter I: Explore Xcode

=======
>>>>>>> 012fba075d1df87667f5ff8a40a970dc8b5ec385
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

<<<<<<< HEAD
You can incorporate a property using the format `let [name]: [Type]`, which allows you to pass this property into the subviews seamlessly.

## Chapter III: Layout and Style

=======
You can incorporate a property using the format `let [name]: [Type]`, which allows you to pass this property into the subviews seamlessly.
>>>>>>> 012fba075d1df87667f5ff8a40a970dc8b5ec385
