// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT:scan class overload: ***/%+-<<>>&^| class end
// ASSERT:scan interface overload: ***/%+-<<>>&^| interface end
// ASSERT:scan struct overload: ***/%+-<<>>&^| struct end
// ASSERT:scan enum overload: ***/%+-<<>>&^| enum end
// ASSERT:scan extend overload: ***/%+-<<>>&^| extend end

class C <: I {
    public operator func **(a: Int8) {
        print("**");
        C()
    }
    public operator func *(a: Int16) {
        print("*");
        C()
    }
    public operator func /(a: Int32) {
        print("/");
        C()
    }
    public operator func %(a: Int64) {
        print("%");
        C()
    }
    public operator func +(a: UInt8) {
        print("+");
        C()
    }
    public operator func -(a: UInt16) {
        print("-");
        C()
    }
    public operator func <<(a: UInt32) {
        print("<<");
        C()
    }
    public operator func >>(a: UInt64) {
        print(">>");
        C()
    }
    public operator func &(a: Unit) {
        print("&");
        C()
    }
    public operator func ^(a: String) {
        print("^");
        C()
    }
    public operator func |(a: Rune) {
        print("|");
        C()
    }
}

interface I {
    operator func **(a: Int8) {
        print("**");
        C()
    }
    operator func *(a: Int16) {
        print("*");
        C()
    }
    operator func /(a: Int32) {
        print("/");
        C()
    }
    operator func %(a: Int64) {
        print("%");
        C()
    }
    operator func +(a: UInt8) {
        print("+");
        C()
    }
    operator func -(a: UInt16) {
        print("-");
        C()
    }
    operator func <<(a: UInt32) {
        print("<<");
        C()
    }
    operator func >>(a: UInt64) {
        print(">>");
        C()
    }
    operator func &(a: Unit) {
        print("&");
        C()
    }
    operator func ^(a: String) {
        print("^");
        C()
    }
    operator func |(a: Rune) {
        print("|");
        C()
    }
}

struct R {
    public operator func **(a: Int8) {
        print("**");
        R()
    }
    public operator func *(a: Int16) {
        print("*");
        R()
    }
    public operator func /(a: Int32) {
        print("/");
        R()
    }
    public operator func %(a: Int64) {
        print("%");
        R()
    }
    public operator func +(a: UInt8) {
        print("+");
        R()
    }
    public operator func -(a: UInt16) {
        print("-");
        R()
    }
    public operator func <<(a: UInt32) {
        print("<<");
        R()
    }
    public operator func >>(a: UInt64) {
        print(">>");
        R()
    }
    public operator func &(a: Unit) {
        print("&");
        R()
    }
    public operator func ^(a: String) {
        print("^");
        R()
    }
    public operator func |(a: Rune) {
        print("|");
        R()
    }
}

enum E {
    x

    public operator func **(a: Int8) {
        print("**");
        x
    }
    public operator func *(a: Int16) {
        print("*");
        x
    }
    public operator func /(a: Int32) {
        print("/");
        x
    }
    public operator func %(a: Int64) {
        print("%");
        x
    }
    public operator func +(a: UInt8) {
        print("+");
        x
    }
    public operator func -(a: UInt16) {
        print("-");
        x
    }
    public operator func <<(a: UInt32) {
        print("<<");
        x
    }
    public operator func >>(a: UInt64) {
        print(">>");
        x
    }
    public operator func &(a: Unit) {
        print("&");
        x
    }
    public operator func ^(a: String) {
        print("^");
        x
    }
    public operator func |(a: Rune) {
        print("|");
        x
    }
}

interface II {}

enum EE {
    x
}

extend EE <: II {
    public operator func **(a: Int8) {
        print("**");
        x
    }
    public operator func *(a: Int16) {
        print("*");
        x
    }
    public operator func /(a: Int32) {
        print("/");
        x
    }
    public operator func %(a: Int64) {
        print("%");
        x
    }
    public operator func +(a: UInt8) {
        print("+");
        x
    }
    public operator func -(a: UInt16) {
        print("-");
        x
    }
    public operator func <<(a: UInt32) {
        print("<<");
        x
    }
    public operator func >>(a: UInt64) {
        print(">>");
        x
    }
    public operator func &(a: Unit) {
        print("&");
        x
    }
    public operator func ^(a: String) {
        print("^");
        x
    }
    public operator func |(a: Rune) {
        print("|");
        x
    }
}

class Cls {
    public var c: C = C()
    public var i: I = C()
    public var r: R = R()
    public var e: E = x
    public var ee: EE = x
}

main() {
    var cls = Cls()

    print("class overload: ")
    cls.c **= 2
    cls.c *= 2
    cls.c /= 2
    cls.c %= 2
    cls.c += 2
    cls.c -= 2
    cls.c <<= 2
    cls.c >>= 2
    cls.c &= ()
    cls.c ^= "t"
    cls.c |= r't'
    print(" class end\n")

    print("interface overload: ")
    cls.i **= 2
    cls.i *= 2
    cls.i /= 2
    cls.i %= 2
    cls.i += 2
    cls.i -= 2
    cls.i <<= 2
    cls.i >>= 2
    cls.i &= ()
    cls.i ^= "t"
    cls.i |= r't'
    print(" interface end\n")

    print("struct overload: ")
    cls.r **= 2
    cls.r *= 2
    cls.r /= 2
    cls.r %= 2
    cls.r += 2
    cls.r -= 2
    cls.r <<= 2
    cls.r >>= 2
    cls.r &= ()
    cls.r ^= "t"
    cls.r |= r't'
    print(" struct end\n")

    print("enum overload: ")
    cls.e **= 2
    cls.e *= 2
    cls.e /= 2
    cls.e %= 2
    cls.e += 2
    cls.e -= 2
    cls.e <<= 2
    cls.e >>= 2
    cls.e &= ()
    cls.e ^= "t"
    cls.e |= r't'
    print(" enum end\n")

    print("extend overload: ")
    cls.ee **= 2
    cls.ee *= 2
    cls.ee /= 2
    cls.ee %= 2
    cls.ee += 2
    cls.ee -= 2
    cls.ee <<= 2
    cls.ee >>= 2
    cls.ee &= ()
    cls.ee ^= "t"
    cls.ee |= r't'
    print(" extend end\n")

    return 0
}
