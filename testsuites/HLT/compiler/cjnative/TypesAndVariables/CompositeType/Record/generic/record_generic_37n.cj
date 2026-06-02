/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Foo<T> {
    public var dt: Int32 = 1
    public init(x: Int32) {
        dt = x
    }
    public init() {}
}

class Bar<T> <: Foo<Int32> {}

struct Data<T1> where T1 <: Bar<Int32> {
    public let classBar: T1
    public init(x: T1) {
        classBar = x
    }
}

func run(): Int64 {
    var dt: Int32 = 3
    let foo: Foo<Int32> = Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var classFoo: Foo = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 2) {
        return 0
    }
    return
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_generic_type_without_type_argument
// ASSERT: scan sema_mismatched_types
