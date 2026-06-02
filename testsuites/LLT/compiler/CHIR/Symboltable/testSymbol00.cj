// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

public var a: Int64 = 0

public class C2 <: C1 {
    public override func f() {
        a = 5
        super.f()
    }
}

public open class C1 {
    public open func f() {
        a = 3
    }
}
