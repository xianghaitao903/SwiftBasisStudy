#Array 
数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。

## 数组初始化
```
var StringArr: [String] = ["123","456","abc"];

var StringArr2: Array<String> = ["abe","a","c"];

var StringArr3 = ["","","",];

var someInts = [Int]();
someInts.append(3);

someInts = []

var threeDouble = [Double](count: 3, repeatedValue: 0.0)

//print(threeDouble)
```
## 增加元素
```
threeDouble.append(0.4);

//var aaa =  threeDouble[6]

//print(threeDouble)

var foreInt = Array(count: 4, repeatedValue: 3)
//foreInt[5] = 10; cash
foreInt.append(6);
```

## 数组声明
```
var intArr: [Int];

var doubleArr: [Double];

var floatArr: [Float];

var dictionary: Array<Dictionary<String,String>>;

var dictionary2: [Dictionary<String,Int>];

var StringArrLength = StringArr.count;

if StringArr.isEmpty {
//print("StringArr is Empty")
} else {
//print("StringArr is not Empty");
}
```
## 修改元素的方法
### 增加元素
```
StringArr.append("789");

//print("StringArr's length is \(StringArrLength) before append a item and is \(StringArr.count) after append")

StringArr += ["111","67"];

//print(StringArr);

var firstItem = StringArr[0];
```

## 修改单个元素
```
StringArr[0] = "1"

//print(StringArr);
```
## 批量修改区间段的元素
```
StringArr[2...4] = ["1","4","4","5"]

//print(StringArr)
```
## 特定位置插入
```
StringArr.insert("xxx", atIndex: 0)

//print(StringArr)
```
## 特定位置移出
```
let removeString = StringArr.removeAtIndex(2);

//print("After remove \(removeString) new Arr is \(StringArr)" )

```
## Array 是值类型  

```
var newArr = StringArr

//print("newArr is \(newArr)")

StringArr[0...3] = ["23"]

//print("while StringArr changed, newArr is \(newArr)")

// 另一种方式测试

var oldArray = [Int]();

var newArray = oldArray;

//print(newArray)

oldArray.append(4);

//print("newArray === \(newArray)  old Arr === \(oldArray)")
```


## Array遍历
```
for items in StringArr {
//print(items);
}

for (index,value) in StringArr.enumerate() {
//print("the value is \(value) at the index \(index) of StringArr");
}


var arr :Array<Int> = [12,12,111];

print("\(arr[0])");
```
