/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:0 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Father {
    init() {}
}

open class Child <: Father {}

class ChildChild <: Child {}

func f1(a: Father): ChildChild {
    return ChildChild()
}

func f2(a: Child): Child {
    return Child()
}

func f3(a: Child): Child {
    return Child()
}

main(): Int64 {
    let foo1: (Father) -> Child = f1
    let foo2: (ChildChild) -> Child = f2
    let foo3: (ChildChild) -> Father = f3
    if ((foo1 is (Father) -> ChildChild) && (foo2 is (Child) -> Child) && (foo3 is (Child) -> Child)) {
        return 0
    } else {
        return 1
    }
}
