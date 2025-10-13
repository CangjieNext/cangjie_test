open class A {
    func foo(a: Int64) {1}
}

open class B <: A {
    func foo(a: Int32) {0}
}

main() {
    B().foo(1)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
