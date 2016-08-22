# Class and Structures

类和结构体是人们构建代码所用的一种通用且灵活的构造体。我们可以使用完全相同的语法规则来为类和结构体定义属性（常量、变量）和添加方法，从而扩展类和结构体的功能。
Swift 并不要求你为自定义类和结构去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类或者结构体，系统将会自动生成面向其它代码的外部接口。

## 类和结构体对比
### 相同点：
* 定义属性用于存储值
* 定义方法用于提供功能
* 定义下标操作使得可以通过下标语法来访问实例所包含的值
* 定义构造器用于生成初始化值
* 通过扩展以增加默认实现的功能
* 实现协议以提供某种标准功能

### 与结构体相比，类还有如下的附加功能：
* 继承允许一个类继承另一个类的特征
* 类型转换允许在运行时检查和解释一个类实例的类型
* 析构器允许一个类实例释放任何其所被分配的资源
* 引用计数允许对一个类的多次引用

## 定义语法
> 注意

> 在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。因此请使用UpperCamelCase这种方式来命名（如SomeClass和SomeStructure等），以便符合标准 Swift 类型的大写命名风格（如String，Int和Bool）。相反的，请使用lowerCamelCase这种方式为属性和方法命名（如framerate和incrementCount），以便和类型名区分。
```
class SomeClass {
//    
}

struct someStructures {
//    
}

struct Resolution {
var width = 100.0
var height = 150.0
}

class VidoModel {
var resolution = Resolution()
var interlaced = false
var frameRate = 0.0
var name: String?
}
``` 

## 类和结构体实例
esolution结构体和VideoMode类的定义仅描述了什么是Resolution和VideoMode。它们并没有描述一个特定的分辨率（resolution）或者视频模式（video mode）。为了描述一个特定的分辨率或者视频模式，我们需要生成一个它们的实例。
```
var someResolution = Resolution()

let someVidoModel = VidoModel()

print("the width of someResolution's width = \(someResolution.width)")
```

## 属性访问
```
someVidoModel.resolution = someResolution

someVidoModel.name = "haha";
print(someVidoModel.name)

someResolution.width = 110

print("the width of someResolution's width = \(someResolution.width)")

print("someVidoModel.resolution.with is \(someVidoModel.resolution.width)")
```

## 结构体类型的成员逐一构造器
```
let vgo = Resolution(width: 110.0, height: 200.0)

//MARK: structures and Enumerations are value type（赋值给另一个变量或者常量时是copy类型的)

var anotherResolution = someResolution

someResolution.width = 2000.0

print("anotherResolution.width is \(anotherResolution.width)")
```

## 值类型 与引用类型
* 结构体和枚举是值类型
值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。

在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。

在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。

* 类是引用类型
与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。


```
let anotherVidoModel = someVidoModel
print("anotherVidoMpdel.frameRate is \(anotherVidoModel.frameRate)")

someVidoModel.frameRate = 1.0

print("anotherVidoMpdel.frameRate is \(anotherVidoModel.frameRate)")
```


```
## 恒等运算符
因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）

如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
* ===   等价于
* !===  不等价于
运用这两个运算符检测两个常量或者变量是否引用同一个实例：

if someVidoModel === anotherVidoModel {
print("some and anotherVidoModel are the same class")
}

//if someVidoModel == anotherVidoModel {   //报错
//    print("there")
//}


//let vido = VidoModel()
```
请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：

* “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
* “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。

## 类和结构体的选择
结构体实例总是通过值传递，类实例总是通过引用传递。这意味两者适用不同的任务。当你在考虑一个工程项目的数据结构和功能的时候，你需要决定每个数据结构是定义成类还是结构体。

按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
* 该数据结构的主要目的是用来封装少量相关简单数据值。
* 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
* 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
* 该数据结构不需要去继承另一个既有类型的属性或者行为。

举例来说，以下情境中适合使用结构体：
* 几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
* 一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
* 三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
* 在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。

## 字符串(String)、数组(Array)、和字典(Dictionary)类型的赋值与复制行为
Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。

Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
