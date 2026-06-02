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
    public Data() {
    }
    public var b = Data()
}

struct Data2 {
    public var b = Data2()
}

func run(): Int64 {
    var value = Data()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_value_type_recursive
// ASSERT: scan sema_recursive_constructor_call
