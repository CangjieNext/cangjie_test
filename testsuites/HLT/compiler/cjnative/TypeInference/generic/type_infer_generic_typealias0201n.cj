/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type A2<T> = Foo<T>

func Foo<T>(x: Array<T>): Array<T> {
    var a = x
    return a
}

func run(): Int64 {
    var a: A2<Int64>
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_not_a_type
