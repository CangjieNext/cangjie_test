struct A {}
interface I1 {}

extend A <: I1 {
    public static mut prop k: Int64 {
        get() {1}
        set(v) {println(v)}
    }
}

extend A {}

main() {
    A.k = 3
    A.k
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
