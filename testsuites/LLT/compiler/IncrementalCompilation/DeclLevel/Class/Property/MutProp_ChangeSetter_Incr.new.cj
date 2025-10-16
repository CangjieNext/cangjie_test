class A {
    private var _d: Int64 = 10
    mut prop d: Int64 {
        get() { _d }
        set(v) { _d = v + 1 }
    }
}
main(): Int64 {
    let a = A()
    a.d = 2
    return a.d
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
