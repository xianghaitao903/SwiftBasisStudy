# 条件语句if 和 switch
## if
```
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 31 {
print("It is very cold ,consider wearing a scarf")
}
// if {} else {}
temperatureInFahrenheit = 42
if temperatureInFahrenheit <= 32 {
print("It is very cold, consider wearing a scraf")
} else {
print("It is not that cold ,wearing a t-shirt")
}

// if {} else if  {}  else {}
if temperatureInFahrenheit <= 32 {
print("It is very cold, consider wearing a scraf")
} else if temperatureInFahrenheit > 84 {
print("It is really warm, do not forget to wear a sunscreen ")
} else {
print("It is not that cold ,wearing a t-shirt")
}
```
## switch 
### 常规
```
let someCharacter :Character = "e"

switch someCharacter {
case "a","e","i","o","u" :
print("\(someCharacter) is vowel")

case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":

print("\(someCharacter) is a consonant")

default:
print("\(someCharacter) is not a vowel or a consonant")

}
```

### case为范围 
```
let approximateCount = 180

let countedThings = "moons orbiting Saturn"

var naturalCount :String

switch approximateCount {
case 0:
naturalCount = "no"
case 1..<5:
naturalCount = "a few"
case 5..<12:
naturalCount = "several"
case 12..<100:
naturalCount = "dozens of"
case 100..<1000:
naturalCount = "hundreds of"
default:
naturalCount = "many"

}

print("there are \(naturalCount) \(countedThings)")
```

### switch 通配

```
let point = (1,2)
switch point {
case (0,0):
print("the point \(point) is at the origin")
case (0,_):
print("the point \(point) is on the y-axis ")
case (_,0):
print("the point \(point) is on the x-axis")
case(-2...2,-2...2):
print("(\(point.0),\(point.1)) is inside the box")
default:
print("\(point) is outside of the box")
}
```

let 通配 (如果case 包括所有情况，那么不需要default)

```
let point2 = (2,0)

switch point {
case (0,let y):
print("\(point) is on the y-axis with a y value of \(y)")
case (let x,0):
print("\(point) is on the x-axis with an x value of \(x)")
case let (x,y):
print("\(point) is on somewhere else")

}
```
### case 后面加上where限制条件

```
let anotherPoint = (1,-1)

switch anotherPoint {
case let (x,y) where x == y:
print("\(anotherPoint) is on the line x==y")
case let(x,y) where x == -y:
print("\(anotherPoint) is on the line x==-y")
case let (x,y):
print("\(anotherPoint) is just some arbtrary point")
}
```