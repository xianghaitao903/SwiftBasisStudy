# 枚举
在 Swift 中，枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性，例如计算型属性（computed properties），用于提供枚举值的附加信息，实例方法（instance methods），用于提供和枚举值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；可以在原始实现的基础上扩展它们的功能；还可以遵守协议（protocols）来提供标准的功能。

## 语法
```
enum SomeEnumerations {

}

enum Compasspoint {
case North
case South
case East
case Wast
}
```
枚举中定义的值（如 North，South，East和West）是这个枚举的成员值（或成员）。你使用case关键字来定义一个新的枚举成员值。

>注意

> 与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的CompassPoint例子中，North，South，East和West不会被隐式地赋值为0，1，2和3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型。

多个成员值可以出现在同一行上，用逗号隔开：
```
enum Plante {
case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
```
每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如CompassPoint和Planet）应该以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：

```
var directionToHead = Compasspoint.North
```
directionToHead的类型可以在它被CompassPoint的某个值初始化时推断出来。一旦directionToHead被声明为CompassPoint类型，你可以使用更简短的点语法将其设置为另一个CompassPoint的值：
```
directionToHead = .Wast
```
## 使用 Switch 语句匹配枚举值
使用switch语句匹配单个枚举值：
```
switch directionToHead {
case .North:
print("Lots of plantes have a North")
case .South:
print("watch out for penguins")
case .East:
print("where the sun rises")
case .Wast:
print("where the skies are blue")
}
```
“判断directionToHead的值。当它等于.North，打印“Lots of planets have a north”。当它等于.South，打印“Watch out for penguins”。”

switch directionToHead {
case .East:
print("where the sun rises")
default:
print("Not the East")
}

## 关联值（Associated Values）
有时候能够把其他类型的关联值和成员值一起存储起来会很有用。
```
case UPCA(Int, Int, Int, Int)
case QRcode(String)
}

var productBarcode = Barcode.UPCA(10, 12, 13, 14)

//productBarcode = .QRcode("1234")
```
这时，原始的Barcode.UPCA和其整数关联值被新的Barcode.QRCode和其字符串关联值所替代。Barcode类型的常量和变量可以存储一个.UPCA或者一个.QRCode（连同它们的关联值），但是在同一时间只能存储这两个值中的一个。

像先前那样，可以使用一个 switch 语句来检查不同的条形码类型。然而，这一次，关联值可以被提取出来作为 switch 语句的一部分。你可以在switch的 case 分支代码中提取每个关联值作为一个常量（用let前缀）或者作为一个变量（用var前缀）来使用：
```
switch productBarcode {
case .UPCA(let numberSystem, let manuacturer, let product, let check):
print("UPC-A \(numberSystem), \(manuacturer), \(product), \(check)")
case .QRcode(let productName):
print(productName)

}
```
> 如果都为变量，或者都为常量可以只在最前面加一个var 或者let

```
productBarcode = .QRcode("1234")
switch productBarcode {
case let .UPCA(a, b, c, d):

print(a + b + c + d)
case var .QRcode(aa):
//    code
print(aa)
aa = "123455"
print(aa)
print(productBarcode)
}
```

## 原始值（Raw Values）
 类型可以为 String Character Integer number .. 每一个case 必须唯一

enum ASCIIControlCharacter:Character {
case Tab = "\t"
case LineFeed = "\n"
case CarriageReturn = "\r"
}

## 原始值的隐式赋值（Implicitly Assigned Raw Values）
* Int 型 如果只给第一个值，其他值会依次类推，第二个为第一个加一; 都不给值，第一个默认为0
```
enum Plante2: Int {
case Merury = 1, Venus, Earth, Mars
}
```

* String 型 不设初值 第一个值为 “North” 后面依次类推
```
enum Compass2: String {
case North, Wast, East, South
}
```
## 使用原始值初始化枚举实例（Initializing from a Raw Value）

```
//possiblePlante 为Plante2 类型 并根据 rawValue 没有找到匹配项则为空
var possiblePlante = Plante2(rawValue: 7)
print(possiblePlante)
possiblePlante = Plante2(rawValue: 2)  // possiblePlante = Venus
print(possiblePlante!)
```

## 递归枚举（recursive enumeration）
递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
```
enum ArithmeticExpression {
case Number(Int)
indirect case Addition(ArithmeticExpression, ArithmeticExpression)
indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
//或者这样定义 所有成员都可递归
indirect enum ArithmeticExpression2 {
case Number(Int)
case Addition(ArithmeticExpression2,ArithmeticExpression2)
case Multiplication(ArithmeticExpression2,ArithmeticExpression2)
}
```
上面定义的枚举类型可以存储三种算术表达式：纯数字、两个表达式相加、两个表达式相乘。枚举成员Addition和Multiplication的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能。例如，表达式(5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。下面的代码展示了使用ArithmeticExpression这个递归枚举创建表达式(5 + 4) * 2

```
func evaluate(expression: ArithmeticExpression) -> Int {

switch expression {
case .Number(let value) :
return value
case .Addition(let left, let right) :
return evaluate(left) + evaluate(right)
case .Multiplication(let left, let right) :
return evaluate(left) * evaluate(right)
}
}

let five = ArithmeticExpression.Number(5)
let six = ArithmeticExpression.Number(6)
let sum = ArithmeticExpression.Addition(five, six)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(8))

print(evaluate(product))
```
