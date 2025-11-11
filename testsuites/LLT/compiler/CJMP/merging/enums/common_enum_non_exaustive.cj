// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common enum A {
    | AA
    | ...

    public func shouldBeFine() {
        match (this) {
            case AA => println("Fine")
            case _ => println("I guess there's something else")
        }
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public platform enum A {
    | AA
    | BB

    public func test() {
        match (this) {
            case AA => println("AA")
            case BB => println("BB")
            case _ => println("SHOULD NOT HAPPENED")
        }
    }
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (LLVM and Linux)EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (LLVM and Windows)EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// ASSERT: scan-1 I guess there's something else
// ASSERT: scan-1 BB
// ASSERT: scan-not SHOULD NOT HAPPENED
import cmp.*

main(): Unit {
    BB.shouldBeFine()
    BB.test()
}