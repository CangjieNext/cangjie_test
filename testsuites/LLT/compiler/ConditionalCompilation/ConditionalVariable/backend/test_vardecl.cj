// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj -o %output
// EXEC:%run %run_opt %output %run_args

package b

@When[backend == "cjnative"]
var a: Int32 = 3

main(): Int64 {
    var b = a + 1
    return 0
}
