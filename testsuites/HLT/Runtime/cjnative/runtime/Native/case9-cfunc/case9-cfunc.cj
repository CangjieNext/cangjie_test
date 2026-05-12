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
this is from getFuncPtr.
1 + 8 = 9
9
this is from getCangjieFuncPtr.
1 + 2 = 3
cb success.
888
this is from getCangjieFuncPtr.
127
this is from getFuncPtr.
2 + 2 = 4
this is from getFuncPtr.
2 + 2 = 4
cb success.
999
this is from getCangjieFuncPtr.
128
this is from getFuncPtr.
3 + 2 = 5
this is from getFuncPtr.
3 + 2 = 5
cb success.
9999
this is from getCangjieFuncPtr.
1288
this is from getFuncPtr.
4 + 2 = 6
this is from getFuncPtr.
4 + 2 = 6
cb success.
111
this is from getFuncPtr.
10 + 100 = 110
127
this is from getFuncPtr.
5 + 2 = 7
this is from getFuncPtr.
5 + 2 = 7
128
this is from getFuncPtr.
6 + 2 = 8
this is from getFuncPtr.
6 + 2 = 8
1288
this is from getFuncPtr.
7 + 2 = 9
this is from getFuncPtr.
7 + 2 = 9
129
this is from getFuncPtr.
8 + 2 = 10
this is from getFuncPtr.
8 + 2 = 10
130
this is from getFuncPtr.
9 + 2 = 11
this is from getFuncPtr.
9 + 2 = 11
this is from getCangjieFuncPtr2.
Cb1 first:5
Cb1 second:6
this is from getCangjieFuncPtr2.
Cb1LambdaVar first:5
Cb1LambdaVar second:6
this is from getCangjieFuncPtr2.
Cb1LambdaLet first:5
Cb1LambdaLet second:6
this is from getCangjieFuncPtr2.
Cb1lmbaVar first:5
Cb1lmbaVar second:6
this is from getCangjieFuncPtr2.
Cb1lmbaLet first:5
Cb1lmbaLet second:6
Cb1 first:5
Cb1 second:2
Cb1LambdaVar first:6
Cb1LambdaVar second:2
Cb1LambdaLet first:7
Cb1LambdaLet second:2
Cb1lmbaVar first:6
Cb1lmbaVar second:2
Cb1lmbaLet first:7
Cb1lmbaLet second:2
 */

foreign func getFuncPtr(): CFunc<(Int32, Int32) -> Int32>

foreign func getCangjieFuncPtr(cb: CFunc<(Int32, Int32) -> Int32>): Unit

foreign func getCangjieFuncPtr2(cb: CFunc<(Int32, Int32) -> Unit>): Unit

@C
func Add(a: Int32, b: Int32): Int32 {
    println(127.toString())
    var c = unsafe { getFuncPtr() }
    unsafe { c(a, b) }
    var d = unsafe { getFuncPtr() }
    unsafe { d(a, b) }
    return a + b
}

var AddLambdaVar: CFunc<(Int32, Int32) -> Int32> = {
    x, y =>
    println(128.toString())
    var c = unsafe { getFuncPtr() }
    unsafe { c(x, y) }
    var d = unsafe { getFuncPtr() }
    unsafe { d(x, y) }
    x + y
}
let AddLambdaLet: CFunc<(Int32, Int32) -> Int32> = {
    x, y =>
    println(1288.toString())
    var c = unsafe { getFuncPtr() }
    unsafe { c(x, y) }
    var d = unsafe { getFuncPtr() }
    unsafe { d(x, y) }
    x + y
}

@C
func Cb1(a: Int32, b: Int32): Unit {
    println("Cb1 first:" + a.toString())
    println("Cb1 second:" + b.toString())
}

var Cb1LambdaVar: CFunc<(Int32, Int32) -> Unit> = {
    x, y =>
    println("Cb1LambdaVar first:" + x.toString())
    println("Cb1LambdaVar second:" + y.toString())
}
let Cb1LambdaLet: CFunc<(Int32, Int32) -> Unit> = {
    x, y =>
    println("Cb1LambdaLet first:" + x.toString())
    println("Cb1LambdaLet second:" + y.toString())
}

unsafe main(): Int64 {
    unsafe {
        var add: CFunc<(Int32, Int32) -> Int32> = getFuncPtr()
        var bb = unsafe { add(1, 8) }
        println(bb.toString())
        getCangjieFuncPtr(add)

        println(888.toString())
        getCangjieFuncPtr(Add)

        println(999.toString())
        getCangjieFuncPtr(AddLambdaVar)

        println(9999.toString())
        getCangjieFuncPtr(AddLambdaLet)

        println(111.toString())
        var lmbaVar: CFunc<(Int32, Int32) -> Int32> = {
            x, y =>
            println(129.toString())
            var c = unsafe { getFuncPtr() }
            unsafe { c(x, y) }
            var d = unsafe { getFuncPtr() }
            unsafe { d(x, y) }
            x + y
        }

        let lmbaLet: CFunc<(Int32, Int32) -> Int32> = {
            x, y =>
            println(130.toString())
            var c = unsafe { getFuncPtr() }
            unsafe { c(x, y) }
            var d = unsafe { getFuncPtr() }
            unsafe { d(x, y) }
            x + y
        }

        if (getFuncPtr()(10, 100) != 110) {
            println(11231.toString())
        }
        unsafe {
            Add(5, 2)
            AddLambdaVar(6, 2)
            AddLambdaLet(7, 2)
            lmbaVar(8, 2)
            lmbaLet(9, 2)
        }

        var Cb1lmbaVar: CFunc<(Int32, Int32) -> Unit> = {
            x, y =>
            println("Cb1lmbaVar first:" + x.toString())
            println("Cb1lmbaVar second:" + y.toString())
        }

        let Cb1lmbaLet: CFunc<(Int32, Int32) -> Unit> = {
            x, y =>
            println("Cb1lmbaLet first:" + x.toString())
            println("Cb1lmbaLet second:" + y.toString())
        }
        getCangjieFuncPtr2(Cb1)
        getCangjieFuncPtr2(Cb1LambdaVar)
        getCangjieFuncPtr2(Cb1LambdaLet)
        getCangjieFuncPtr2(Cb1lmbaVar)
        getCangjieFuncPtr2(Cb1lmbaLet)
        unsafe {
            Cb1(5, 2)
            Cb1LambdaVar(6, 2)
            Cb1LambdaLet(7, 2)
            Cb1lmbaVar(6, 2)
            Cb1lmbaLet(7, 2)
        }

        return 0
    }
}
