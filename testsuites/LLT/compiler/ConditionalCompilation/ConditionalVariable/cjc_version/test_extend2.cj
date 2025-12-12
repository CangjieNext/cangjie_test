// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj -o %output
// ASSERT: scan 'me' is not a member of class 'A'

package b

class A {}

@When[cjc_version <= "0.0.0"]
extend A {
    public func me() {
        print("Hi!\n")
    }
}

main(): Int64 {
    A().me()
    return 0
}

