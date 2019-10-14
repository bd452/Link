
<h1 align="center">Propel</h1>
<p align="center">Semi-Declarative user interface programming for Swift</p>

----

Propel is a different way to use UIKit to declare your user interfaces inline, without having to use a million different property setters for every view.

# Features:
 * Create templates for initializing duplicate copies of the same view (without subclassing)
 * Declarative syntax for initializing and configuring views
 * Inline property mutation
 * Closure-based dataSource, delegate, and lifecycle methods (no more subclassing for a simple Table)
 
 ## Inline Properties:
 A basic UILabel in normal swift might be declared as such:
 ```swift
 let label = UILabel()
 label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
 label.textColor = UIColor(red: 50.0/255, green: 50.0/255, blue: 50.0/255, alpha: 1)
 label.font = UIFont(name: "Avenir", size: 14)
 label.text = "Hello World"
 view.addSubview(label)
 ```
 With Propel, the same label could be declared as:
 ```swift
 let myLabel = Label()
     .frame(0,0,100,20)
     .color(Color(0x323232))
     .font(Font("Avenir", 14))
     .text("Hello World")
 view.addSubview(label)
 ```
 Or even
 ```swift
 self.view <- Label()
     .frame(0,0,100,20)
     .color(Color(0x323232))
     .font(Font("Avenir", 14))
     .text("Hello World")
 ```
 
 ## Modify properties of properties while declaring an instance
 For some types, there are designated mutators to change properties of members within your declaration
 
 For example, a Button's label can be accessed using a closure in the constructor with `Button.withTitleLabel` for finer-grained access, or to change properties that aren't included in Propel
 
 **Ex:**
 ```swift
 Button()
    .frame(0,0,0,0)
    .withTitleLabel({ label in 
        label.shadowColor = Color(0x111111)
        label.shadowOffset = Size(5,5)
    })
 ```
 There are also 3 generic mutator functions that will work on *any* property of an NSObject subclass
 For mutating multiple properties:
 ```swift
  NSObject.mutate((NSObject)->Void)
  ```
  For mutating a single property:
 ```swift
 NSObject.mutate<T>(T.Type, String, (T)->Void)
 ```
 For replacing a property with a new instance:
 ```swift
 NSObject.mutate<T>(T.Type, String, (T)->T)
 ```
 
