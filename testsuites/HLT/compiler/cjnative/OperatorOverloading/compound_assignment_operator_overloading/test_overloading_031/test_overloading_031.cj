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
    public var a: Int64
    public init(input: Int64) {
        a = input
    }

    public operator func -(): A {
        return A(this.a + 1)
    }
    public operator func -(input: A): A {
        return A(this.a - input.a - 2)
    }
    public operator func +(input: A): A {
        return A(this.a + input.a + 2)
    }
    public operator func **(input: A): A {
        return A(this.a ** UInt64(input.a) - 2)
    }
    public operator func *(input: A): A {
        return A(this.a * input.a - 2)
    }
    public operator func /(input: A): A {
        return A(this.a / input.a - 2)
    }
    public operator func %(input: A): A {
        return A(this.a % input.a - 2)
    }
    public operator func <<(input: A): A {
        return A(this.a << input.a - 2)
    }
    public operator func >>(input: A): A {
        return A(this.a >> input.a - 2)
    }
    public operator func &(input: A): A {
        return A(this.a & input.a - 2)
    }
    public operator func ^(input: A): A {
        return A(this.a ^ input.a - 2)
    }
    public operator func |(input: A): A {
        return A(this.a | input.a - 2)
    }
}

open class B {
    public var b: A
    public init(inputB: A) {
        b = inputB
    }
}

class C <: B {
    public init(inputB: A) {
        super({
            =>
            var x = inputB;
            x += x
            x
        }())
    }
}

main(): Int64 {
    var aa: A = A(1)
    var cc: B = C(aa)
    var ccb = cc.b
    var ccba = ccb.a
    if (ccba != 4) {
        return 1
    }
    return 0
}
