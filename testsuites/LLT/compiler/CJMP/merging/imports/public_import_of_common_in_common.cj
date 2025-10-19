//  Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information. 

// ======================

// SEPARATE-FILE: mp_c/c/c.cj
// EXEC-0: %compiler %noColor --experimental mp_c/c/c.cj --output-type=chir --output-dir ./mp_c/c
package mp

public common class C {
    public init() {}
}

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --import-path=./mp_c/c --output-type=chir --output-dir ./c
package cmp

public import mp.*

common extend C {
    public common prop p: Int64 { get(){0} }
    public common func f(): Int64 { 0 }
}

public func f() {
    return C().f() + C().p
}

// ======================

// SEPARATE-FILE: mp_p/p.cj
// EXEC-0: %compiler %noColor --experimental mp_p/p.cj mp_c/c/mp.chir --common-part-cjo=./mp_c/c/mp.cjo --output-type=dylib
package mp

public platform class C {}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

platform extend C {
    public platform prop p: Int64 { get(){1} }
    public platform func f(): Int64 { 1 }
}

// ======================

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -lmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    println(f())
}

/* SCAN
2
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -lmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    println(f())
}

/* SCAN
2
*/ 
