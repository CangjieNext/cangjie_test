// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testb.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt testb.cj -o testb.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt testb.%middle %n.cj -o %output

import testb.A

class B <: A {
    public func foo3() {}
}

main() {
}