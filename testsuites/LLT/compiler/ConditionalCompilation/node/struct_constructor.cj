// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

struct S {
    var m = 1

    @When[!debug] // constructor
    public init(i: Int64) {
        m = i
    }
}

main() {
    S(0).m
}
// ASSERT: scan sema_wrong_number_of_arguments
