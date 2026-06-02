// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: importedPkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt importedPkg.cj -o pkg.%middle
// EXEC: %compiler %f -o %output pkg.%middle
// EXEC: %run %run_opt %output

import test.*

extend A {
    public func some(): Int64 {
        1
    }
}

class B <: A & IChild {}

main() {
    var x = B()
    return x.some() - 1
}
