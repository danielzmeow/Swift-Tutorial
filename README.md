# Swift Tutorial

This repository contains the notes and code I've compiled while progressing through my learning journey of Swift and SwiftUI.

# Develop in Swift

## Chapter I: Explore Xcode

In Swift, the `String` type is used to represent text. **Modifiers** applied to views can ultimately impact how the UI appears in a real application.

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

```swift
struct SubView: View {
    var body: some View {
        [View Contents]
    }
}
```

### Add a property

You can incorporate a property using the format `let [name]: [Type]`, which allows you to pass this property into subviews seamlessly.

## Chapter III: Layout and style

In Xcode, incorporating a new SwiftUI View is straightforward; just navigate to File > New > File from Template.

The `.font` modifier, which requires a **Font** type argument, allows shorthand notation—`Font.title` can be succinctly written as `.title`.

Ensure that when utilizing `#Preview`, the logic aligns with your invocation method. The description should be sufficiently extensive to span multiple lines, for example, *A multiline description about a feature paired with the image on the left.*

### Size of Views

To add borders to UI views, employ the `.border` modifier. Meanwhile, `.frame` is intended to constrain view dimensions. Use `.tint` to apply the App's accent color.

### Padding

To add padding surrounding views, utilize `.padding`.

Integrate `Spacer()` to occupy additional space, ensuring the page is fully utilized.

### Tab View

Craft a tab view using the `TabView` container.

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

SwiftUI does not inherently monitor all properties within an app. To ensure that SwiftUI keeps track of specific **variables** and updates the UI when changes occur, focus on variables that evolve over time or through actions, and employ `@State` to manage them.

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

The `ForEach` view is dynamic and generates its subviews from its input, which can vary with the app's state.

### UI

The `.tint` modifier influences only views that utilize the accent color, primarily controls like buttons and toggles.

## Chapter V: List and Text Fields

### List view

A `List` view adds other views to the content in its body, like separators between rows and visual elements such as rounded corners and backgrounds.

### TextField

A `TextField` view lets people enter text into a box.

### Binding

A binding is a way for you to give one view access to state that another view owns. To create a binding to a state property, prefix the property name with `$`.

### Comparison of @State and @Binding in SwiftUI

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

Carefully handle situations that may contain a `nil` return.

```Swift
if let randomName = names.randomElement() {
    pickedName = randomName
} else {
    pickedName = " "
}
```

## Chapter VI: Custom Types and Swift Testing

### Define Your Own Type

Adopting a *non-combined* strategy for data modeling can easily result in **inconsistent** data.

```Swift
@State private var players: [String] = ["Tom", "Ndr", "Clay"]
@State private var scores: [Int] = [0, 0, 0]
```

To ensure data consistency, it's crucial to define your own type.

### ID

To make a type conform to `Identifiable`, you'll need to incorporate the following:

```Swift
// Example
let id = UUID()
```

By using the `$` prefix, you can bind each element within the array. Thanks to conforming to `Identifiable`, there's no longer a necessity to specify the `id:` parameter when utilizing `ForEach`.

### Enumerations

Enumerations define a common type for a group of related but mutually exclusive values. Unlike a struct, which can have many instances, the only values of an enumeration that exist are the ones in its definition.

```Swift
enum EnumerationsOfGame {
    case a
    case b
}
```

### Switch Statement

```Swift
switch status.state {
    case 1:
    case 2:
    default:
}
```

### Mutating Structure

For `struct` types, you mark any methods that might change the properties of that `struct` with the `mutating` keyword.

```Swift
mutating func resetScore(to newValue: Int) {
    code
}
```

### Unit Test

Recall that your test product is **separate** from your app product. Use the following code:

```Swift
@testable import YourApp
```

```Swift
struct ScoreKeeperTests {
    // Use @Test to announce
    // Use arguments to pass in parameters
    @Test("Reset Player Scores", arguments: [0, 10, 20]) func resetScores(to newValue: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        // Actions
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        scoreboard.resetScores(to: newValue)

        for player in scoreboard.players {
            // Expected outcomes
            #expect(player.score == newValue)
        }
    }

}
```

