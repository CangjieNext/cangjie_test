// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor -g --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func showGV(): Unit

// SEPARATE-FILE: p/a.cj
// EXEC-0: %compiler %noColor -g p/a.cj --output-type=dylib --output-dir ./p

package a

func square(x: Int64): Int64 {
    x * x
}

public let gv: Int64 = square(2 + 3) 

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor -g --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --import-path=./p --output-type=dylib --output-dir ./p
package cmp

import a.*

public platform func showGV(): Unit {
    println("${gv}")
}


// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj -g --import-path=./p -L./p -lcmp -la -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    showGV()
}

/* SCAN
25
*/
