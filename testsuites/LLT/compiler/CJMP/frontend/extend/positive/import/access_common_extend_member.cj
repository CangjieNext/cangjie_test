// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/ca.cj
// EXEC-0: %compiler %noColor --experimental c/ca.cj --output-type=chir --output-dir ./c
package a

public class A {

}
common extend A{
  common public func koo():Unit{println("common::extend")}
}

extend A{
  public func coo():Unit{println("extend")}
}

// SEPARATE-FILE: p/pa.cj
// EXEC-0: %compiler %noColor --experimental p/pa.cj ./c/a.chir --common-part-cjo=./c/a.cjo --output-type=dylib --output-dir=./p
package a


specific extend A{
   specific public func koo():Unit{println("specific:extend")}
}
public func run() {
    let a = A()
    a.koo()
    a.coo()
}

// SEPARATE-FILE: c/cb.cj
// EXEC-0: %compiler %noColor --experimental c/cb.cj --import-path=./c --output-type=chir --output-dir ./c
package b

import a.*

public func runCommonFromB() {
    let a = A()
    a.koo()
    a.coo()
}

// SEPARATE-FILE: p/pb.cj
// EXEC-0: %compiler %noColor --experimental p/pb.cj ./c/b.chir --common-part-cjo=./c/b.cjo --import-path=./p --output-type=dylib --output-dir=./p
package b

import a.*

public func runFromB() {
    let a = A()
    a.koo()
    a.coo()
}

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -la -lb -o %output
// EXEC-0: export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:./c
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH./p:./c && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p:./c;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p:./c && %run %output 2>&1 | compare %f
import a.*
import b.*

main() {
    run()
    runCommonFromB()
    runFromB()
}
/* SCAN
specific:extend
extend
specific:extend
extend
specific:extend
extend
*/
