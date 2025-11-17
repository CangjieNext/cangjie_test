/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E<T> {
    A | B(Int64,T) | C(T) | ...
    func name(a:T) {
        return a
    }
}

main(){
    var a1 = E<Int64>.A.name
    var a2 = E<Bool>.B(1,true).name(false)
    var a3 = C(1).name(4)
    0
}
