//  Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information. 
 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
 
public common func f() { 1 }

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental --common-part-cjo=c/cmp.cjo c/cmp.chir p/p.cj --output-type=dylib
package cmp
 
public specific func f() { 2 } 
 
// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*
 
main() {
    println(f())
}
 
/* SCAN
2
*/ 
