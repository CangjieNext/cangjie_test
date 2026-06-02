// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroBaz.cj
// EXEC: %compiler %cmp_macro macroBaz.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan expect an attributed macro 'Baz', but find a plain one
import pkg2.*

@Baz[random]
func foo() {
    print("hi foo\n")
}

main(): Int64 {
    var a: Int64 = 2 * 3
    if (a != 6) {
        return 1
    }
    foo()
    0
}
