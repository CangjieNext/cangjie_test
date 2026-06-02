let a: Int64 = 3
class A {
    var _d: Int64 = 100
    mut prop d: Int64 {
        get() { _d }
        set(a) { _d = a }
    }
}
main(): Int64 {
    let obj = A()
    obj.d = 0
    return obj.d
}

struct B {
    static mut prop f: Int32 {
        get() {0}
        set(h21) {}
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
