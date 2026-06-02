/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct T {
	var a:Int32
	init(){
		a = 10
	}
	func getA(){
		return a
	}
}


class C {
        var a:Int32
        init(){
                a = 11
        }
        func getA(){
                return a
        }
}

main():Int64
{
	var b = T()
	var b_2 = C()
	return 0
}
