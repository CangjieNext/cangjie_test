// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func execute(): Unit

public func executeFromCommon() {
    print("`executeFromCommon()` call ")
    execute()
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

import std.random.*

public platform func execute(): Unit {
    let random = Random()
    let x = Array<Int64>(1, repeat: random.nextInt64() % 1)
    let res = calculate(x)
    println("linux `execute()` compute result is: " + res)
}

public func indirectExecute() {
    print("`indirectExecute()` call ")
    execute()
}

private func calculate(input: Array<Int64>): String {
    input[0].toString()
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    execute()
    indirectExecute()
    executeFromCommon()
}

/* SCAN
linux `execute()` compute result is: 0
`indirectExecute()` call linux `execute()` compute result is: 0
`executeFromCommon()` call linux `execute()` compute result is: 0
*/
