// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/common_test.cj
// EXEC-0: %compiler %noColor --experimental c/common_test.cj --output-type=chir --output-dir ./c
package pkg

const cmmn = "common";
const spec = "specific";
common const x = "x = " +  cmmn;
common const func f(): String { "const common func f()" + " " + x  }
common class C {
    const init() {}
    public common static const cx = "C::cx = " + "common";
    public common const func cf(): String { "C::cf() " + "common"  }
}
common interface I {
    common const func h(): String { "I::h() " + "common"  }
}
extend C <: I {}
common struct S {
    const init() {}
    public common static const sx = "S::sx = " + "common";
    public common const func sf(): String { "S::sf() " + "common"  }
}
common enum E {
    | E
    ;
    public common const func ef(): String { "E::ef() " + "common"  }
}

func run() {
    println(x)
    println(f())
    println(C.cx)
    println(C().cf())
    println(C().h())
    println(S.sx)
    println(S().sf())
    println(E.E.ef())
}

// SEPARATE-FILE: p/spec_test.cj
// EXEC-0: %compiler %noColor --experimental p/spec_test.cj --common-part-chir=c/pkg.chir --common-part-cjo=./c/pkg.cjo -L. -o %output
// EXEC-PIPE-0: %run %output | compare %f
features { dummy }

package pkg

specific const x = "x = " +  spec;
specific const func f(): String { "const specific func f()" + " " + x }
specific class C {
    public specific static const cx = "C::cx = " + "specific";
    public specific const func cf(): String { "C::cf() " + "specific"  }
}
specific interface I {
    specific const func h(): String { "I::h() " + "specific"  }
}
specific struct S {
    public specific static const sx = "S::sx = " + "specific";
    public specific const func sf(): String { "S::sf() " + "specific"  }
}
specific enum E {
    | E
    ;
    public specific const func ef(): String { "E::ef() " + "specific"  }
}

main() {
    run()
}

/*SCAN
x = specific
const specific func f() x = specific
C::cx = specific
C::cf() specific
I::h() specific
S::sx = specific
S::sf() specific
E::ef() specific
*/

// SEPARATE-FILE: c/common_main.cj
// EXEC-0: %compiler %noColor --experimental c/common_main.cj --common-part-chir=c/pkg.chir --common-part-cjo=./c/pkg.cjo -L. -o %output
// EXEC-PIPE-0: %run %output | compare %f
package pkg

specific class C {}
specific struct S {}
specific enum E { E; }

main() {
    run()
}

/*SCAN
x = common
const common func f() x = common
C::cx = common
C::cf() common
I::h() common
S::sx = common
S::sf() common
E::ef() common
*/
