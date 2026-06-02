/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

struct Data {
    public Data(let a!: Int32) {
    }

    public init(a: Int32) {
    }
}

func run(): Int64 {
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_overload_conflicts
