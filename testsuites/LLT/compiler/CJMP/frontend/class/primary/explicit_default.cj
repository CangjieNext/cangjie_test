// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// TODO(iliayar): Clarify behaviour
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    public A(x: Int64) {
        println("[common] A.A(${x})")
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public specific class A {}

// SEPARATE-FILE: m_common.cj
// EXEC-PIPE-1: %compiler %diag_json -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output 2>&1 | compare %f
// ASSERT: scan sema_wrong_number_of_arguments
import cmp.*

main(): Unit {
    let a = A()
}

