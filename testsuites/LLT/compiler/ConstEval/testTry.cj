// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b1` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b2` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b3` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b4` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b5` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b6` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b7` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b8` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b9` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b10` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b11` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b12` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b13` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b14` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b15` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_b16` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_c` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Test constant evaluation in try blocks.

const func operationsInt8(x: Int8, y: Int8): Int8 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let a8 = -a7
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a8
    } catch (_) {
        return 0
    }
}

const func operationsUInt8(x: UInt8, y: UInt8): UInt8 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let zero = 0u8
        let a8 = -zero
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a7 + a8
    } catch (_) {
        return 0
    }
}

const func operationsInt16(x: Int16, y: Int16): Int16 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let a8 = -a7
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a8
    } catch (_) {
        return 0
    }
}

const func operationsUInt16(x: UInt16, y: UInt16): UInt16 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let zero = 0u16
        let a8 = -zero
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a7 + a8
    } catch (_) {
        return 0
    }
}

const func operationsInt32(x: Int32, y: Int32): Int32 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let a8 = -a7
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a8
    } catch (_) {
        return 0
    }
}

const func operationsUInt32(x: UInt32, y: UInt32): UInt32 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let zero = 0u32
        let a8 = -zero
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a7 + a8
    } catch (_) {
        return 0
    }
}

const func operationsInt64(x: Int64, y: Int64): Int64 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let a8 = a7 ** 3u64
        let a9 = -a8
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a9
    } catch (_) {
        return 0
    }
}

const func operationsUInt64(x: UInt64, y: UInt64): UInt64 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let zero = 0u64
        let a8 = -zero
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a7 + a8
    } catch (_) {
        return 0
    }
}

const func operationsIntNative(x: IntNative, y: IntNative): IntNative {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let a8 = -a7
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a8
    } catch (_) {
        return 0
    }
}

const func operationsUIntNative(x: UIntNative, y: UIntNative): UIntNative {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 % y
        let a6 = a5 << y
        let a7 = a6 >> y
        let zero: UIntNative = 0
        let a8 = -zero
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0
        }
        if (a5 != a7) {
            return 0
        }
        a7 + a8
    } catch (_) {
        return 0
    }
}

const func operationsFloat32(x: Float32, y: Float32): Float32 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = -a4
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0.0
        }
        if (a3 != a3) {
            return 0.0
        }
        a5
    } catch (_) {
        return 0.0
    }
}

const func operationsFloat64(x: Float64, y: Float64): Float64 {
    try {
        let a1 = x + y
        let a2 = a1 - y
        let a3 = a2 * y
        let a4 = a3 / y
        let a5 = a4 ** y
        let a6 = a4 ** 2i64
        let a7 = -a6
        if (a1 == a2 || a1 < a2 || a1 <= a2 || a2 > a1 || a2 >= a1) {
            return 0.0
        }
        if (a3 != a3) {
            return 0.0
        }
        a7
    } catch (_) {
        return 0.0
    }
}

const func operationsBool(x: Bool, y: Bool): Bool {
    try {
        if (x == y) {
            return false
        }
        if (x != y) {
            return true
        }
        false
    } catch (_) {
        return false
    }
}

const func operationsRune(x: Rune, y: Rune): Rune {
    try {
        if (x == y || x < y || x <= y || y > x || y >= x) {
            return r'X'
        }
        if (x != y) {
            return r'O'
        }
        r'X'
    } catch (_) {
        return r'X'
    }
}

const func apply(x: Int64) : Int64 {
    try {
        operationsInt64(x, 1)
    } catch (_) {
        return 0
    }
}

