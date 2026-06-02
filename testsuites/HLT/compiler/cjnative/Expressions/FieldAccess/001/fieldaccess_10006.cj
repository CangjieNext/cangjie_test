/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class B {
    var x = 1
}

class A {
    func test() {
        return B()
    }
}

open class C0 {
    var x = [A()]
}

class C <: C0 {
    func test() {
        super.x[0].test().x = 0
        return 0
    }
}

main() {
    C().test()
}
