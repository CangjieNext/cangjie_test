// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A return inside try-finally does not make the following statement diagnosed.
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not warning: unreachable

func returnWithFinally(): Int64 {
    try {
        return 1
    } finally {
        println("cleanup")
    }
    println("not diagnosed")
    return 2
}

main() {
    returnWithFinally()
}
