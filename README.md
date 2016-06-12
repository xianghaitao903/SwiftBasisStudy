# SwiftBasisStudy
study swift
##Array 
###初始化
	var arr: [String] = ["a","bc"];
	var arr: Array<String> = ["a","b"];
	var arr = ["",""];
	var arr = [String]();
	var arr = [String](count: 3, repeatedValue: 0.0)
	var arr = Array(count 4, repeatedValue: 3);  
	var arr[5] = "aa";   //异常
	arr.append("aa"); 可以
###方法
	arr.append("11");
	arr.isEmpty
	arr += ["aa","bb"];
	arr[2...4] = ["1","2","4","3"];
	arr.insert("xxx", atIndex: 0);
	var removeString = arr.removeAtIndex(2);
	for item in arr {
	
	}
##Dictionary
###初始化
	var dict = [Int: String]();
	var dict: Dictionary<String, String> = [:];
	var dict: [String: String] = ["xxx": "yyy"];
	//增加或修改值
	dict["xxx"] = "xxx";
###方法
####是否为空
	dict.isEmpty
####更新值
	if let oldVale = dict.updateValue("xxx", forKey: "xxx") {
		print("dict update value for key xxx");
	} else {
		print("dict add value for key xxx");
	}	
####移除key
	dict["xxx"] = nil;
	dict.removeValueForKey("xxx")
	if let oldValue = dict.removeValueForKey("xxx") {
		print("the \(oldValue) is removed from Dictionary");
	} else {
		print("the Key xxx is not exists");
	}
####遍历
	for (key,value) in dict {
		print("\(key):\(value)");
	}
	
	for key in dict.keys {
		print(key);
	}
	
	for value in dict.values {
		print(value);
	}
	
 
	
	