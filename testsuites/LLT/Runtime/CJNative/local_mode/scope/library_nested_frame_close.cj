// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Array.get creates an internal local region. The caller must be able to close
// its own frame while native2 first drains the callee-owned region.
// EXEC: %compiler %cmp_opt %disableFuncInlining %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan library nested close: 110

func readAt(values: Array<Int64> @local?, index: Int64): Int64 {
    let item: Option<Int64> @local? = values.get(index)
    match (item) {
        case Some(value) => value
        case None => -1
    }
}

main(): Unit {
    let values: Array<Int64> @local? = [11, 22, 33, 44]
    var sum: Int64 = 0
    for (i in 0..4) {
        sum += readAt(values, i)
    }
    println("library nested close: ${sum}")
}
