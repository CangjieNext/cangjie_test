/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func identity<T>(a: T) { // identity is a generic function
    return a
}

main(): Int64 {
    var b = identity
    var c = identity<Int32> // ok: Int32 is given as a type argument
    return 0
}
// ASSERT: scan sema_generic_func_without_type_arg
