// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %trimpath_opt %pwd/ %stack_trace_format simple %f -o %output
//  EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
//  ASSERT: scan at format_simple.cj:18
//  ASSERT: scan at format_simple.cj:22
package format

class Bar {}

func foo<T>(a: Int64, b: Int32, c: T) {
    println(a)
    println(b)
    throw Exception()
}

main() {
    foo<Bar>(0, 0, Bar())
    return 0
}
