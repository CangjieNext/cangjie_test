/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



open class Foo {
    public var dt: Int32 = 2
}

class Bar <: Foo {}

struct Data<T>
    where T < Foo {  
    public let classBar: T
    public init(x: T){
        classBar = x
    }
}

main(): Int64 {
    let bar: Bar= Bar()
    let data: Data<Bar> = Data<Bar>(bar)
    return 0
}
// ASSERT: scan parse_expected_character
