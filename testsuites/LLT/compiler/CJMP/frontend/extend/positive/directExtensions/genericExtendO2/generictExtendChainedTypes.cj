/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor %enableO2 --experimental c/c.cj --output-type=chir -o ./c
package mp
public class A<T, K> {}
public class B<T> {
    public var a: T
    public init(a: T) {
        this.a = a
    }
}
common extend <T> A<B<T>, Int64> {
    public common func foo1(a: B<Int64>) { a.a }
    public common static func foo2(a: B<Int64>) { a.a }
}
public func f1() {
    return A<B<Int64>, Int64>().foo1(B<Int64>(1)) + A<B<Int64>, Int64>.foo2(B<Int64>(1))
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor %enableO2 --experimental p/p.cj c/mp.chir --common-part-cjo=./c/mp.cjo  --output-type=dylib -o ./
package mp
platform extend <T> A<B<T>, Int64> {
    public platform func foo1(a: B<Int64>) { a.a + 1 }
    public platform static func foo2(a: B<Int64>) { a.a + 1 }
}
public func f2() {
    return A<B<Int64>, Int64>().foo1(B<Int64>(1)) + A<B<Int64>, Int64>.foo2(B<Int64>(1))
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %cmp_opt %enableO2 main.cj  -L . -lmp -o %output
// RUN-EXEC: %run %output

import mp.*

main() {
    return f1() + f2() + A<B<Int64>, Int64>().foo1(B<Int64>(1)) + A<B<Int64>, Int64>.foo2(B<Int64>(1)) - 12
}
