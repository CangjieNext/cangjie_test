// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
public common interface A {
    common static func f1(): Int64
    common func f2(): Int64
    func f5(){
        var a =1
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib

package cmp

public specific interface A {
    specific static func f1(): Int64 {
        1 
    }
    specific func f2(): Int64 {
        1
    }
}

open public class C <: A {
    public static func f3(): Int64 {
        3
    }
    public func f4(): Int64 {
        4
    }
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Int64 {
    var x1 = C.f1()
    println(x1) //1
    var x2 = C.f3()
    println(x2) //3
    var x3 = C().f2()
    println(x3) //1
    var x4 = C().f4()
    println(x4) //4
    var x5 = C().f5()
    println(x5) //()
    0
}

/* SCAN
1
3
1
4
()
*/