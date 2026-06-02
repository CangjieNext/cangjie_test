/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Int64 {
    var i: Int32 = 1
    var res = match (i) {
        case a: Int8 => 1
        case a: UInt8 => 1
        case a: Int16 => 1
        case a: UInt16 => 1
        case a: Int32 => 1
        case a: UInt32 => 1
        case a: Int64 => 1
        case a: UInt64 => 1
        case a: Float16 => 1
        case a: Float32 => 1
        case a: Float64 => 1
        case a: bigFloat => 1
        case a: bigInt => 1
        case a: Bool => 1
        case a: Rune => 1
        case a: Unit => 1
    }
    if (res == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_undeclared_type_name
