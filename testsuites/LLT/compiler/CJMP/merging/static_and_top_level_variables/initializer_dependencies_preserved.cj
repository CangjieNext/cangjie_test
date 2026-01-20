// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let c1: Int = 1

public func f1() { return c1 + 1 }

public let x2 = f1()

public func f2() { return x2 + 10 }

public common let c3: Int = f2()

public func f3() { return c3 + 100 }

public func f4() { return f3() + 1000 }

public let x4 = f4()

// COMMON DEPENDENCIES:
// x2 -> c1
// c3 -> c1, x2
// x4 -> c3, x2, c1
// SO, THESE ONE IS FIXED FOR EACH SUBSEQUENT COMPILATION:
// x2 -> c1
// x4 -> c1, x2, c3
// BUT, THESE ARE NOT FIXED(they can change, be deleted or even be reversed in some cases):
// c3 -> c1, x2

// SEPARATE-FILE: p/p_invalid_1.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p_invalid_1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

// INVALID: c1 -> x2
public specific let c1: Int = x2

/* SCAN
error: p_invalid_1.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/

// SEPARATE-FILE: p/p_invalid_2.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p_invalid_2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

// INVALID: c1 -> x2
public specific let c1: Int = f2()

/* SCAN
error: p_invalid_2.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/

// SEPARATE-FILE: p/p_invalid_3.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p_invalid_3.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

public specific let c1: Int = x2

// INVALID: c3 -> x4
public specific let c3: Int = c1

/* SCAN
error: p_invalid_3.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/

// SEPARATE-FILE: p/p_invalid_4.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p_invalid_4.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

// INVALID:
// c3 -> c1 therefore p.cj -> c.cj
// But also x4 -> c3 therefore c.cj -> p.cj
public specific let c3: Int = c1

/* SCAN
error: p_invalid_4.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/

// SEPARATE-FILE: p/p_valid_1.cj
// EXEC-0: %compiler %noColor --experimental p/p_valid_1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

// VALID: c3 -> c1
// DIFFERENT WITH PREVIOUS CASE THAT THERE IS NO `p.cj -> c.cj`
public specific let c1: Int = 0 
public specific let c3: Int = c1
// REMOVED: c3 -> x2 (it's okay)

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public specific let c3: Int = 42
// VALID: c1 -> c3 (reversed but valid)
public specific let c1: Int = c3 + 48

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(c1)
    println(x2)
    println(c3)
    println(x4)
}

/* SCAN
90
91
42
1142
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(c1)
    println(x2)
    println(c3)
    println(x4)
}

/* SCAN
90
91
42
1142
*/