/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1{
    AB
    static func func1(){
        0
    }
    static func func2(a:Int64){
        a
    }
}

main() {
    var f1 = Option<()->Int64>.Some(E1.func1)
    var f2 = Option<()->Int64>.None
    var f3 = Option<(Int64)->Int64>.Some(E1.func2)
    var f4 = Option<(Int64)->Int64>.None
    var r1 = f1?()
    var r2 = f2?()
    var r3 = f3?(1)
    var r4 = f4?(1)
    0
}
