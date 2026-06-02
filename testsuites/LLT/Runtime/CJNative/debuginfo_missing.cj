// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %int_overflow_opt=wrapping %enableO2 -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a = false
var b: UInt64 = 3
var c = 0 is d
var f = true

interface g {}

class d <: g {}

enum aa {
    h
}

func i(): Array<d> {
    try {
        match {
            case _ => []
        }
    } finally {}
}

func ab(): Option<UInt16> {
    func ac(ad: Int8, ae!: g, j!: Range<UInt64>, k!: Range<Int8>): Option<Array<Int64>> {
        []
    }
    var l = d()
    let m: Range<Int8> = 127..1
    ac(0, ae: match {
        case _ => if (c) {
            d()
        } else {
            l
        }
    }, j: if (a) {
        127..127
    } else {
        127..77
    }, k: try {
        if (f) {
            m
        } else {
            127..127
        }
    } catch (_) {
        if (a) {
            127..127
        } else {
            127..14
        }
    })?[match (h) {
            case z => 1 ** (8)
        }]
    None
}

func n(o!: Range<Int64>, p!: Range<Int32>, q!: Unit) {
    func r(s!: Range<UInt16>, t!: UInt16, af!: UInt32, u!: Rune) {
        var v: (Range<Int32>, (Range<UInt64>, String, Float64, Bool, (Int16, Unit, Bool, Int32, Unit), Range<UInt64>, 
            String), Range<Int8>, Array<Int64>, Range<UInt32>, Range<Int16>) = (127..87, (127..198, "", 36.0, true, (1,
                    (), false, 3, ()), 127..UInt64(9), ""), 127..Int8(Int64(7)), [], 127..30181, 127..401)
        [match {
            case _ => 177
        } ** if (f) {
            9
        } else {
            b
        }]
    }
    let w: UInt32 = 0
    [r(s: 127..12901, t: 2, af: w, u: r'2'), match {
        case _ => if (f) {}
    }]
}

func x(y: UInt16) {
    n(o: 74127..127, p: 127..1051171, q: ())
}

main() {
    try {
        try {
            6
        } finally {} |> x
    } catch (e: NoneValueException) {}
    0
}
