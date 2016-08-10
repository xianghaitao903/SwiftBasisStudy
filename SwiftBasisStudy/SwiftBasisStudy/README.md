#Swift 基础

语句结束可以不加  ;

## 变量与常量
常量声明用 let;变量申明用 var 
例：

``` 
  var a = 10;
  let b = 20;
  var c = 0, d = 100;
```

## 可选类型
当一个值可以为nil 时，那么它就是可选类型
非可选的常量或者变量不可以赋值nil;

### 定义
```
  var a :Int = Int("123");
  a = nil;
  var b :String?; //默认为nil
  b = "sccc"
```
### nil 
Objective-C 中的nil指向一个不存在对象的指针，swift 中的nil表示值缺失，任何可选类型都可以赋值nil，不只有对象

### 解析

#### if 强制解析
```
  var a :String?;
  if a == nil {
 
  } else if a != nil {

  }
```
#### 可选绑定
使用可选绑定来判断可选类型是否包含值，如果包含就赋值给一个常量或者变量，可选绑定可以在if 或者while 语句中

```
var a :String?;
if let c = a {
  print(c);
} else {

}

#### 隐式解析
部位nil 时后面加 ! 表示有值,并使用它。

```
  var a :String? = "ssss"
  print(a); // Optional("ssss")
  print(a!);// ssss   a 为nil 会cash
  print(a ?? "xxx")  //如果a 为nil 则使用后面的值，不为nil则为 a 的值
  a = nil;
  print(a ?? "xxx")

```

## 类型标注
类型可以不写，编译器可以自动根据值来判断数据的类型，也可以加上，加上时语法如下

```
  var a :Int = 10;
  let b :String = "hello swift";
  var c,d,e :String;  //多个相通类型

```

## 注释

```
  //  单行注释
  /* 多行注释 */

  /* 多行注释中嵌套多行注释 
    /* */
  */

```
文件中分区注释
  //MARK: -   相当于Objective-C 中的 #pragma mark - 
  //MARK:     相当于Objective-C 中的 #pragma mark

## 数值型字面量

* 十进制没有前缀
* 二进制数前缀是0b
* 八进制数前缀是0o
* 十六进制数前缀是0x

数值字面量可以包含额外的0或者下划线，不影响字面量的值

```
  let a = 000123.7 // 123.7
  let b = 1_000_000 // 1000000
  let c = 1_000_000.000_000_1 // 1000000.0000001
```

## 类型转换

``` 
    let string :String = "1234";
    let a :Int? = Int(string);
    let s :String = "\(a)"

```

## 类型别名
typealias 给现有的类型定义另一个名字

```
  typealias AudioSample = UInt16;
  print(AudioSample.min);
```

## 布尔值
Bool  true false 

```
  let a :Bool = true;

```

## 元组
把多个值组合为一个符合值
访问形式如下：

```
  let a = (404,"Not Found");
  let (statusCode, statusMessage) = a;
  print("http Code \(statusCode) means \(statusMessage)")
  print("http Code \(a.0) means \(a.1)")
  
  let b = (statusCode :200, description: "OK");
  print("http Code \(b.statusCode) means \(b.description)")
  
```

## 断言
不满足条件时断言会执行，产生cash 并输出断言信息

```
  let age = -3
  assert(age >= 0, "A person's age cannot be less than zero")
  assert(age < 200, "A person's age cannot be more than 200")

```

