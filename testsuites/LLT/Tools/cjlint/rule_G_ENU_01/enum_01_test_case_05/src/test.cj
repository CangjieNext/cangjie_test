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

//测试interface同名
interface B {
    mut func increase(): Unit
}

//测试struct同名
struct R <: B {
    var item = 0
    public mut func increase(): Unit {
        item += 1
    }
}

main() {

	return 0
}
