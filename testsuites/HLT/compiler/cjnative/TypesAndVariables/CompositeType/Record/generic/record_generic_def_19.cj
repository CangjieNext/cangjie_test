/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



open class Foo1 {
    public var dt: Int32 = 2
}

open class Foo2 {
    public var dt: Int32 = 3
}

class Bar1 <: Foo1 {}
class Bar2 <: Foo2 {}

struct Data<T, V>
    where T <: Foo1; V <: Foo2 {  
    let classBar1: T
    let classBar2: V
    init(x: T, y: V) {
        classBar1 = x
        classBar2 = y
    }
}

main(): Int64 {
    let bar1: Bar1 = Bar1()
    let bar2: Bar2 = Bar2()
    let data: Data<Bar1, Bar2> = Data<Bar1, Bar2>(bar1, bar2)
    return 0
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_decl
