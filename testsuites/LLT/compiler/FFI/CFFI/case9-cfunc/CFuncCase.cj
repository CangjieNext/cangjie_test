// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: GetPtr.cpp
// EXEC: %clang %clang_shared_opt GetPtr.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan this is from getFuncPtr.
// ASSERT: scan 1 + 8 = 9
// ASSERT: scan 9
// ASSERT: scan this is from getCangjieFuncPtr.

// ASSERT: scan 1 + 2 = 3\ncb success.\n888this is from getCangjieFuncPtr.
// ASSERT: regex 127this is from getFuncPtr.

// ASSERT: scan 2 + 2 = 4\nthis is from getFuncPtr.
// ASSERT: scan 2 + 2 = 4\ncb success.\n999this is from getCangjieFuncPtr.
// ASSERT: regex 128this is from getFuncPtr.

// ASSERT: scan 3 + 2 = 5\nthis is from getFuncPtr.
// ASSERT: scan 3 + 2 = 5\ncb success.\n9999this is from getCangjieFuncPtr.
// ASSERT: regex 1288this is from getFuncPtr.

// ASSERT: scan 4 + 2 = 6\nthis is from getFuncPtr.
// ASSERT: scan 4 + 2 = 6\ncb success.\n111this is from getFuncPtr.
// ASSERT: regex 127this is from getFuncPtr.

// ASSERT: scan 10 + 100 = 110

// ASSERT: regex 127this is from getFuncPtr.
// ASSERT: scan 5 + 2 = 7\nthis is from getFuncPtr.

// ASSERT: regex 128this is from getFuncPtr.
// ASSERT: scan 6 + 2 = 8\nthis is from getFuncPtr.

// ASSERT: regex 129this is from getFuncPtr.
// ASSERT: scan 7 + 2 = 9\nthis is from getFuncPtr.

// ASSERT: regex 129this is from getFuncPtr.
// ASSERT: scan 8 + 2 = 10\nthis is from getFuncPtr.

// ASSERT: regex 130this is from getFuncPtr.
// ASSERT: scan 9 + 2 = 11\nthis is from getFuncPtr.

// ASSERT: regex Cb1 first:5
// ASSERT: regex Cb1 second:6

// ASSERT: regex Cb1LambdaVar first:5
// ASSERT: regex Cb1LambdaVar second:6

// ASSERT: regex Cb1LambdaLet first:5
// ASSERT: regex Cb1LambdaLet second:6

// ASSERT: regex Cb1lmbaVar first:5
// ASSERT: regex Cb1lmbaVar second:6

// ASSERT: regex Cb1lmbaLet first:5
// ASSERT: regex Cb1lmbaLet second:6

// ASSERT: regex Cb1 first:5
// ASSERT: regex Cb1 second:2

// ASSERT: regex Cb1LambdaVar first:6
// ASSERT: regex Cb1LambdaVar second:2

// ASSERT: regex Cb1LambdaLet first:7
// ASSERT: regex Cb1LambdaLet second:2

// ASSERT: regex Cb1lmbaVar first:6
// ASSERT: regex Cb1lmbaVar second:2

// ASSERT: regex Cb1lmbaLet first:7
// ASSERT: regex Cb1lmbaLet second:2

// ASSERT: scan-not 11231

foreign func getFuncPtr(): CFunc<(Int32, Int32) -> Int32>

foreign func getCangjieFuncPtr(cb: CFunc<(Int32, Int32) -> Int32>): Unit

foreign func getCangjieFuncPtr2(cb: CFunc<(Int32, Int32) -> Unit>): Unit

@C
func Add(a: Int32, b: Int32) : Int32 {
    print(127.toString())
    var c = unsafe{ getFuncPtr() }
    unsafe { c(a, b) }
    var d = unsafe{ getFuncPtr() }
    unsafe { d(a, b) }
    return a + b
}

var AddLambdaVar : CFunc<(Int32, Int32) -> Int32> = {x, y =>
    print(128.toString())
    var c = unsafe{ getFuncPtr() }
    unsafe { c(x, y) }
    var d = unsafe{ getFuncPtr() }
    unsafe { d(x, y) }
    x + y
}

let AddLambdaLet : CFunc<(Int32, Int32) -> Int32> = {x, y =>
    print(1288.toString())
    var c = unsafe{ getFuncPtr() }
    unsafe { c(x, y) }
    var d = unsafe{ getFuncPtr() }
    unsafe { d(x, y) }
    x + y
}

@C
func Cb1(a: Int32, b: Int32) : Unit {
    print("Cb1 first:" + a.toString() + "\n")
    print("Cb1 second:" + b.toString() + "\n")
}

var Cb1LambdaVar : CFunc<(Int32, Int32) -> Unit> = {x, y =>
    print("Cb1LambdaVar first:" + x.toString() + "\n")
    print("Cb1LambdaVar second:" + y.toString() + "\n")
}

let Cb1LambdaLet : CFunc<(Int32, Int32) -> Unit> = {x, y =>
     print("Cb1LambdaLet first:" + x.toString() + "\n")
     print("Cb1LambdaLet second:" + y.toString() + "\n")
}

unsafe main(): Int64{
    var add: CFunc<(Int32, Int32) -> Int32> = getFuncPtr()
    var bb = unsafe { add(1, 8) }
    print(bb.toString())
    getCangjieFuncPtr(add)

    print(888.toString())
    getCangjieFuncPtr(Add)

    print(999.toString())
    getCangjieFuncPtr(AddLambdaVar)

    print(9999.toString())
    getCangjieFuncPtr(AddLambdaLet)

    print(111.toString())
    var lmbaVar : CFunc<(Int32, Int32) -> Int32> = {x, y =>
      print(129.toString())
      var c = unsafe{ getFuncPtr() }
      unsafe { c(x, y) }
      var d = unsafe{ getFuncPtr() }
      unsafe { d(x, y) }
      x + y
    }

    let lmbaLet : CFunc<(Int32, Int32) -> Int32> = {x, y =>
        print(130.toString())
        var c = unsafe{ getFuncPtr() }
        unsafe { c(x, y) }
        var d = unsafe{ getFuncPtr() }
        unsafe { d(x, y) }
        x + y
    }

    if (getFuncPtr()(10, 100) != 110) {
        print(11231.toString())
    }
    unsafe {
        Add(5, 2)
        AddLambdaVar(6, 2)
        AddLambdaLet(7, 2)
        lmbaVar(8, 2)
        lmbaLet(9, 2)
    }

    var Cb1lmbaVar : CFunc<(Int32, Int32) -> Unit> = {x, y =>
       print("Cb1lmbaVar first:" + x.toString() + "\n")
       print("Cb1lmbaVar second:" + y.toString() + "\n")
    }

    let Cb1lmbaLet : CFunc<(Int32, Int32) -> Unit> = {x, y =>
       print("Cb1lmbaLet first:" + x.toString() + "\n")
       print("Cb1lmbaLet second:" + y.toString() + "\n")
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
