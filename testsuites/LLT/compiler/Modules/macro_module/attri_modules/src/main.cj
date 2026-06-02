// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import pkg2.*
import pkg1.*

@Bar[1]
func foo() {
    var a = 2020
    return a
}

main(): Int64 {
    var b = foo()
    var a = @Bar[123](2+3)
    var c = @Bar[123](5+5)
    var d = @callTest(2)
    if (a != 5) {
        return 1
    }
    if (c != 10) {
        return 1
    }
    if (d != 2) {
        return 1
    }
    print("hi test\n")
    0
}
