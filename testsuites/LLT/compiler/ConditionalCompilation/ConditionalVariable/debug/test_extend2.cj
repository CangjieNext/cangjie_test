// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %compile_lib_opt %n.cj
// EXEC:%compiler %cmp_opt %enableCompileDebug %compile_lib_opt %n.cj
// ASSERT: scan 'me' is not a member of class 'A'

package b

class A {}

@When[debug]
extend A {
    public func me() {
        print("Hi!\n")
    }
}

@When[!debug]
func test() {
    A().me()
}