## Chapter VII: Models and Persistence

### Date

The format declaration is **semantic**: You specify the parts of the date you want to display and let the system render the text according to the device’s current calendar.

### Navigation Stack

`NavigationStack` is often used to stack views on top of each other, like a stack of cards. The primary purpose of `NavigationStack` is navigation, but it also offers functionality like navigation bars, buttons, toolbars, and titles.

### Swift Data

The aim of a database is for persistent storage.

Import SwiftData first:

```Swift
import SwiftData
```

`@Model`: SwiftData gives you access to the `@Model` macro. Macros modify existing code with new functionality. In this case, @Model converts a Swift class into a stored model managed by SwiftData. Using `@Model` will automatically convert data **observable**. To connect specific data, use `@Bindable` (like `@Binding`)

Identity: The *class* type has built-in identity, while the *structure* type does not.

Initializer: For *structures*, Swift generates an initializer with arguments matching each of its properties. But *classes* don’t get autogenerated initializers.

SwiftData needs a **container** to connect SwiftUI and SwiftData.

> The container is like a translator that sits between where the *data* is stored and the ContentView on screen. `*.self` references the type of data rather than a specific data instance. The container uses the type blueprint to understand how the model should be saved.

```Swift
ContentView()
    .modelContainer(for: Data.self, inMemory: true)
```

- Put a model into the app container.
- Use `@Query` to get the model (Each data is viewed as a kind of model).
- Use `@Environment` (variable) to access the context and modify data.

## Chapter VIII: Navigation, Editing and Relationships

### Tab View

```Swift
TabView {
    Tab("Friends", systemImage: "person.and.person") {
        Text("Friends")
    }

    Tab("Movies", systemImage: "film.stack") {
        Text("Movies")
    }
}
```
### Create Sample Data

Swift can automatically infer the type of data and add it to the proper place.

```Swift
import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self
        ])

        let modelConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfig])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
```

### Set initial value

Deciding on the proper UI to display is important. Use `init` to give a default value to specific parameters. Through this method, code can be reused in different places, e.g., creating a *new* item and displaying item *details*.

```Swift
init(friend: Friend, isNew: Bool = false) {
    self.friend = friend
    self.isNew = isNew
}
```

### Relationship

Use `?` to denote an optional type. Each relationship must be **two-way** with *relationship* and *inverse relationship*

The SwiftData can infer two-way relationship automatically based on the types of the properties involved


## Observation and Shareable Data Models

### `struct` and `class`

| Feature | Struct | Class |
|---------|--------|-------|
| Type | **Value** type | **Reference** type |
| Memory allocation | Stack (typically) | Heap |
| Copy behavior | Creates a new copy when assigned or passed | Passes a reference to the same instance |
| Mutability | Requires `mutating` keyword for methods that modify self | No special keyword required for modification |
| Inheritance | Does not support inheritance | Supports inheritance |
| Initialization | Automatic memberwise initializer | No automatic memberwise initializer |
| Deinitializer | No deinitializer | Can implement `deinit` |
| Identity operators | Cannot use `===` and `!==` | Can use `===` and `!==` to check identity |
| Performance | Generally faster for small, simple data | May be better for large, complex data |
| Thread safety | Safer in multi-threaded environments (due to value semantics) | Requires careful management in multi-threaded code |
| Use cases | Simple data types, immutable data, small data structures | Complex objects, shared data, objects with identity |
| Reference counting | No reference counting overhead | Uses ARC (Automatic Reference Counting) |
| Default choice | Preferred by Apple when possible | Use when specific class features are needed |

**Choose Struct when:**
- You need value semantics (copies rather than references)
- You're working with small, simple data
- The data should be immutable or have controlled mutation
- You don't need inheritance
- You want thread safety without synchronization

**Choose Class when:**
- You need reference semantics (shared instances)
- You need inheritance
- You need deinitializers for cleanup
- You're working with Objective-C interoperability
- The object's identity matters more than its data
- You need to control the lifecycle of resources