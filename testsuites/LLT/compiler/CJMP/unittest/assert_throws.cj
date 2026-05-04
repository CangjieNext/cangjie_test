// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/assert_throws.cj
// EXEC-0: %compiler %noColor --experimental c/assert_throws.cj --output-type=chir --output-dir ./c
package unittestassert

public common class Calculator {
    public init() {}
    
    public common func divide(a: Int64, b: Int64): Int64 {
        if (b == 0) {
            throw Exception("Division by zero")
        }
        a / b
    }
}

public func doDivision(x: Int64, y: Int64): Int64 {
    Calculator().divide(x, y)
}

// SEPARATE-FILE: p/assert_throws.cj
// EXEC-0: %compiler %noColor --experimental p/assert_throws.cj --common-part-chir=c/unittestassert.chir --common-part-cjo=./c/unittestassert.cjo --output-type=dylib
package unittestassert

public specific class Calculator {
    public specific func divide(a: Int64, b: Int64): Int64 {
        if (b == 0) {
            throw Exception("Platform: Division by zero")
        }
        a / b
    }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lunittestassert -L. -o %output
// EXEC: %run %output
import unittestassert.*

@Test
func test_platform_exception_message() {
    let e = @AssertThrows(doDivision(10, 0))
    @Expect(e.message, "Platform: Division by zero")
}

@Test
func test_no_exception() {
    let result = doDivision(10, 2)
    @Expect(result, 5)
}
