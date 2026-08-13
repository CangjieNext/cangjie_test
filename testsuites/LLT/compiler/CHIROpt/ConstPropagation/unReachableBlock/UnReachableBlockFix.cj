// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Compile/run only: const-false branch leaves nested funcs in unreachable block.
// EXEC: %compiler %cmp_opt %enableConstPropagation -Woff unused %f -o %output
// RUN-EXEC: %run %output

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
