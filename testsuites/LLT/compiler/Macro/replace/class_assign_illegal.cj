// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan expected expression after literal '1', found keyword 'init'

import test.*

class A {
    public var a = @callTest(1
    init(input : Int64){
        this.a = input
    }
    )
}

main() {
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