const func tryShiftLeft(x1: Int8, x2: Int16, x3: Int32, x4 : Int64, x5: IntNative,
        x6: UInt8, x7: UInt16, x8: UInt32, x9: UInt64, x10: UIntNative): Int64 {
    try {
        let a1 = x1 << x1
        let a2 = x1 << x2
        let a3 = x1 << x3
        let a4 = x1 << x4
        let a5 = x1 << x5
        let a6 = x1 << x6
        let a7 = x1 << x7
        let a8 = x1 << x8
        let a9 = x1 << x9
        let a10 = x1 << x10

        let b1 = x2 << x1
        let b2 = x2 << x2
        let b3 = x2 << x3
        let b4 = x2 << x4
        let b5 = x2 << x5
        let b6 = x2 << x6
        let b7 = x2 << x7
        let b8 = x2 << x8
        let b9 = x2 << x9
        let b10 = x2 << x10

        let c1 = x3 << x1
        let c2 = x3 << x2
        let c3 = x3 << x3
        let c4 = x3 << x4
        let c5 = x3 << x5
        let c6 = x3 << x6
        let c7 = x3 << x7
        let c8 = x3 << x8
        let c9 = x3 << x9
        let c10 = x3 << x10

        let d1 = x4 << x1
        let d2 = x4 << x2
        let d3 = x4 << x3
        let d4 = x4 << x4
        let d5 = x4 << x5
        let d6 = x4 << x6
        let d7 = x4 << x7
        let d8 = x4 << x8
        let d9 = x4 << x9
        let d10 = x4 << x10

        let e1 = x5 << x1
        let e2 = x5 << x2
        let e3 = x5 << x3
        let e4 = x5 << x4
        let e5 = x5 << x5
        let e6 = x5 << x6
        let e7 = x5 << x7
        let e8 = x5 << x8
        let e9 = x5 << x9
        let e10 = x5 << x10

        let f1 = x6 << x1
        let f2 = x6 << x2
        let f3 = x6 << x3
        let f4 = x6 << x4
        let f5 = x6 << x5
        let f6 = x6 << x6
        let f7 = x6 << x7
        let f8 = x6 << x8
        let f9 = x6 << x9
        let f10 = x6 << x10

        let g1 = x7 << x1
        let g2 = x7 << x2
        let g3 = x7 << x3
        let g4 = x7 << x4
        let g5 = x7 << x5
        let g6 = x7 << x6
        let g7 = x7 << x7
        let g8 = x7 << x8
        let g9 = x7 << x9
        let g10 = x7 << x10

        let h1 = x8 << x1
        let h2 = x8 << x2
        let h3 = x8 << x3
        let h4 = x8 << x4
        let h5 = x8 << x5
        let h6 = x8 << x6
        let h7 = x8 << x7
        let h8 = x8 << x8
        let h9 = x8 << x9
        let h10 = x8 << x10

        let i1 = x9 << x1
        let i2 = x9 << x2
        let i3 = x9 << x3
        let i4 = x9 << x4
        let i5 = x9 << x5
        let i6 = x9 << x6
        let i7 = x9 << x7
        let i8 = x9 << x8
        let i9 = x9 << x9
        let i10 = x9 << x10

        let j1 = x10 << x1
        let j2 = x10 << x2
        let j3 = x10 << x3
        let j4 = x10 << x4
        let j5 = x10 << x5
        let j6 = x10 << x6
        let j7 = x10 << x7
        let j8 = x10 << x8
        let j9 = x10 << x9
        let j10 = x10 << x10

        return 0
    } catch (_) {
        return 1
    }
}

