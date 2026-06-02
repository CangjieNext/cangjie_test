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

public open class Base {
    public open func f() {
        return 1
    }
}

public open class child1 <: Base {
    public func f1() {
        return 2
    }
}

public open class child2 <: child1 {
    public override func f() {
        return 3
    }
}

main(): Int64 {
    var obj: child2 = child2()
    if (obj.f() != 3) {
        return 1
    }

    return 0
}
