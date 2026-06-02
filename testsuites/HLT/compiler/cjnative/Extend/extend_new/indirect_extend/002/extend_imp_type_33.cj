/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class classA {
    public var a: Int64 = 1
}

type flo = Float64

type A = classA

type C = I

interface I {
    prop i: C {
        get() {
            var a: flo = 2.0
            return a
        }
    }
}

extend flo <: C {
    public prop i: C {
        get() {
            var a: flo = 2.0
            return a
        }
    }
}

extend A <: I {
    public prop i: C {
        get() {
            var a: A = A()
            return a
        }
    }
}

main(): Int64 {
    var bo1 = Float64(0.0).i is flo
    var bo2 = A().i is A
    var en = A().i as A
    var int = match (en) {
        case Some(x) => x.a
        case _ => 2
    }
    if (bo1 && bo2 && int == 1) {
        return 0
    } else {
        return 1
    }
}
