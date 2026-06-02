// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj -o %output
// ASSERT: scan undeclared identifier 'a'

package b

@When[os == "macOS"]
var a: Int32 = 3

main(): Int64 {
    var b = a + 1
    return 0
}
