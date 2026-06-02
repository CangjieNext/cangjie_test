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
    public var x: Int64
    public init(input: Int64) {
        x = input
    }

    public operator func -(): A {
        return A(this.x + 1)
    }
    public operator func -(input: A): A {
        return A(this.x - input.x - 2)
    }
    public operator func +(input: A): A {
        return A(this.x + input.x - 2)
    }
    public operator func **(input: A): A {
        return A(this.x ** UInt64(input.x) - 2)
    }
    public operator func *(input: A): A {
        return A(this.x * input.x - 2)
    }
    public operator func /(input: A): A {
        return A(this.x / input.x - 2)
    }
    public operator func %(input: A): A {
        return A(this.x % input.x - 2)
    }
    public operator func <<(input: A): A {
        return A(this.x << input.x - 2)
    }
    public operator func >>(input: A): A {
        return A(this.x >> input.x - 2)
    }
    public operator func &(input: A): A {
        return A(this.x & input.x - 2)
    }
    public operator func ^(input: A): A {
        return A(this.x ^ input.x - 2)
    }
    public operator func |(input: A): A {
        return A(this.x | input.x - 2)
    }
}

class B {
    public var y1: A
    public var y2: A
    public init(input1: A, input2: A) {
        y1 = input1
        y2 = input2
    }

    public func test() {
        this.y1 += this.y2
        this.y1 -= this.y2
        this.y1 *= this.y2
        this.y1 /= this.y2
        this.y1 %= this.y2
        this.y1 **= this.y2
        this.y1 <<= this.y2
        this.y1 >>= this.y2
        this.y1 &= this.y2
        this.y1 ^= this.y2
        this.y1 |= this.y2
    }
}

main(): Int64 {
    var a1: A = A(10)
    var a2: A = A(2)
    var b: B = B(a1, a2)
    b.test()

    return 0
}
