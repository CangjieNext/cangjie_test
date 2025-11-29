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

public common enum E<K> {
    | E1
    public common func foo<K>(a: K, b: K): K {
        a
    }
}
public func f1() {
  E1<String>.foo<Int64>(1, 2)
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor %enableO2 --experimental p/p.cj c/mp.chir --common-part-cjo=./c/mp.cjo  --output-type=dylib -o ./
package mp

public platform enum E<K> {
    | E1
    public platform func foo<K>(a: K, b: K): K {
        b
    }
}
public func f2() {
   E1<String>.foo<Int64>(1, 2)
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %cmp_opt %enableO2 main.cj  -L . -lmp -o %output
// RUN-EXEC: %run %output

import mp.*

main() {
    return f1() + f2() +E1<String>.foo<Int64>(1, 2) - 6
}
