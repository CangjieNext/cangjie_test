/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type I8 = Int8

type I16 = Int16

type I32 = Int32

type I64 = Int64

type In = IntNative

type UI8 = UInt8

type UI16 = UInt16

type UI32 = UInt32

type UI64 = UInt64

type UIn = UIntNative

type F16 = Float16

type F32 = Float32

type F64 = Float64

type Bl = Bool

type Re = Rune

type Ut = Unit

type Cstr = CString

type Str = String

type A<T> = Array<T>

type A02<T> = A<T>

type AL<T> = ArrayList<T>

type AL02<T> = AL<T>

type HSet<T> = HashSet<T>

type For<T> = Range<T>

type For1<T> = For<T>

type HM<K, V> = HashMap<K, V>

type HM1<K, V> = HM<K, V>

type CP<T> = CPointer<T>

type CP1<T> = CP<T>

extend I8 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend I16 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend I32 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend I64 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend In {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend UI8 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend UI16 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend UI32 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend UI64 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend UIn {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend F16 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend F32 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend F64 {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend Bl {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend Re {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend Ut {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend Cstr {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend Str {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend For1<Int64> {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend A<Int64> {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend AL<Int64> {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend HM1<String, Int64> {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

extend HSet<Int64> {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
    func printIntAndArg<T, V>(a: T, b: V) where T <: ToString, V <: ToString {
        var a1 = a
        var a2 = b
        println("${a}" + "${b}")
    }
}

extend CP<Int64> {
    func printIntAndArg<T>(a: T) where T <: ToString {
        var a1 = a
        println("${a}")
    }
}

main() {
    var i8: I8 = 8
    i8.printIntAndArg<Bool>(true)
    var i16: I16 = 16
    i16.printIntAndArg<Str>("cangjie")
    var i32: I32 = 32
    i32.printIntAndArg<Float16>(16.16)
    var i64: I64 = 64
    i64.printIntAndArg<UInt16>(16)
    var inn: In = 100
    inn.printIntAndArg<Rune>(r'a')
    var ui8: UI8 = 8
    ui8.printIntAndArg<Int64>(64)
    ui8.printIntAndArg<Array<Int64>, Array<Int64>>([1, 2, 3], [1, 2, 3])
    var ui16: UI16 = 16
    ui16.printIntAndArg<Array<Int64>>([1, 2, 3])
    ui16.printIntAndArg<HashSet<Int64>, Int64>(HashSet<Int64>(1, 2, 3), 6)
    var ui32: UI32 = 32
    ui32.printIntAndArg<Float32>(32.32)
    ui32.printIntAndArg<Rune, String>(r'a', "cangjie")
    var ui64: UI64 = 64
    ui64.printIntAndArg<UInt16>(16)
    ui64.printIntAndArg<Bool, UInt64>(false, 64)
    var uinn: UIn = 100
    uinn.printIntAndArg<Rune>(r'a')
    uinn.printIntAndArg<HashMap<String, Int64>, ArrayList<Int64>>(HashMap<String, Int64>(("a", 1), ("b", 2)),
        ArrayList<Int64>([1, 2, 3]))
    var f16: F16 = 16.16
    f16.printIntAndArg<Int8>(-8)
    var f32: F32 = 32.32
    f32.printIntAndArg<UInt8>(8)
    var f64: F64 = 64.64
    f64.printIntAndArg<Float16>(16.16)
    var bl: Bl = true
    bl.printIntAndArg<Rune>(r'a')
    bl.printIntAndArg<ArrayList<Int64>, UInt64>(ArrayList<Int64>([1, 2, 3]), 64)
    var re: Re = 'a'
    re.printIntAndArg<Array<Int64>>([1, 2, 3])
    var ut: Unit = ()
    ut.printIntAndArg<IntNative>(100)
    var cstr: Cstr = unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }
    cstr.printIntAndArg<HashMap<String, Int64>>(HashMap<String, Int64>(("a", 1), ("b", 2)))
    cstr.printIntAndArg<ArrayList<Int64>, String>(ArrayList<Int64>([1, 2, 3]), "cangjie")
    var str: Str = "cangjie"
    str.printIntAndArg<Rune>(r'a')
    str.printIntAndArg<Bool, Int64>(true, 64)
    var range: For1<Int64> = 1..10 : 1
    range.printIntAndArg<Float64>(64.64)
    var arr: A<Int64> = [1, 2, 3]
    arr.printIntAndArg<ArrayList<Int64>>(ArrayList<Int64>([1, 2, 3]))
    arr.printIntAndArg<Array<Int64>, UInt64>([1, 2, 3], 64)
    var list: AL<Int64> = AL<Int64>([1, 2, 3])
    list.printIntAndArg<Rune>(r'b')
    list.printIntAndArg<Bool, UInt64>(true, 64)
    var hm: HM1<String, Int64> = HM1<String, Int64>(("a", 1), ("b", 2))
    hm.printIntAndArg<String>("cnagjie")
    var hs: HSet<Int64> = HSet<Int64>([1, 2, 3])
    hs.printIntAndArg<Rune>(r'b')
    hs.printIntAndArg<Float32, UInt32>(32.32, 32)
    var cp: CP1<Int64> = CP1<Int64>()
    cp.printIntAndArg<Int32>(32)
    return 0
}
