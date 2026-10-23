// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Relative common (merge + --output-type=chir) must set outputCHIR and run
// RestoreCJMPDependencies correctly. Without the fix, `d` is initialized
// before specific `b` and observes the zeroed global (prints 0 instead of 2).

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
@NonProduct
features { }
package cmp

public common let c: Int64 = 1
public common var b: Int64 = c
public common let d: Int64 = b

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
@NonProduct
features { mid }
package cmp

public specific var b: Int64 = 2
public common let e: Int64 = b + 10

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib --output-dir ./p2
features { mid }
package cmp

// SEPARATE-FILE: main.cj
// EXEC-0: %compiler %noColor main.cj --import-path=./p2 -L./p2 -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p2 %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p2;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p2 %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(c)
    println(b)
    println(d)
    println(e)
}

/* SCAN
1
2
2
12
*/
