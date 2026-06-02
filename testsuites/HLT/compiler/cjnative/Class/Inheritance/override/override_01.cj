/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return 0
}

open class Father {}

class Child <: Father {}

open class C1 {
    public open func f() {}
    public open func f1(): Father {
        Father()
    }
}

interface I {
    func f() {}
}

class C2 <: C1 & I {
    public override func f() {}
    public override func f1(): Child {
        Child()
    }
}
