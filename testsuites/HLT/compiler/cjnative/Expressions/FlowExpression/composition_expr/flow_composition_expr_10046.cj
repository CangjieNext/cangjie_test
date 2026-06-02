/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class B {
    public operator func ()(input: B) {}
}

open class C {
    public var a = B()
}

class A <: C {
    public func test() {
        super.a |> super.a
    }
}

main(): Int64 {
    A().test()
    return 0
}
