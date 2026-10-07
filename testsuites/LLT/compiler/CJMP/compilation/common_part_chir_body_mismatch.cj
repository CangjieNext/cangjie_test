// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Equal declarations with different bodies must still produce a pair mismatch.
// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: v1/c.cj
// EXEC-0: %compiler %noColor --experimental v1/c.cj --output-type=chir --output-dir ./v1
package demo

public common func value(): Int64 { 1 }
public common func foo(): Int64

// SEPARATE-FILE: v2/c.cj
// EXEC-0: %compiler %noColor --experimental v2/c.cj --output-type=chir --output-dir ./v2
package demo

public common func value(): Int64 { 2 }
public common func foo(): Int64

// SEPARATE-FILE: p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p.cj --common-part-cjo=v1/demo.cjo --common-part-chir=v2/demo.chir -o %output 2>&1 | compare %f
/* SCAN-IN
error: common part cjo file '
*/
/* SCAN-IN
does not match any common part chir file passed with '--common-part-chir'
*/
// EXEC-0: %compiler %noColor --experimental p.cj --common-part-cjo=v1/demo.cjo --common-part-chir=v1/demo.chir -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
/* SCAN
11
*/
package demo

public specific func foo(): Int64 { 10 }

main() {
    println(value() + foo())
}
