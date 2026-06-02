// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableConstPropagation %debugCHIROpt %f -o %n.%suffix
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

func foo() {
    var a = 1
    var b = a + 1
    if (a == 2) {
    } else {
        var x = 1
        func a() {
            x = 1
        }
        func b() {
            x = 2
        }
    }
}

main() {
    foo()
}
