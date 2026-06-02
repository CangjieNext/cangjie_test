// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj -o %output
// EXEC:%run %run_opt %output %run_args | compare %f
// ASSERT: regex Hi!

package b

@When[os == "Linux"]
func sayHi() {
    print("Hi!\n")
}

@When[os == "Windows"]
func sayHi() {
    print("Hi!\n")
}

@When[os == "macOS"]
func sayHi() {
    print("Hi!\n")
}

main(): Int64 {
    sayHi()
    return 0
}
