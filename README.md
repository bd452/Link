# Propel
Semi-Declarative user interface programming for Swift

Propel is a different way to use UIKit to declare your user interfaces inline, without 50 different property setters.

## Features:
 * Create templates for initializing duplicate copies of the same view (without subclassing)
 * Use a declarative syntax to initialize a view
 * Mutate properties of classes within the declaration
 
 ### Inline Properties:
 For example, a basic UILabel in normal swift might be declared as such:
 ````
 let label = UILabel()
 label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
 label.textColor = UIColor(red: 50.0/255, green: 50.0/255, blue: 50.0/255, alpha: 1)
 label.font = UIFont(name: "Avenir", size: 14)
 label.text = "Hello World"
 view.addSubview(label)
 ````
 With Propel, the same label could be declared as:
 ````
 let myLabel = Label()
     .origin(Point(0, 0))
     .size(Size(100,20))
     // or .frame(0,0,100,20)
     .color(Color(0x323232))
     .font(Font("Avenir", 14))
     .text("Hello World")
 view.addSubview(label)
 ````
 Or even
 ````
 self.view <- Label()
     .frame(0,0,100,20)
     .color(Color(0x323232))
     .font(Font("Avenir", 14))
     .text("Hello World")
 ````
 
 ### Modify properties of members in the declaration
 For some types in propel, there are methods to change properties of members in the declaration
 
 For example, a Button's label can be accessed using a closure in the constructor with `Button.withTitleLabel((Label) -> Void))` for finer-grained access, or to change properties that aren't included in Propel
 Ex:
 ````
 Button()
    .frame(0,0,0,0)
    .withTitleLabel({ label in 
        label.shadowColor = Color(0x111111)
        label.shadowOffset = Size(5,5)
    })
 ````
 There are also 3 generic mutator functions that will work to change any property of any class that inherits from NSObject during construction.
 * `NSObject.mutate((NSObject)->Void)`: For mutating multiple properties
 * `NSObject.mutate<T>(T.Type, String, (T)->Void)`: For mutating a single property
 * `NSObject.mutate<T>(T.Type, String, (T)->T)`: For replacing a property with a new instance
  These look a bit messier than the designated mutators, but they get the job done.
 Ex 1 – :
 ````
 let l = View()
    .frame(0,0,10,10)
    .mutate({ view in 
        let view = view as! View
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
    })
 ````
 Ex 2:
 ````
 let l = View()
    .frame(0,0,10,10)
    .mutate(CALayer.self, "layer") { (layer)->Void in
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
 ````
 Ex 3:
 ````
 let l = View()
     .frame(0,0,10,10)
     .mutate(CALayer.self, "layer") { (_)->CALayer in
         let layer = CALayer()
         return layer
     }
 ````
 
 
 ## New "Types":
 
 ### Rect
 A rectangle (x, y, width, height). Allows for inline modification of individual parameters, as well as position and size
 ### Size
 A size (width, height). Allows for inline modification of width and height
 ### Point
 A point (x, y). Allows for inline modification of x and y coordinates
 
 ### View
 A view. Allows for setting properties inline
 **Example:**
 `let view = View().origin(0,0).size(50,50).backgroundColor(.blue).`
 ### Label
 A label. Allows for setting properties inline
 **Example:**
  `let label = Label().origin(0,0).size(50,50).font(Font("Avenir", 14))`
  ### Button
  A button. Allows for setting properties inline
  **Example:**
  `leb `
 
 ## Example usage:
 ### Templates:
 ````
 // Template
 let myView_Template = Constructor<View>(construction: { view in
    view.frame = Rect(0,0,50,50)
    view.backgroundColor = .blue
    view.layer.cornerRadius = 4
 }
````
