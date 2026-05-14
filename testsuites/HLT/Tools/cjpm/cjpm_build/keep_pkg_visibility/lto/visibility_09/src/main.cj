// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import b.aoo.*
import dep.*
import dep1.*

main() {
    print("hello world\n")

    return 0
}

public func testmain(): Int64 {
    testdep1()
    testdepmain()
    print("hello world\n")
    return 0
}
