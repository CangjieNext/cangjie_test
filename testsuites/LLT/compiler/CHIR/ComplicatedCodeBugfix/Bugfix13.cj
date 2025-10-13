// LEVEL: 0
// EXEC-PIPE-1: %compiler %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan array index is out of bounds

var a: Int8 = 6
var b: Int16 = 7
var c: UInt64 = 1
var d = false
let f: UInt16 = 3
var g = 9
var h = 0
var j: UInt16 = 9
var k: UInt32 = 6
let l: Array<Bool> = []
let m = ()
let n = 105.0
let o = 5
let p: Option<Option<Unit>> = None
let q = false
let r: (Int16,Unit,UInt32,UInt64,Int16,String,Unit,Float64,UInt32) = (3, (), 6, 9, 2, "", (), 40.0, 2)
let s = UInt32(5)
let t = Int16(1)
let u = aa<Option<Range<UInt8>>, Option<UInt16>>()
let v = true
interface x {
    func w(ab!: ac): Int64
}
interface ac {}
class aa<ad, ae> <: x & ac {
    public func w(ab!: ac) {
        0
    }
}
struct af {
    let ag: (Array<Unit>,x) = ([], aa<Option<Range<UInt8>>, Option<UInt16>>())
}
func ah(): (Unit,((Float64,Int64,UInt16,Range<Int64>)),Float64,Float64,Int8) {
    if (try {
        var ai = false
        if (ai) {
            [false]
        } else {
            l
        }
    } catch (e: Exception) {
        let aj = 0 is Int64
        if (d) {
            l
        } else {
            [aj]
        }
    }[0]) {
        var ak: Array<(Unit,((Float64,Int64,UInt16,Range<Int64>)),Float64,Float64,Int8)> = 
            Array<(Unit,((Float64,Int64,UInt16,Range<Int64>)),Float64,Float64,Int8)>(0) {i => ((), (45.0, 9, 5, 127..12701), 51.0, 21.0, 4)}

        ak[7]
    } else {
        (m, (n, g, f, 127..127), 54.0, n, 6)
    }
}
func y(): Option<Option<Option<Unit>>> {
    var z: ?Option<Option<Unit>> = None
    try {
        match (o) {
            case a =>
                if (true) {
                    p
                } else {
                    Option.Some(None)
                }
        }
    } catch (e: Exception) {
        try {
            if (d) {
                None
            } else {
                z
            }
        } finally {}
    }
}
func al(): Array<Unit> {
    let am = af()
    let an: UInt32 = 0
    func ao(
        aq!: Option<Array<Unit>>,
        ar!: Range<UInt32>,
        optionalParam44!: Option<Array<Unit>> = Option.Some([])
    ) {
        func func75(
            param76: Int8,
            namedParam89!: Int64,
            namedParam90!: (Int16,Unit,UInt32,UInt64,Int16,String,Unit,Float64,UInt32)
        ) {
            am.ag[1]
        }
        let var110 = (true, .16, "", .0, 9)
        let var147 = ()
        let var157 = 43.0
        func75(
            if (var110[0]) {
                1
            } else {
                8
            },
            namedParam89: func75(a, namedParam89: 0, namedParam90: (b, var147, 5, c, 0, "", var147, var157, an)).w(
                ab: u),
            namedParam90: try {
                r
            } catch (e: Exception) {
                r
            }
        )
        try {
            if (true) {
                (q, .1671, "", .74, h)
            } else {
                var110
            }
        } finally {}
    }
    if (ao(aq: Option<Array<Unit>>.None, ar: 127..k)[0]) {}
    match {
        case _ => []
    }
}
func func9(param10: UInt16): (Int16,Unit,UInt32,UInt64,Int16,String,Unit,Float64,UInt32) {
    al()
    (t, (), match {
            case _ => s
        }, try {
            3
        } finally {}, match {
            case _ => b
        }, match {
            case _ => ""
        }, (), 54.0, if (v) {
            7
        } else {
            1
        })
}
main() {
    try {
        let var4371: (UInt16) -> (Int16,Unit,UInt32,UInt64,Int16,String,Unit,Float64,UInt32) = func9
        j |> var4371
        match {
            case _ => m
        }
    } catch (e: NoneValueException) {}
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
