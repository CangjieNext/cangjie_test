// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//测试enum同名
enum A {
    | temp
    | eric
    | tom
    | R
}

enum E {
    | f1(Int64)
    | f2(Int64, Int64)
    | A
    | B
    | C
    | D
    | F
    | Point2D
}


//测试function同名
func f2(a: Int64, b: Int64) {}

//测试变量同名
let temp: Int64 = 20
var eric: Int64 = 20

main() {

	return 0
}
