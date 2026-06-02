/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN-IN
func PassStructToC_6S
change CJ struct: x -> 1 , y -> 2
11
12

func PassFloatStructToC_6S
change CJ struct: x -> 1.000000 , y -> 2.000000
11.000000
12.000000
 */

// This case test that ffi use %rax and %rdx to return struct value which is not larger than 16 bytes according to AMD64-ABI
foreign func PassStructToC_6S(aStruct: SmallStruct): SmallStruct

foreign func PassFloatStructToC_6S(aStruct: SmallFloatStruct): SmallFloatStruct

@C
struct SmallStruct {
    public var x: Int64
    public var y: Int64
    public init(x_: Int64, y_: Int64) {
        x = x_
        y = y_
    }
}

@C
struct SmallFloatStruct {
    public var x: Float64
    public var y: Float64
    public init(x_: Float64, y_: Float64) {
        x = x_
        y = y_
    }
}

main() {
    unsafe {
        var aaa: SmallStruct = SmallStruct(1, 2)
        var bbb = PassStructToC_6S(aaa)
        println(bbb.x.toString())
        println(bbb.y.toString())

        var ccc: SmallFloatStruct = SmallFloatStruct(1.0, 2.0)
        var ddd = PassFloatStructToC_6S(ccc)
        println(ddd.x.toString())
        println(ddd.y.toString())
        return 0
    }
}
