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
    public var dt: Int32 = 1
}

class Bar <: Foo {
    public var dt: Int32 = 2
}

enum TimeUnit<T> {
    Year(T) | Month(T)
}

var foo: Foo = Foo()
var bar: Bar = Bar()
var time = TimeUnit<Bar>.Year(foo)
var res1: Int32 = match (time) {
    case Year(x) => x.dt
    case Month(x) => 9
}

func run(): Int64 {
    if (res1 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_member_variable_can_not_shadow
// ASSERT: scan sema_mismatched_types
