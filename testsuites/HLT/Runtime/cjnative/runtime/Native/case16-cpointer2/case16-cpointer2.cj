/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.cpp
// (not Windows) EXEC: %clang -c %clang_opt %n.cpp -o lib%n.cpp.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.cpp.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN-IN
this is from c++.
x : 1 , y : 2 , z : 3, ptr : 5
primary type is right.
ptr type is right.
cast type is right.
cast type2 is right.
cast type3 is right.
free: x : 1 , y : 2 , z : 3, ptr : 5
true
from func name call.
 */

foreign func AllocCStruct(): CPointer<BiggerStruct>

foreign func FreeCStruct(x: CPointer<BiggerStruct>): Unit

foreign func `func`(): Unit

@C
struct BiggerStruct {
    public var x: Int32
    public var y: UInt16
    public var z: Int16
    public var ptr: CPointer<Int32>
    public init(x_: Int32, y_: UInt16, z_: Int16, ptr_: CPointer<Int32>) {
        x = x_
        y = y_
        z = z_
        ptr = ptr_
    }
}

@C
struct SmallerStruct {
    public var x1: UInt16
    public var x2: Int16
    public var y1: Int8
    public var y2: UInt8
    public var z1: UInt8
    public var z2: Int8
    public init(x1!: UInt16, x2!: Int16, y1!: Int8, y2!: UInt8, z1!: UInt8, z2!: Int8) {
        this.x1 = x1
        this.x2 = x2
        this.y1 = y1
        this.y2 = y2
        this.z1 = z1
        this.z2 = z2
    }
}

@C
struct SmallerStruct2 {
    public var x: Int16
    public var x2: Int16
    public var y: UInt16
    public var z: UInt8
    public var z2: Int8
    public init(x!: Int16, x2!: Int16, y!: UInt16, z!: UInt8, z2!: Int8) {
        this.x = x
        this.x2 = x2
        this.y = y
        this.z = z
        this.z2 = z2
    }
}

@C
struct SmallerStruct3 {
    public var x: UInt32
    public var y1: Int8
    public var y2: Int8
    public var z: UInt16
    public init(x!: UInt32, y1!: Int8, y2!: Int8, z!: UInt16) {
        this.x = x
        this.y1 = y1
        this.y2 = y2
        this.z = z
    }
}

main() {
    unsafe{
        var b: CPointer<BiggerStruct> = AllocCStruct()
        let bigger = b.read()
        if (bigger.x == 1 && bigger.y == 2 && bigger.z == 3) {
            println("primary type is right.")
        }

        if (bigger.ptr.read() == 5) {
            println("ptr type is right.")
        }

        var s: CPointer<SmallerStruct> = CPointer<SmallerStruct>(b)
        let smaller = s.read()
        var condition1 = smaller.x1 == 1 && smaller.y1 == 2 && smaller.z1 == 3
        var condition2 = smaller.x2 == 0 && smaller.y2 == 0 && smaller.z2 == 0
        if (condition1 && condition2) {
            println("cast type is right.")
        }

        var s2: CPointer<SmallerStruct2> = CPointer<SmallerStruct2>(b)
        let smaller2 = s2.read()
        var condition = smaller2.x == 1 && smaller2.x2 == 0 && smaller2.y == 2 && smaller2.z == 3 && smaller2.z2 == 0
        if (condition) {
            println("cast type2 is right.")
        }

        var s3: CPointer<SmallerStruct3> = CPointer<SmallerStruct3>(b)
        let smaller3 = s3.read()
        var condition3 = smaller3.x == 1 && smaller3.y1 == 2 && smaller3.y2 == 0 && smaller3.z == 3
        if (condition3) {
            println("cast type3 is right.")
        }

        FreeCStruct(b)

        var emptr: CPointer<Int32> = CPointer<Int32>()
        println(emptr.isNull().toString())

        `func`()

        return 0
    }
}
