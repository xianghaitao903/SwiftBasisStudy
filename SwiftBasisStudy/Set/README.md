#Set

集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。

##初始化

```
  var letters = Set<Character>()
  var letters_2 :Set<Character> = ["a","b","c","a"];//重复的会自动合并
  letters.insert("a")
  letters.insert("a");//letters 中只有一个元素
  //letters = [] 后letters 为空
  letters = [];
```

## 访问修改集合

```
  var set :Set<String> = ["abc","def","ghi"];
  //  set 的总数
  let count = set.count;
  //  set 是否为空
  if set.isEmpty {

  }

  //  插入一个元素
  set.insert("ab");
  
  //移除一个元素  存在返回移除元素的值，不存在返回nil
  let removeItem = set.remove("Rock");
  
```

## 遍历集合

```
  for genre in set {

  }

  for genre in set.sort() {

  }
```

## 集合操作
```
    var a :Set = ["aaa","bbb","ccc"]
    var c :Set = ["bbb","ccc","ddd"]

    //  公共部分
    var d = a.intersect(c)

    // 相加后去掉公共的部分
    var e = a.exclusiveOr(c)

    // 相加的所有元素
    var f = a.union(c)
    
    //  a 去掉 a 与c 的公共元素后的部分
    var g = a.subtract(c)
```

## 集合关系
```
    let oddDigist :Set = [1,2,3,4];

    let evenDigist :Set = [1,2,3,4,5,6,7]

    let singelDigist :Set = [5,6,7]

    let sameDigist :Set = [4,3,2,1]

    let oneSet :Set = [6,5]

    if oddDigist == sameDigist {
    print("oddDigist and sameDigist contain all of the same values")
    }

    if oddDigist.isSubsetOf(evenDigist) {
    print("all the Values of oddDigist are contained by evenDigist")
    }

    if evenDigist.isSupersetOf(singelDigist) {
    print("evenDigist contains all the values that singelDigist contains")
    }

    if sameDigist.isStrictSubsetOf(oddDigist) {
    print("sameDigist is subsetof oddDigist but not equal to oddDigist")
    }

    if oneSet.isDisjointWith(oddDigist) {
    print("oneSet and oddDigist have no values in common")
    }
```


