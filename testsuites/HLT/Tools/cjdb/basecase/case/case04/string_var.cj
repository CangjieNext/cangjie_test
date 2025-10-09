/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public struct structR1{
    public var width:Int64 = 12
    private var length:String = "test"
}

class testC1{
	var class_var1 = 100
	var class_var2 = "测试"
	var class_var3 = 'C'
}

main(){
	var test_C1 = testC1()
	var struct_R1 = structR1()
	return 0
}
