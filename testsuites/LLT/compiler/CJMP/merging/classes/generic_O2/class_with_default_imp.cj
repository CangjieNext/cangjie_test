/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor %enableO2  --experimental c/c.cj --output-type=chir -o ./c
package mp

public class C<T1, T2, T3> {
    public init() {}
    public func foo(a: T1, b: T1) { a }
    public func foo(a: T2, b: T2) { a }
    public func foo(a: T3, b: T3) { a }
}
public func f1() {
    var c = C<Int64, Int32, Float64>()
    c.foo(1, 2) + Int64(c.foo(1.0, 2.0)) + Int64(c.foo(Int32(1), Int32(2))) //expected: 3
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor %enableO2 --experimental p/p.cj c/mp.chir --common-part-cjo=./c/mp.cjo  --output-type=dylib -o ./
package mp

public func f2() {
    var c = C<Int32, Float64, Int64>()
    c.foo(1, 2) + Int64(c.foo(1.0, 2.0)) + Int64(c.foo(Int32(1), Int32(2))) //expected: 3
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %cmp_opt %enableO2 main.cj  -L . -lmp -o %output
// RUN-EXEC: %run %output

import mp.*

main() {
    var c = C<Float64, Int64, Int32>()
    return f1() + f2() + c.foo(1, 2) + Int64(c.foo(1.0, 2.0)) + Int64(c.foo(Int32(1), Int32(2))) - 9
}
