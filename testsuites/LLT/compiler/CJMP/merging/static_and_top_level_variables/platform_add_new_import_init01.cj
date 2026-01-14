// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: t/a.cj
// EXEC-0: %compiler %noColor -g t/a.cj --output-type=dylib --output-dir ./t

package a

public func square(x: Int64): Int64 {
    x * x
}

public let ga: Int64 = square(2 + 3) 

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor -g --experimental c/c.cj --import-path=./t --output-type=chir --output-dir ./c
package cmp

import a.*

public common func showGV(): Unit


// SEPARATE-FILE: p/b.cj
// EXEC-0: %compiler %noColor -g p/b.cj --output-type=dylib --output-dir ./p

package b

public let gb: Int64 = 2 * 3

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor -g --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --import-path=./p --import-path=./t --output-type=dylib --output-dir ./p
package cmp

import a.*
import b.*

public specific func showGV(): Unit {
    println("${ga + gb}")
}


// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj -g --import-path=./p --import-path=./t -L./p -L./t -lcmp -la -lb -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./t %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;./t;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p:./t %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    showGV()
}

/* SCAN
31
*/
