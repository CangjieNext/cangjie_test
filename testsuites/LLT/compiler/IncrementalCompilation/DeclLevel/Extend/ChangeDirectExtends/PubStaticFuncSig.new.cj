class A {}
extend A {
    public static func foo(a: Int64): Int64 {Int64(a)+1}
}

main() {
    A.foo(1)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
