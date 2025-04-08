# Swift Tutorial

# Developer in Swift Tutorials

## Explore Xcode

`String` represents the text type in Swift. The consequences of modifier will influence the final UI shown in actual app.

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

## Views, structures, and properties

### Create a subview

```java 
struct SubView: View {
    var body: some View {
        [View Contents]
    }
}
```

### Add a property

Add a property just by `let [name]: [Type]` format