/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A1 {
    func foo<T>(a: T) {
        a
    }
}

extend A1 {
    func coo<T>(a: T) {
        a
    }
}

main(){
    var aa = A1()
    let bb : UInt16 = 4
    var cc = aa.coo(bb)
    0
}