These look a bit messier than the designated mutators, but they get the job done.

 ### Ex 1:
 ```swift
 let l = View()
    .frame(0,0,10,10)
    .mutate({ view in 
        let view = view as! View
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
    })
 ```
 You can also *technically* override self if you're more comfortable with that. It's also *technically* considered a bug to be able to do this, so use at your own risk?
 ```swift
 let l = View().mutate({`self` in 
    let `self` = self as! View
    self.layer.cornerRadius = 5
    self.layer.masksToBounds = true
 })
 ```
 ### Ex 2:
 ```swift
 let l = View()
    .frame(0,0,10,10)
    .mutate(CALayer.self, "layer") { (layer)->Void in
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
 ```
 ### Ex 3:
 ```swift
 let l = View()
     .frame(0,0,10,10)
     .mutate(CALayer.self, "layer") { (_)->CALayer in
         let layer = CALayer()
         return layer
     }
 ```
 ## Template Constructors
 Template Constructors allow you to define reusable instances of a particular class.
 The constructor will allow you to generate repeated instances of the class with the properties that you designate.
 
 There are 2 types of template: one where you pass in your own initializer, and one where the Constructor creates a new instance of your class for you.
 
 Because of Propel's chained property initializers and mutators, it is probably easier to generate your own instance the majority of the time. However, if you don't want to use the chained initializers, you can use the pre-generated instance.
 
 ### Creating your own instance
 If you would like to create your own instance, then you create a new instance of the constructor with `Constructor<T>(T, construction: ((T)->Void)?)`
 ```swift
 let ctor = Constructor<View>(View().frame(0,0,50,50).backgroundColor(.blue), 
 { view in 
    view.layer.cornerRadius = 5
 })
 let construct = ctor.construct
 ```
 
 Or alternatively, use the class method `Constructor<T>(T, ((T)->Void)?`), which directly returns a construct
 ```swift
 let constructor = Constructor<View>.generate(View().frame(0,0,50,50).backgroundColor(.blue))
 ```
 
 If you don't need to access any child properties (or if you use mutators), you can leave off the last parameter
 ```swift
 let constructor = Constructor<View>(View().frame(0,0,50,50).backgroundColor(.blue))
 ```
 The `Construct` object has one property, `construct`, which is an initializer for your instance. You can call this as a function to generate a new instance of your class.
 
 ```swift
 let instance = construct()
 ```
 
 Then you can call the construct to generate a new instance with the given parameters
 ```swift
 let myView1 = construct()
 let myView2 = construct()
 let myView3 = construct()
 ```
 The above views, myView1, myView2, and myView3 all will be initialized with the same properties
 
 You can also chain the initializer modifiers off of these constructors, like so
 ```swift
 let myView1 = construct().backgroundColor(.red)
 let myView2 = construct().backgroundColor(.green)
 let myView3 = construct().backgroundColor(.blue)
 ```
 
 **Full Example:**
 ```swift
 let constructor = Constructor<Label>(Label().frame(0,0,50,50).text("Hello World").color(.blue))
 let construct = constructor.construct
 let myLabel1 = construct()
 let myLabel2 = construct().text("Propel")
 let myLabel3 = construct().color(.red)
 ```
 
 ### Using a constructed instance
 
 If you want the Constructor to make the instance for you, you just create a new instance of the constructor with `Constructor<T>((T) -> Void)`, and get the 'construct' of that:
 ```swift
 let template = Constructor<View>({ view in
    view.frame = Rect(0,0,50,50)
    view.backgroundColor = .blue
    view.layer.cornerRadius = 4
 }.construct
 ```
 Or alternatively, just call the class method `Constructor<T>.construct((T)->Void)`
 ```swift
 let construct = Constructor<View>.construct({ view in 
    view.frame = Rect(0,0,50,50)
    view.backgroundColor = .blue
    view.layer.cornerRadius = 4
 }
 ```
 Then of course, call the construct to generate your views
 ```swift
 let view = construct()
 ```

 
 ## New "Types":
 
 ### Rect
 A rectangle (x, y, width, height). Allows for inline modification of individual parameters, as well as position and size
 ### Size
 A size (width, height). Allows for inline modification of width and height
 ### Point
 A point (x, y). Allows for inline modification of x and y coordinates
 
 ### View
 A view. Allows for setting properties inline
 
 Also adds: 
  * `add(View)`, a chainable `addSubview` 
  * `withLayer(Layer)`, a mutator for the view's layer
  * `translated(x, y)`, to translate the view
  * `enlarged(width, height)`, to enlarge/shrink the view
  * `constrain(constraint, Anchor, constant)`, to add basic autolayout constraints to the view
 
 **Example:**
 ```swift
 let viewConstructor = Constructor<View>(View(100, 100, 50, 50)
         .withLayer({ layer in
             layer.cornerRadius = 5
             layer.masksToBounds = true
             layer.borderColor = Color.black.cgColor
             layer.borderWidth = 2
         })
     ).construct
 let view = viewConstructor().backgroundColor(.red)
 let view2 = viewConstructor().translated(x: 50).backgroundColor(.green)
 let view3 = viewConstructor().translated(x: 100).backgroundColor(.blue)

 self.view
     .add(view)
     .add(view2)
     .addSubview(view3)
 ```
 ### Label
 A label. Allows for setting properties inline
 
 **Example:**
  ```swift
  let label = Label().origin(0,0).size(50,50).font(Font("Avenir", 14))
  ```
  ### Button
  A button. Allows for setting properties inline. Also has a method `withTitleLabel` that allows for inline setting of properties on the title label
  
  **Example:**
  ```swift
  let button = Button()
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
  ```swift
  let imageView = ImageView().image(UIImage(named:"Image.png"))
  ```
  
  ### Font
  Font object. For now, just has an initializer without the label
  
  ### Color
  A color with lots of cool accessors and inline setters. 
   * Has methods to get RGBa and HSBa color components (`Color.rgba()`, which returns a tuple with the RGB components, and `Color.hsba()`, which does the same for HSB)
   * Chainable initializers, which allow you to modify any aspect of the color (rgb or hsb)
   
**Example:**
```swift
let Color = Color.blue.red(0.5).brighten(0.1)
```
That will initialize the color blue (#0000FF), then change the red space to 0.5 (#0027FF), then brighten by 0.1 (#729FF8)


### ViewController
A view controller which allows closures to be used for its lifecycle methods (`viewDidLoad`, `viewDidLayoutSubviews`, etc.) per-instance, rather than having to subclass.

Also has a method `withView`, a designated mutator for the controller's view.

**Example:**
```swift
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

### TableViewController
A table view controller which allows closures to be used for its dataSources (`cellForRowAtIndexPath`, `heightForRowAtIndexPath`, etc.) along with the closures from ViewController

**Example:**
```swift

let tableView = TableViewController(style: .plain)
    .numberOfSections(3)
    .cell { (tableView, indexPath) in
        let cell = UITableViewCell()
            .backgroundColor([Color.red, Color.blue, Color.green][indexPath.section])
        cell.textLabel?.text = "\(indexPath.row)"
        cell.detailTextLabel?.text = "\(indexPath.section)"
        return cell
    }
    .cellHeight { _,_ in 100 }
    .numberOfRows { _, _ in 10 }
```
