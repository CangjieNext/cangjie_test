class A<T> {
    mut prop f: Int32 {
        get() {0}
        set(v1) {}
    }
}

struct B {
    static mut prop f: Int32 {
        get() {0}
        set(h21) {}
    }
}

extend B {
    mut prop g: (Int32,Int32) {
        get() {(1,2)}
        set(d) {}
    }
}

interface C {
    mut prop f: ?Int32 {
        get() {Some(3)}
        set(r2) {}
    }
}

main(): Unit {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
