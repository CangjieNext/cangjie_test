// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// SEPARATE-FILE: mp1/test_imp.cj
// EXEC-0: %compiler %noColor --experimental mp1/test_imp.cj --output-type=dylib  --output-dir=./mp1
package mp1

public class A<T> {
    public init() {}
}

// SEPARATE-FILE: mp/test_comm.cj
// EXEC-0:: %compiler %noColor --experimental mp/test_comm.cj -L ./mp1 -lmp1 --output-type=chir --output-dir   ./mp
package mp

public import mp1.*

public class B<T> {}

public interface I<T> {
    func foo1(): Int64 {
        1
    }
}

extend<T> A<T> <: I<T> where T <: B<Int64> {
    public func foo2(): Int64 {
        1
    }
    public static func foo3(): Int64 {
        1
    }
    public static func foo4(): Int64 {
        1
    }
}

public func f1() {
    var a = A<B<Int64>>()
    a.foo1() + a.foo2() + A<B<Int64>>.foo3() + A<B<Int64>>.foo4()
}

// SEPARATE-FILE: mp/test_plat.cj
// EXEC-PIPE-0: %compiler %noColor --experimental mp/test_plat.cj -L ./mp1 -lmp1  ./mp/mp.chir --common-part-cjo=./mp/mp.cjo  -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./mp1: %run %output 
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./mp1;%PATH% && %run %output
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./mp1 && %run %output
package mp

import mp1.*

main() {
    var a = A<B<Int64>>()
    return f1() - a.foo1() - a.foo2() - A<B<Int64>>.foo3() - A<B<Int64>>.foo4()
}
