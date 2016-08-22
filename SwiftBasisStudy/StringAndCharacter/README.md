# 字符串(String)和字符(Character)

## 基本操作
### 初始化空String
```
    var emptyString = ""

    var anotherEmptyString = String()

    if emptyString.isEmpty && anotherEmptyString.isEmpty {
    //print("emptyString and anotherEmptyString are both empty")
    }
```

###  遍历String 中的Character

```
var variableString = "horse"

variableString += " and carriage😵"

for character in variableString.characters {
//print(character)
}
```
### 通过Character 数组初始化String

```
let characters :[Character] = ["a"," ","d","o","g"," ","i","s"," ","l","i","k","e"," ","🐕"]

let myString = String(characters)

//print(myString)
```

### 在String后面append一个字符

```
  let exclamationMark :Character = "🌳"

  variableString.append(exclamationMark)


```
### 在String后面appendContentOf 一个String
```
  variableString.appendContentsOf("ssss")
  variableString += "ss";
  //print(variableString)
```

### 不同类型的数据拼接成String
```
let multiplier = 3

var message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//print(message)

var message2 = String(multiplier) + " times 2.5 is " + String(Double(multiplier) * 2.5)

//print(message2)
```

## String中的特殊字符
```
var unicodeString = "\\0 is \0 sss \\n is \n \\t is \t  \" \'  \u{24} "

//print(unicodeString)

var word = "12334"

//print(word.characters.count)

let line :Character = "\n"

word.append(line)

//print("\(word) count is \(word.characters.count)")
```

## 获取String特定位置的Character

### startIndex 开始位置 ，
```
let greeting = "Guten Tag!"

//print(greeting[greeting.startIndex])
```
### predecessor() 后移一位 ，
```
//endIndex   后移一位才是最后一位字符串
//print(greeting[greeting.endIndex.predecessor()])
```

### successor()前移一位
```
//print(greeting[greeting.startIndex.successor()]);
```

###  advancedBy() 偏移多位
```
//从最开始偏移七个位置，是第8位
let location = greeting.startIndex.advancedBy(7)

//print("\(greeting)======\(greeting[location])")
```

###  通过位置遍历
```
for index in greeting.characters.indices {
//print("\(greeting[index])   ", terminator: "")
}
```
##  特定位置插入或者移除字符
```
var welcome = "hellow"
```
### 插入字符
```
welcome.insert("!", atIndex: welcome.endIndex)

//print(welcome)
```
### 插入字符串
```
welcome.insertContentsOf(" everyone".characters, at: welcome.endIndex.predecessor())
//print(welcome)
```
### 移除字符
```
welcome.removeAtIndex(welcome.endIndex.predecessor())

//print(welcome)
```
### 移除特定位置的字符串
```
welcome.removeRange(welcome.endIndex.advancedBy(-6)..<welcome.endIndex)

//print(welcome)
```

/###  截取字符串
```
var newSubstring = welcome.substringFromIndex(welcome.startIndex.advancedBy(1))

//print(newSubstring);

welcome = "\(welcome) sss PPPP ssss"
//rangeOfString(" ")获取的是字符串中第一个空格的位置
let range = welcome.rangeOfString(" ")
//print("\(welcome) range ===  \(range!) ")

let range2 = Range(start: welcome.startIndex, end: welcome.endIndex.predecessor())

//print("rang2 = \(range2)")

newSubstring = welcome.substringToIndex(welcome.startIndex.advancedBy(5))
//print(newSubstring)

newSubstring = welcome.substringWithRange(range2)
//print(newSubstring)

let subArr = welcome.componentsSeparatedByString(" ")
//print(subArr)

let replaceString = welcome.stringByReplacingOccurrencesOfString(" ", withString: "  ")
//print("replaceString = \(replaceString)")
```

## 前缀与后缀hasPrefix(),hasSuffix()
```
var prefixAndsuffixArr = [
"AAA BBB end cell",
"AAA BBB start cell2",
"CCC BBB start2 cell",
"CCC BBB start3 cell",
"AAA BBB start4 cell1"
]
var prefixCount:Int = 0
var suffixCount:Int = 0

for items in prefixAndsuffixArr {
if items.hasPrefix("AAA BBB"){
//print(items)
prefixCount++
}
if items.hasSuffix(" cell"){
//print(items)
suffixCount++
}
}

//print("prefixAndSuffixArr has \(prefixCount) items like \"AAA BBB***\" and \(suffixCount) items like \"**** cell\"");
```
## 字符串的 unicode 表示形式

```
let dogString = "dog!🐶"

for codeUnit in dogString.utf8 {
//print("codeUnit :\(codeUnit)",terminator: "     ")
}
```

