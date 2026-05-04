// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/test_case_params.cj
// EXEC-0: %compiler %noColor --experimental c/test_case_params.cj --output-type=chir --output-dir ./c
package unittestparams

public common class MathOps {
    public init() {}
    
    public common func add(a: Int64, b: Int64): Int64 { a + b }
    public common func multiply(a: Int64, b: Int64): Int64 { a * b }
}

public func getMath(): MathOps { MathOps() }

// SEPARATE-FILE: p/test_case_params.cj
// EXEC-0: %compiler %noColor --experimental p/test_case_params.cj --common-part-chir=c/unittestparams.chir --common-part-cjo=./c/unittestparams.cjo --output-type=dylib
package unittestparams

public specific class MathOps {
    public specific func multiply(a: Int64, b: Int64): Int64 {
        var result: Int64 = 0
        var i: Int64 = 0
        while (i < b) {
            result += a
            i += 1
        }
        result
    }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lunittestparams -L. -o %output
// EXEC: %run %output
import unittestparams.*
internal import std.unittest.*

@Test
class MathTest {
    @TestCase[a in [ 1, 5, 11 ], b in [ 1, 5, 42 ]]
    func test_add(a: Int64, b: Int64) {
        let m = getMath()
        @Expect(m.add(a, b), a + b)
    }
    
    @TestCase[a in [ 1, 5, 11 ], b in [ 1, 5, 42 ]]
    func test_multiply(a: Int64, b: Int64) {
        let m = getMath()
        @Expect(m.multiply(a, b), a * b)
    }
}

@Test
func test_parametrized_add() {
    let m = getMath()
    @Expect(m.add(2, 3), 5)
    @Expect(m.add(-1, 1), 0)
}
