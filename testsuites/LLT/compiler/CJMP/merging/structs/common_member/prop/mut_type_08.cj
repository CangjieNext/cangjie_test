// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common struct A {
    common mut prop testProp: Unit {
        get() {
            println("common")
        }
        set(v) {
            println("common")
        }
    }
    init() {}
}

// SEPARATE-FILE: p/p.cj
// ERRCHECK: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// ASSERT: scan sema_platform_has_different_type
package cmp

platform struct A {
    platform mut prop testProp: Int64 {
        get() {
            println("platform")
            1
        }
        set(v) {
            println("platform")
        }
    }
}

main() : Unit {
    A().testProp
}

