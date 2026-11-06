// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The mangled name of an extend refers to its file by the file name only. A common part file and a specific part
// file with the same name must not give the same mangled name to their extends of the same type, and the extends
// of the common part must keep the names which they have in the common part chir.

// SEPARATE-FILE: c/a.cj
// EXEC-0: %compiler %noColor --experimental c/a.cj --output-type=chir --output-dir ./c
package demo

public interface I1 { func f1(): Int64 }

extend Int64 <: I1 {
    private func helper1(): Int64 { 1 }
    @Frozen
    public func f1(): Int64 { helper1() }
}

public common func foo(): Int64

// SEPARATE-FILE: p/a.cj
// EXEC-0: %compiler %noColor --experimental p/a.cj --common-part-chir=c/demo.chir --common-part-cjo=./c/demo.cjo -o %output
// RUN: %run %output 2>&1 | compare %f
package demo

public interface I2 { func f2(): Int64 }

extend Int64 <: I2 {
    private func helper2(): Int64 { 20 }
    @Frozen
    public func f2(): Int64 { helper2() }
}

public specific func foo(): Int64 { 300 }

main() {
    println(1.f1() + 1.f2() + foo())
}

/* SCAN
321
*/
