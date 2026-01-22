// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan default::String::extendFunc::extendFuncInnerFoo(Int64)
// ASSERT: scan default::String::extendFunc(Int64)
extend String {
    func extendFunc(b: Int64): Int64 {
        func extendFuncInnerFoo(a: Int64): Int64 {
            throw Exception()
        }
        extendFuncInnerFoo(1)
    }
}

main(): Int64 {
    let s = String()
    return s.extendFunc(1) - 2
}
