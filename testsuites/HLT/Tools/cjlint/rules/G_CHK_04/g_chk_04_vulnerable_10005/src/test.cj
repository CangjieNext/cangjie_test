import std.regex.*

interface A{
	func foo(){
		let REGEX_PATTER: Regex = Regex("^([A-Za-z]|[A-Za-z][0-9]*|[0-9]*[A-Za-z])+$")
    REGEX_PATTER.matcher("").fullMatch()
	}
}
main(): Int64 {
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
