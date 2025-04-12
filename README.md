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

## Chapter II: Views, Structures, and Properties

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

## Chapter III: Layout and style

In Xcode, incorporating a new SwiftUI View is straightforward; just navigate to File > New > File from Template.

The `.font` modifier, which demands a **Font** type argument, allows shorthand notation—`Font.title` can be succinctly written as `.title`.

Ensure that when utilizing `#Preview`, the logic aligns with your invocation method. The description should be sufficiently extensive to span multiple lines, for example, *A multiline description about a feature paired with the image on the left.*

### Size of Views

To add borders to UI views, employ the `.border` attribute. Meanwhile, `.frame` is intended to constrain view dimensions. Use `.tint` to deploy the App's accent color.

### Padding

To instantiate padding surrounding views, utilize `.padding`.

Integrate `Spacer()` to occupy additional space, ensuring the page is fully utilized.

### Tab View

Craft a tab view using the tab view interface.

```Swift
TabView {
    WelcomePage()
    FeaturePage()
}
.tabViewStyle(.page)
```

### Customize Color in Assets

Focus on the following aspects:

- Opacity
- Brightness
- Gradient

## Chapter IV: Buttons and State

When combined, `@State` properties and buttons enable the UI of an app to be dynamically updated.

A property identified with the `var` keyword indicates that new values can be **assigned** to it, making the view dynamic.

The `.resizable` modifier grants the image the ability to expand and occupy any available space.

### Utilize State to Refresh the View

SwiftUI does not inherently monitor all properties within an app. To ensure that SwiftUI keeps track of specific **elements** and updates the UI when changes occur, focus on variables that evolve over time or through actions, and employ `@State` to oversee them.

Make `@State` properties private because:

1. View State Ownership: The state is exclusive to the particular view.
2. Encapsulation: This prevents other views from modifying the value directly.

Implement `withAnimation` to animate changes that occur outside the code that triggers the value alteration.

```swift
Button("Roll") {
    withAnimation {
        numberOfPips = Int.random(in: 1...6)
    }
}
```

### ForEach

The ForEach view is dynamic and generates its subviews from its input, which can vary with the app's state.

### UI

The `.tint` modifier influences only views that utilize the accent color, primarily controls like buttons and toggles.

## Chapter V: List and text fields

### List view

A `List` view adds other views to the content in its body, like separators between rows and visual elements such as rounded corners and backgrounds.

### TextField

A `TextField` view lets people enter text into a box.

### Binding

A binding is a way for you to give one view access to state that another view owns. To create a binding to a state property, prefix the property name with $.

# Comparison of @State and @Binding in SwiftUI

| Feature           | @State                                            | @Binding                                                                    |
| ----------------- | ------------------------------------------------- | --------------------------------------------------------------------------- |
| Purpose           | Used to store and manage state within a view      | Creates a reference to state stored elsewhere                               |
| Ownership         | Owns and manages the data                         | Does not own data, only references it                                       |
| Data Flow         | One-way data flow, used within the view           | Two-way data flow, allows child views to modify parent view's state         |
| Use Case          | Simple state internal to a view                   | Sharing state across the view hierarchy                                     |
| Declaration       | Usually declared as private                       | Not typically declared as private, as it's a reference                      |
| Initialization    | Requires an initial value                         | No initial value needed, but requires a state variable passed with $ prefix |
| Memory Management | SwiftUI manages the storage of the value          | References a value stored and managed elsewhere                             |
| View Updates      | When value changes, view automatically re-renders | When referenced value changes, view automatically re-renders                |
| Symbol Usage      | Access directly by name in the view               | Passed to child views using $ prefix                                        |
| Scope             | Limited to the view that declares it              | Enables data sharing between parent and child views                         |

Carefully deal with situation may contains a `nil` return.

```Swift
if let randomName = names.randomElement() {
    pickedName = randomName
} else {
    pickedName = " "
}
```

