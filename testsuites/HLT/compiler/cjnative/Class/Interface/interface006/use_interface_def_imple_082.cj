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

public interface faterInterface<T> {
    func foo1(): T
    func foo2(a!: T): T {
        a
    }
    func foo3(): T
}

public interface MyInterface <: faterInterface<String> {}

extend Rune <: MyInterface {
    public func foo(): String {
        "char"
    }

    public func foo3(): String {
        foo1()
    }

    public func foo1(): String {
        foo2(a: foo())
    }
}

main() {
    var c1: faterInterface<String> = r'f'
    var c2: MyInterface = r's'
    var c3: Rune = r'c'

    if (c1.foo1() == "char" && c1.foo2(a: "父接口") == "父接口" && c1.foo3() == "char") {
        if (c2.foo1() == "char" && c2.foo2(a: "子接口") == "子接口" && c2.foo3() == "char") {
            if (c3.foo1() == "char" && c3.foo2(a: "Rune") == "Rune" && c3.foo3() == "char") {
                return 0
            }
        }
    }
    return 1
}
