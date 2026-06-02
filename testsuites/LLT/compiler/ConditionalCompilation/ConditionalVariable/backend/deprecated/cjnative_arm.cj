// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %n.cj -o %output %diag_json

@When[backend == "cjnative_arm"]
func sayHi() {
    print("Hi!\n")
}

main(): Int64 {
    sayHi()
}
// ASSERT: scan conditional_compilation_not_support_builtin_value
