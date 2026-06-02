/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class A {
    var b = B()
}

class B {
    var c = C()
}

class C {
    var d = Some(E(-1))
}

class E {
    var f = Some(Some(Some(0)))
    init(x: Int64) {
        this.f = Some(Some(Some(x)))
    }
}

main() {
    var a = Some(A())
    a?.b.c.d?.f = 1
    if ((a?.b.c.d?.f ?? 1) != Some(1)) {
        return 1
    }
    a?.b.c.d?.f = Some(2)
    if ((a?.b.c.d?.f ?? 1) != Some(Some(2))) {
        return 2
    }
    a?.b.c.d?.f = Some(Some(3))
    if ((a?.b.c.d?.f ?? 1) != 3) {
        return 3
    }
    return 0
}
