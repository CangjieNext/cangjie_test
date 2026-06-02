/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f

open class Base2{
    public var aa: Int32 = 0
}
class Base <: Base2{
    public var a: Int32 = 0
    public func f() : Int32 { 
        return a
    }
    public static func get() : Int32 {
        super<Base2>.aa 
        return 0

    }
}
// ASSERT: scan parse_chained_none_associative
// ASSERT: scan parse_expected_expression
