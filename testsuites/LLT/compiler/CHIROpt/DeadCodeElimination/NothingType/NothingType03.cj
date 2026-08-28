// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj
// RUN-EXEC-PIPE-1: %run main 2>&1 | compare %f
// ASSERT: scan success!!!
// ASSERT: scan An exception has occurred
// ASSERT: scan-not Should not reach here

func foo(): Nothing {
    println("success!!!")
    throw Exception()
}

main() {
    var a: Int64 = foo()
    println("Should not reach here")
}
