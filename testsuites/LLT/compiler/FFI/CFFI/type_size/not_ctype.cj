// EXEC-PIPE-1: %compiler %diag_json %f -o %output 2>&1 | compare %f

struct Data {
    var a: UInt8 = 0
    var b: UInt16 = 0
    var c: UInt32 = 0
    var d: UInt64 = 0
    var e: Int8 = 0
    var f: Int16 = 0
    var g: Int32 = 0
    var h: Int64 = 0
}

main() {
    println(alignOf<Data>())
    println(sizeOf<Data>())
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// ASSERT: scan-2 sema_generic_type_argument_not_match_constraint
// ASSERT: scan "Errors": 2
