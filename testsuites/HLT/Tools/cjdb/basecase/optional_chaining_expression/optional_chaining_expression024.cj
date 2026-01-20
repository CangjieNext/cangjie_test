/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1<T>{
    func func1<T>(a:T){
        a
    }
}

main() {
    var f1 = Option<(Int64)->Int64>.Some(C1<Int64>().func1<Int64>)
    var f2 = Option<(Int64)->Int64>.None
    var f3 = Option<(String)->String>.Some(C1<String>().func1<String>)
    var f4 = Option<(String)->String>.None

    var r1 = f1?(1)
    var r2 = f2?(1)
    var r3 = f3?("fff")
    var r4 = f4?("aaa")
    0
}
