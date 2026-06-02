// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj -o %output
// ASSERT: scan undeclared identifier 'sayHi'

package b

@When[os == "macOS"]
func sayHi() {
    print("Hi!\n")
}

main(): Int64 {
    sayHi()
    return 0
}
