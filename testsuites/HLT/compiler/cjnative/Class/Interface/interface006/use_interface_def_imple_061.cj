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

public interface fatherInterface {
    func foo1(): String
    func foo2(a!: String): String {
        foo1()
    }
}

interface MyInterface <: fatherInterface {
    func foo2(a!: String): String {
        foo1() + foo1()
    }
}

enum en<T> <: MyInterface {
    A

    public func foo1(): String {
        "enum"
    }
}

main() {
    var en1: String = en<Int8>.A.foo2(a: en<Int8>.A.foo1())
    if (en1 == "enumenum") {
        return 0
    } else {
        return 1
    }
}
