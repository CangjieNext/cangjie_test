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

class ChildChild <: Child {
    init() {
        super()
    }
}

main(): Int64 {
    let bar: (Father, Child) = (Child(), ChildChild())
    if (bar is (Child, ChildChild)) {
        return 0
    } else {
        return 1
    }
}
