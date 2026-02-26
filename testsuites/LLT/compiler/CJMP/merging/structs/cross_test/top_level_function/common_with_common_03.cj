// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common struct S {
    public init(){}
}

public common func testFunc(): Unit {
    println("2")
}

// SEPARATE-FILE: p/p.cj
// ERRCHECK: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// ASSERT: scan sema_not_matched
package cmp

public specific struct S {

    public specific func testFunc(): Unit {
        println("3")
   }
}

main(): Unit {
    S().testFunc()
    testFunc()
}

