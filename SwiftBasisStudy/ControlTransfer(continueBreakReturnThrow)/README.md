# 控制转移语句
## continue
continue语句告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
```
    let puzzleInput = "great minds think alike"

    var puzzleOutput = ""

    for character in puzzleInput.characters {

    switch character {
    case "a","e","i","o","u"," " :
    continue
    default :
    puzzleOutput.append(character)
    }
    }
    print(puzzleOutput)
```

## break
break语句会立刻结束整个控制流的执行。当你想要更早的结束一个switch代码块或者一个循环体时，你都可以使用break语句。
```
let numberSymbol :Character = "s"
var possibleIntegerValue: Int?

switch numberSymbol {
case "1","一" :
possibleIntegerValue = 1
case "2","二" :
possibleIntegerValue = 2
case "3","三" :
possibleIntegerValue = 3
default :
break
}

if let integerValue = possibleIntegerValue {
print("the integer value of \(numberSymbol) is \(integerValue).")
} else {
print("An integer value counld not found for \(numberSymbol).")
}
```
## fallthrough 跳到当前case的下一条
Swift 中的switch不会从上一个 case 分支落入到下一个 case 分支中。相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个switch代码块完成了它的执行。
使用 fallthrough 跳到当前case的下一条

```
let integerTodescribe = 5

var description = "the number \(integerTodescribe) is "

switch integerTodescribe {
case 2,3,5,7 :
description += "a prime number, and also "
fallthrough
case 4,6 :
description += "an "
fallthrough
default :
description += "integer"
}

print(description)
```

## 带标签的语句(labeled statements)
labeled statements 标记循环，然后在循环里面使用 break 跳出 ，continue 继续

```
    gameLoop: for i in 1...4 {
    if i == 3 {
    print(i)
    break gameLoop
    } else {
    print("ss")
    continue gameLoop
    }
    }
```

```
    var i = 2
    var case1 = 0
    var case11 = 0
    var case77 = 0
    var case99 = 0

    gameLoop: while ++i < 100 {

    switch i {
    case 1:
    i = 11
    case1 += 1
    case 11,22,33,44,55,66 :
    i += 11
    case11 += 1
    case 77:
    case77 += 1
    continue gameLoop
    case 99 :
    break gameLoop
    default :
    case99 += 1
    break
    }

    }

    print("\(case1)    \(case11)   \(case77)    \(case99)")
```

## 提前退出
像if语句一样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else分句，如果条件不为真则执行else分句中的代码。
```
func greet(person: [String: String]) {
guard let name = person["name"] else {
return
}
print("Hello \(name)")

guard let location = person["location"] else {
print("I hope the weather is nice near you.")
return
}
print("I hope the weather is nice in \(location).")
}
greet(["name": "John"])
// 输出 "Hello John!"
// 输出 "I hope the weather is nice near you."
greet(["name": "Jane", "location": "Cupertino"])
// 输出 "Hello Jane!"
// 输出 "I hope the weather is nice in Cupertino."

```

## 检测 API 可用性（available）

```
if #available(OSX 22, *) {
print("Use iOS API on iOS  ")
} else {
print("")
}
```