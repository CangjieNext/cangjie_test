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

class Data<T1> where T1 <: Bar {
    public var classFoo: T1
    public init(x: T1) {
        classFoo = x
    }
}

func run(): Int64 {
    let foo: Foo = Foo()
    let data: Data<Foo> = Data<Foo>(foo)
    var classFoo: Foo = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
