/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



open class Foo {
    public var dt: Int32 = 2
}

class Bar <: Foo {}

enum TimeUnit<T> Where T <: Foo {  
    Year(T)
}

main(): Int64 {
    let bar: Bar= Bar()
    let time = TimeUnit.Year(bar)
    return 0
}
// ASSERT: scan parse_expected_left_brace
