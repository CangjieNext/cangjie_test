abstract class A {
    public func foo(): Int64
}
open class B <: A {
    public override func foo(): Int64 { 0 }
}
main(): Int64 {
    return B().foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
