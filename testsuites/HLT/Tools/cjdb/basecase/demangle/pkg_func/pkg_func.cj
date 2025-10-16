/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_func


public enum test_TimeUnit1_func<T> {
    Year(T) | Month(T)
}

public func funcUnit():Unit{}

public func returnUnit():Unit{ return }

public func addSelf(): Unit{
	// 自增表达式
	var num = 0
	num ++
}

public func subSelf(): Unit{
	// 自减表达式
	var num = 0
	num --
}

public func assign(): Unit{
	// 赋值表达式
	var num = 0
}

public func parameterUnit(para_unit:Unit): Unit{
	// unit类型作为方法入参
	return para_unit
}

public func def_parameter_unit(default_para!:Unit =()): Unit{
	// unit类型作为形参默认值
	var unit_in_func = ()
	return default_para
}

public func def_parameter_string(string_para:String,default_para!:String ="您好，cangjie"):String{
	// string类型作为方法入参及形参默认值
	return string_para+default_para
}

public func defparameterstring(string_para:String,default_para!:String ="您好，cangjie"):String{
	// string类型作为方法入参及形参默认值
	return string_para+default_para
}


public func returnString():String{
	var test_string = "仓颉调试器插件测试\n"
	return test_string+test_string
}

public func inputString(input_s:String):String{
	return input_s+input_s
}

public func enumInFunc(): test_TimeUnit1_func<String>{
	let enum_func = test_TimeUnit1_func<String>.Year("你好，cangjie。")
	return enum_func
}






