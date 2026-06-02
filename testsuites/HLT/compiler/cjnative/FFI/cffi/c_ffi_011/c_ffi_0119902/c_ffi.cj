/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func add_func0(a: Int8, b: Int8): Int8 {
    return a + b
}

@C
func add_func1(a: Unit): Unit {
    add_func0(1, 2)
}

@C
func add_func2(a: Unit, b: Unit): Unit {
    add_func0(3, 4)
}

@C
func add_func3(a: Unit, b: Unit, c: Unit): Unit {
    add_func0(5, 6)
}

main() {}
// ASSERT: scan sema_cfunc_cannot_have_unit_args
