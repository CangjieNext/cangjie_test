/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


interface A{
let a = {  => }
static func i(input:()->Unit=a):Unit{input()}
static func test(input:(()->Unit)->Unit=i):Unit{input()}
}

class B{
static var a = {  => }
static func i(input:()->Unit=a):Unit{input()}
static func test(input:(()->Unit)->Unit=i):Unit{input()}
}

abstract class C{
static var a = {  => }
static func i(input:()->Unit=a):Unit{input()}
static func test(input:(()->Unit)->Unit=i):Unit{input()}
}

main(){
return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_dot_lparen
