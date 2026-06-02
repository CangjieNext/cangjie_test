/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class A {}

class B {}

class Data {
    var c = 0

    public init(a: A) {
    }
    public Data(let a!: A = A()) {
    }

    public init(b!: B = B()) {
        this.a = A()
    }

    public init() {
        this.a = A()
    }
}

func run(): Int64 {
    return Data(b: B()).c
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_overload_conflicts
