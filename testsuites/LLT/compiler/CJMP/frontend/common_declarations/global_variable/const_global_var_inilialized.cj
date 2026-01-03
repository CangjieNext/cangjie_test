// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public const x: Int64 = 42

public func useX() { 
    x
}

public const func f(): Int64 {
    const y = 46
    y
}

public common func useXmp(): Int64


public class ConstClass <: ToString {
    const init() {}

    public func toString(): String { "ConstClass" }
}

public const constClass = ConstClass()

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./p
package cmp

public const z: Int64 = 44

public const func g(): Int64 { 47 }

public platform func useXmp(): Int64 {
    x + 3
}

// SEPARATE-FILE: m/main.cj
// EXEC-0: %compiler %noColor --import-path=./p -L ./p -lcmp m/main.cj --output-dir ./m && ./m/main 2>&1 | compare %f
// ASSERT: scan-1 42
// ASSERT: scan-1 43
// ASSERT: scan-1 44
// ASSERT: scan-1 45
// ASSERT: scan-1 46
// ASSERT: scan-1 47
// ASSERT: scan-1 ConstClass
import cmp.*

main(): Unit {
    println(x)
    println(useX() + 1)
    println(z)
    println(useXmp())
    println(f())
    println(g())
    println(constClass)
}

 
