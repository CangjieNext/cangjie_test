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

class Data<T1> where V <: Foo {
    public let classBar: T1
    public init(x: T1) {
        classBar = x
    }
}

main(): Int64 {
    let bar: Bar = Bar()
    let data: Data<Foo> = Data<Foo>(bar)

    return 0
}
// ASSERT: scan sema_undeclared_type_name