const func tryShiftRight(x1: Int8, x2: Int16, x3: Int32, x4 : Int64, x5: IntNative,
        x6: UInt8, x7: UInt16, x8: UInt32, x9: UInt64, x10: UIntNative): Int64 {
    try {
        let a1 = x1 >> x1
        let a2 = x1 >> x2
        let a3 = x1 >> x3
        let a4 = x1 >> x4
        let a5 = x1 >> x5
        let a6 = x1 >> x6
        let a7 = x1 >> x7
        let a8 = x1 >> x8
        let a9 = x1 >> x9
        let a10 = x1 >> x10

        let b1 = x2 >> x1
        let b2 = x2 >> x2
        let b3 = x2 >> x3
        let b4 = x2 >> x4
        let b5 = x2 >> x5
        let b6 = x2 >> x6
        let b7 = x2 >> x7
        let b8 = x2 >> x8
        let b9 = x2 >> x9
        let b10 = x2 >> x10

        let c1 = x3 >> x1
        let c2 = x3 >> x2
        let c3 = x3 >> x3
        let c4 = x3 >> x4
        let c5 = x3 >> x5
        let c6 = x3 >> x6
        let c7 = x3 >> x7
        let c8 = x3 >> x8
        let c9 = x3 >> x9
        let c10 = x3 >> x10

        let d1 = x4 >> x1
        let d2 = x4 >> x2
        let d3 = x4 >> x3
        let d4 = x4 >> x4
        let d5 = x4 >> x5
        let d6 = x4 >> x6
        let d7 = x4 >> x7
        let d8 = x4 >> x8
        let d9 = x4 >> x9
        let d10 = x4 >> x10

        let e1 = x5 >> x1
        let e2 = x5 >> x2
        let e3 = x5 >> x3
        let e4 = x5 >> x4
        let e5 = x5 >> x5
        let e6 = x5 >> x6
        let e7 = x5 >> x7
        let e8 = x5 >> x8
        let e9 = x5 >> x9
        let e10 = x5 >> x10

        let f1 = x6 >> x1
        let f2 = x6 >> x2
        let f3 = x6 >> x3
        let f4 = x6 >> x4
        let f5 = x6 >> x5
        let f6 = x6 >> x6
        let f7 = x6 >> x7
        let f8 = x6 >> x8
        let f9 = x6 >> x9
        let f10 = x6 >> x10

        let g1 = x7 >> x1
        let g2 = x7 >> x2
        let g3 = x7 >> x3
        let g4 = x7 >> x4
        let g5 = x7 >> x5
        let g6 = x7 >> x6
        let g7 = x7 >> x7
        let g8 = x7 >> x8
        let g9 = x7 >> x9
        let g10 = x7 >> x10

        let h1 = x8 >> x1
        let h2 = x8 >> x2
        let h3 = x8 >> x3
        let h4 = x8 >> x4
        let h5 = x8 >> x5
        let h6 = x8 >> x6
        let h7 = x8 >> x7
        let h8 = x8 >> x8
        let h9 = x8 >> x9
        let h10 = x8 >> x10

        let i1 = x9 >> x1
        let i2 = x9 >> x2
        let i3 = x9 >> x3
        let i4 = x9 >> x4
        let i5 = x9 >> x5
        let i6 = x9 >> x6
        let i7 = x9 >> x7
        let i8 = x9 >> x8
        let i9 = x9 >> x9
        let i10 = x9 >> x10

        let j1 = x10 >> x1
        let j2 = x10 >> x2
        let j3 = x10 >> x3
        let j4 = x10 >> x4
        let j5 = x10 >> x5
        let j6 = x10 >> x6
        let j7 = x10 >> x7
        let j8 = x10 >> x8
        let j9 = x10 >> x9
        let j10 = x10 >> x10

        return 0
    } catch (_) {
        return 1
    }
}

const b1 = operationsInt8(2, 3)
const b2 = operationsInt16(2, 3)
const b3 = operationsInt32(2, 3)
const b4 = operationsInt64(2, 3)
const b5 = operationsUInt8(2, 3)
const b6 = operationsUInt16(2, 3)
const b7 = operationsUInt32(2, 3)
const b8 = operationsUInt64(2, 3)
const b9 = operationsIntNative(2, 3)
const b10 = operationsUIntNative(2, 3)
const b11 = operationsFloat32(2.1, 3.0)
const b12 = operationsFloat64(2.1, 3.0)
const b13 = operationsBool(true, false)
const b14 = operationsRune(r'B', r'A')
const b15 = tryShiftLeft(2, 3, 4, 5, 6, 2, 3, 4, 5, 6)
const b16 = tryShiftRight(2, 3, 4, 5, 6, 2, 3, 4, 5, 6)

const c = apply(2)

main() {}
