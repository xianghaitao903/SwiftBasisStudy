# 属性 (Properties)
## 存储属性
简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）。


```
struct FixLengthRange {
var firstValue: Int
let length: Int
}

let fixLengthRange = FixLengthRange(firstValue: 20, length: 21)

//fixLengthRange.firstValue = 30  不可以被修改

//fixLengthRange.length = 30  不可以被修改
```
因为 rangeOfFourItems 被声明成了常量（用 let 关键字），即使 firstValue 是一个变量属性，也无法再修改它了。

这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。

struct 只要被标注为var 那么标注为 var 的属性可以被更改 let的 不可以被修改
```
var fixLengthRange2 = fixLengthRange

fixLengthRange2.firstValue = 30

//fixLengthRange2.length = 30
```

## 延迟存储属性
延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。

> 注意

> 必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
```
class dataImpoter {
let fileName = "data.txt"
}

class dataManger {
lazy var dataImpoter1 = dataImpoter()

var data = [String]()
}

let manger = dataManger()

manger.data.append("some data")

manger.data.append("some more data")
//由于使用了 lazy ，importer 属性只有在第一次被访问的时候才被创建。比如访问它的属性 fileName 时：

print(manger.dataImpoter1.fileName)
```

## 存储属性和实例变量
Objective-C 为类实例存储值和引用提供两种方法。除了属性之外，还可以使用实例变量作为属性值的后端存储。

Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。

### 计算属性
除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
```
struct Point {
var x: Float
var y: Float
}

struct Size {
var height,width: Float
}

struct Rect {
var point = Point(x: 0.0, y: 0.0)
var size = Size(height: 0.0, width: 0.0)
var center:Point {
get {
let centerX = point.x + size.width / 2
let centerY = point.y + size.height / 2
return Point(x: centerX, y: centerY)
}
set(newCenter) {
point.x = newCenter.x - size.width / 2
point.y = newCenter.y - size.height / 2
}
}
}

var square = Rect(point: Point(x: 0, y: 0), size: Size(height: 10, width: 10))

let initialSquareCenter = square.center

square.center = Point(x: 15, y: 15)

print("square's point is \(square.point)")
```

### 便捷 setter 声明
如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。下面是使用了便捷 setter 声明的 Rect 结构体代码：

```
struct Rect2 {
var point = Point(x: 0.0, y: 0.0)
var size = Size(height: 0.0, width: 0.0)
var center:Point {
get {
let centerX = point.x + size.width / 2
let centerY = point.y + size.height / 2
return Point(x: centerX, y: centerY)
}
set{
point.x = newValue.x - size.width / 2
point.y = newValue.y - size.height / 2
}
}
}
```

### 只读计算属性
只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
> 注意

> 必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值。

```
struct Cuboid {
var width = 0.0, height = 0.0, depth = 0.0
var volume: Double {
return width * height * depth
}
}

let cuboid = Cuboid(width: 2, height: 3, depth: 6)

print(cuboid.volume)
```

### 属性观察器 
可以为属性添加如下的一个或全部观察器：

* willSet 在新的值被设置之前调用  不带参数,默认为newValue
* didSet 在新的值被设置之后立即调用 不带参数,默认为oldValue

```
class StepCount {
var totalSteps: Int = 0 {
willSet {
print("the totalStep will change to \(newValue) ")
}

didSet {
print("the totalStep did change from \(oldValue)")
}
}
}

let stepCount = StepCount()

stepCount.totalSteps = 1

stepCount.totalSteps = 2

```
> 注意

> 如果将属性通过 in-out 方式传入函数，willSet 和 didSet 也会调用。这是因为 in-out 参数采用了拷入拷出模式：即在函数内部使用的是参数的 copy，函数结束后，又对参数重新赋值。关于 in-out 参数详细的介绍，请参考输入输出参数

## 全局变量和局部变量 Type properties (static)
计算属性和属性观察器所描述的功能也可以用于全局变量和局部变量。全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。
> 注意

> 全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记lazy修饰符。
局部范围的常量或变量从不延迟计算。

## 类型属性
实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。

也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性。

类型属性用于定义某个类型所有实例共享的数据，比如所有实例都能用的一个常量（就像 C 语言中的静态常量），或者所有实例都能访问的一个变量（就像 C 语言中的静态变量）。

存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算型属性一样只能定义成变量属性。
> 注意

> 跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值。
存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。

### 类型属性语法
```
struct SomeStruct {
static var property1 = 12
static var property2: Int{
return 3
}
}

var someStruct1 = SomeStruct()
SomeStruct.property1 = 14
print(SomeStruct.property1 + SomeStruct.property2)

enum SomeEnumeration {
static var storedSomeTypeProperty = "Some Value."
static var computedTypeproperty: Int {
return 6
}
}

SomeEnumeration.storedSomeTypeProperty = "another Value."
print(SomeEnumeration.computedTypeproperty)

class SomeClass {
static var storedSomeTypeProperty = "Some Value."
static var computedSomeTypeProperty: String {
return "ssddsf"
}
}

SomeClass.storedSomeTypeProperty = "another Value."
print(SomeClass.computedSomeTypeProperty)
```

### 获取和设置类型属性的值
跟实例属性一样，类型属性也是通过点运算符来访问。但是，类型属性是通过类型本身来访问，而不是通过实例。比如：
```

struct AudioChannel {
static let thresholdLevel = 10
static var maxInputLevelForAllChannel = 0
var currentLevel: Int = 0 {
didSet {
if currentLevel > AudioChannel.thresholdLevel {
currentLevel = AudioChannel.thresholdLevel
}
if currentLevel > AudioChannel.maxInputLevelForAllChannel {
AudioChannel.maxInputLevelForAllChannel = currentLevel
}
}
}
}

var leftAudioChannel = AudioChannel()

leftAudioChannel.currentLevel = 7;

print("AudioChannel.thresholdLevel = \(AudioChannel.thresholdLevel) and AudioChannel.maxInputLevelForAllChannel = \(AudioChannel.maxInputLevelForAllChannel)")

var rightAudioChannel = AudioChannel()
rightAudioChannel.currentLevel = 20
print("AudioChannel.thresholdLevel = \(AudioChannel.thresholdLevel) and AudioChannel.maxInputLevelForAllChannel = \(AudioChannel.maxInputLevelForAllChannel)")
```