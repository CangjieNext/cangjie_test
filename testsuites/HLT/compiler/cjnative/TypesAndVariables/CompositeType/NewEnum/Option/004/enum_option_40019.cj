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

class A {
    public var x = 1
}

class B {
    public var x: A = A()
}

class C {
    public var x: B = B()
}

main(): Int64 {
    let c = C()
    let c1: ?C = C()
    let r1: ?A = c1?.x.x
    return 0
}
