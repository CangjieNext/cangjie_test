// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler --disable-reflection %noStackInfo %f -o %output
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output

class C {
    func foo(a: Int64) {
        3
    }
    func bar() {
        let a = foo
        var b = foo
    }
}

main() {
    0
}
