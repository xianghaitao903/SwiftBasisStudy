# 闭包（Closures）

## sort 方法（The Sort Method）
```
var arr = ["Chirs","Ewa","Alex","Barry","Daniella"]

func backWards(s1: String, _ s2: String) -> Bool {
return s1 > s2
}

print("arr == \(arr)")
var reversed = arr.sort(backWards)
print(reversed)

arr = arr.sort()
print("arr == \(arr)")
```
## 闭包表达式语法（Closure Expression Syntax）
```
{ (parameters) -> returnType in
statements
}
```
```
reversed = arr.sort({(s1: String, s2: String) -> Bool in  return s1 > s2})
print(reversed)
```
## 根据上下文推断类型（Inferring Type From Context）

因为排序闭包函数是作为sort(_:)方法的参数传入的，Swift 可以推断其参数和返回值的类型。sort(_:)方法被一个字符串数组调用，因此其参数必须是(String, String) -> Bool类型的函数。这意味着(String, String)和Bool类型并不需要作为闭包表达式定义的一部分。因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：

```
arr = arr.sort()
print("arr == \(arr)")
reversed = arr.sort({s1, s2 -> Bool in return s1 > s2})
print(reversed)
```

## 单表达式闭包隐式返回（Implicit Return From Single-Expression Clossures）

单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：

```
reversed = names.sort( { s1, s2 in s1 > s2 } )
```

## 参数名称缩写（Shorthand Argument Names）

```
print("arr == \(arr)")
reversed = arr.sort({$0 > $1})
print(reversed)

```



## 尾随闭包(Trailing Closure)
果您需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用：

```
func someFunctionThatTakesAclosure (closure: () -> Void) {

}

someFunctionThatTakesAclosure { () -> Void in
//    <#code#>
//print("123")
}

someFunctionThatTakesAclosure(){
//    code
print(456)
}

let digitNames = [0: "zero", 1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"]

let numbers = [16, 58, 150]

let string = numbers.map {
(var number) -> String in
var output = ""
while number > 0 {
output = digitNames[number % 10]! + output;
number /= 10
}
return output
}

//print(string)
```

## 捕获值（Capturing Values）

闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。

Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。

举个例子，这有一个叫做makeIncrementor的函数，其包含了一个叫做incrementor的嵌套函数。嵌套函数incrementor()从上下文中捕获了两个值，runningTotal和amount。捕获这些值之后，makeIncrementor将incrementor作为闭包返回。每次调用incrementor时，其会以amount作为增量增加runningTotal的值。

```
func makeIncrementer(forIncrementer amount: Int) -> () -> Int {
var runningTotal = 0
func inCrementer() -> Int {
runningTotal += amount
return runningTotal
}

return inCrementer
}

let incrementByTen = makeIncrementer(forIncrementer: 10)

print(incrementByTen()) // 10

print(incrementByTen()) //20

let incrementBySeven = makeIncrementer(forIncrementer: 7)

print(incrementBySeven()) // 7

print(incrementBySeven()) //14

// 闭包是引用类型（Closures Are Reference Types）

let alsoIncrementByTen = incrementByTen

print(alsoIncrementByTen()) //30
```

## 非逃逸闭包(Nonescaping Closures)
当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注@noescape，用来指明这个闭包是不允许“逃逸”出这个函数的。
```
func someFunctionWithNoescapeClosure(@noescape closure: () -> Void) {
closure() // closure 不能到函数的外面执行
}

```
逃逸闭包
可以函数外执行
```
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
completionHandlers.append(completionHandler)
}

 // completionHandlers.first!(); 函数外调用
class SomeClass {
var x = 10
func doSomething() {
someFunctionWithEscapingClosure { self.x = 100 }
someFunctionWithNoescapeClosure { x = 200 }
}
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// prints "200"

completionHandlers.first?()
print(instance.x)
// prints "100"

```

## 自动闭包（Autoclosures）
动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。只能够在内部执行，不能escape到外面
```
var customersInline = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let customerProvider = {customersInline.removeAtIndex(0)}

print(customersInline.count)

print(customerProvider())

print(customersInline.count)

func serverCustomer (customer: () -> String) {
print("Now serving \(customer())!")
}

serverCustomer( {customersInline.removeAtIndex(0)} )

print("customersInline == \(customersInline)")

var mycustomer: () -> String = ({return ""})

func serverCustomerAuto(@autoclosure customer: () -> String) {
print("Now serving \(customer())!")
//  mycustomer = customer //此句会报错  customer不能够跑到外面去执行
}

serverCustomerAuto( customersInline.removeAtIndex(0) )

print("customersInline == \(customersInline)")
```

如果你想让这个闭包可以“逃逸”，则应该使用@autoclosure(escaping)特性.

```
func serverCustomerAutoEscaping(@autoclosure(escaping) customer: () -> String) {
print("Now serving \(customer())!")
mycustomer = customer // customer能够跑到外面去执行
}

serverCustomerAutoEscaping(customersInline.removeAtIndex(0))

print("\(mycustomer())")
```

