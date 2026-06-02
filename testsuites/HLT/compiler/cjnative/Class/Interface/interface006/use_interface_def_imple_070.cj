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

public interface MyInterface<T> {
    mut func foo1(): Int32
    mut func foo2(): Int32 {
        foo1()
    }
    prop b: Int64 {
        get() {
            1
        }
    }
}

extend Int16 <: MyInterface<UInt64> {
    public func foo1(): Int32 {
        1
    }
}

main() {
    var s1: Int16 = 10
    var s2: MyInterface<UInt64> = Int16(10)

    if (s2.foo2() == 1 && s1.foo2() == 1 && s1.b == 1 && s2.b == 1) {
        return 0
    } else {
        return 1
    }
}
