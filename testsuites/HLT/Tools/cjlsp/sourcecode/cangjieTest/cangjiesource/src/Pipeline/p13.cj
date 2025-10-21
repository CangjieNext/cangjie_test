/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

//mut函数
struct R13{
    mut func f13(a:Int64) {}
}

extend R13 {
    mut func f13_1(a:Int64) {}
}

interface I13 {
    mut func f13_2(a:Int64) {}
}


func test13() {
    var ii1:Int64 = 1
    var ii2 = R13()

    var re1 = ii1 |> ii2.f13
    var re2 = ii1 |> ii2.f13_1
}
