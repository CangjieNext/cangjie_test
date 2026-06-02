// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello\nworld\nhello world\nhello world
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

var str1 = "hello"

main() {
    var str2 = "world"
    println(str1)
    println(str2)
    let str3 = str1 + " " + str2
    println(str3)
    println("${str1} ${str2}")
    0
}
