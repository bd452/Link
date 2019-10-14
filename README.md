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
 You can also *technically* override self if you're more comfortable with that. It's also *technically* considered a bug to be able to do this, so use at your own risk?
 ````
 let l = View().mutate({`self` in 
    let `self` = self as! View
    self.layer.cornerRadius = 5
    self.layer.masksToBounds = true
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
 ### Templates
 Templates allow you to define reusable prefab instances of classes without subclassing
 
 There are 2 types of template: one where you pass in your own initializer,  and one where the Constructor creates a new instance of your class for you,
 
 **Creating your own instance:**
 If you would like to create your own instance, then you create a new instance of the constructor with `Constructor<T>(T, construction: ((T)->Void)?)`, then call the 'construct' of that
 ````
 let constructor = Constructor<View>(View().frame(0,0,50,50).backgroundColor(.blue), 
 { view in 
 view.layer.cornerRadius = 5
 }).construct
 ````
 Or alternatively, use the class method `Constructor<T>(T, ((T)->Void)?`), which directly returns a construct
 ````
 let constructor = Constructor<View>.generate(View().frame(0,0,50,50).backgroundColor(.blue))
 ````
 If you don't need to access any child properties (or if you use mutators), you can leave off the last parameter
 ````
 let constructor = Constructor<View>(View().frame(0,0,50,50).backgroundColor(.blue))
 ````
 Then you can call the construct to generate a new instance with the given parameters
 ```
 let myView1 = construct()
 let myView2 = construct()
 let myView3 = construct()
 ````
 The above views, myView1, myView2, and myView3 all will be initialized with the same properties
 
 You can also chain the initializer modifiers off of these constructors, like so
 ````
 let myView1 = construct().backgroundColor(.red)
 let myView2 = construct().backgroundColor(.green)
 let myView3 = construct().backgroundColor(.blue)
 ````
 **Using a constructed instance:**
 If you want the Constructor to make the instance for you, you just create a new instance of the constructor with `Constructor<T>((T) -> Void)`, and get the 'construct' of that:
 ````
 let template = Constructor<View>({ view in
 view.frame = Rect(0,0,50,50)
 view.backgroundColor = .blue
 view.layer.cornerRadius = 4
 }.construct
 ````
 Or alternatively, just call the class method `Constructor<T>.construct((T)->Void)`
 ````
 let construct = Constructor<View>.construct({ view in 
 view.frame = Rect(0,0,50,50)
 view.backgroundColor = .blue
 view.layer.cornerRadius = 4
 }
 ````
 Then of course, call the construct to generate your views
 `let view = construct()`

 
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
  A button. Allows for setting properties inline. Also has a method `withTitleLabel` that allows for inline setting of properties on the title label
  **Example:**
  ```let button = Button()
    .origin(0,0)
    .size(100,20)
    .title("Title")
    .withTitleLabel({ label in 
        label.font = Font("Avenir")
        label.textColor = .blue
    })
  ````
  ### ImageView
  An image view. Allows for setting properties inline. Also has a method `withImage` that allows for inline setting of properties of the UIImage object
  **Example:**
  ```
  let imageView = ImageView().image(UIImage(named:"Image.png"))
  ```
  
  ### Font
  Font object. For now, just has an initializer without the label
  
  ### Color
  A color with lots of cool accessors and inline setters. 
   * Has methods to get RGBa and HSBa color components (`Color.rgba()`, which returns a tuple with the RGB components, and `Color.hsba()`, which does the same for HSB)
   * Chainable initializers, which allow you to modify any aspect of the color (rgb or hsb)
**Example:**
````
let Color = Color.blue.red(0.5).brighten(0.1)
````
That will initialize the color blue (#0000FF), then change the red space to 0.5 (#0027FF), then brighten by 0.1(#729FF8)


### ViewController
A view controller which allows for closures to be used for its lifecycle methods (`viewDidLoad`, `viewDidLayoutSubviews`, etc.) per-instance, rather than having to subclass
Also has a method `withView` that allows for inline setting of properties of the controller's view
**Example:**
```
let vc = ViewController()
    .withView({ view in

    })
    .didLoad({ view in

    })
    .didAppear({ appeared in

    })
    .didLayoutSubviews({

    })
    .didDisappear({ disappeared in

    })
    .prepareforSegue({ (segue, sender) in

    })
    ...
```

 
 
