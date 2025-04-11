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

## Chapter IV: Buttons and state

`@State` properties and buttons can work together to update the UI of app.

Property  marked with the keyword `var` means new values can be **assigned** to it. This view is dynamic.

The `.resizable` modifier tells the image it can stretch to fill any available space.

### Use state to update view

SwiftUI doesn’t monitor every property in an app by default. You need to tell SwiftUI to monitor specific **part** and update UI when it changes. Focus on the variable changing over time or actions and use `@State` to monitor it.

Make `@State` properties private because:

1. View state ownership: The state belongs to that specific view
2. Encapsulation: It prevents other views from directly changing the value

Use `withAnimation` to animate the change outside the codes caused the value change.

```Swift
Button("Roll") {
    withAnimation {
        numberOfPips = Int.random(in: 1...6)
    }
}
```

### ForEach

The ForEach view is dynamic; it computes its subviews based on its input, which may change with the state of the app. 

### UI

The `.tint` modifier only affects views that rely on the accent color — typically controls such as buttons and toggles. 