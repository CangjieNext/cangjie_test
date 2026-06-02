// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler --int-overflow=saturating %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 127\n127\n0\n

func test() {
    var min: Int8 = -128
    var a = min / -1
    var b = min * -1
    var c = min % -1
    println(a)
    println(b)
    println(c)
}

main() {
    test()
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
