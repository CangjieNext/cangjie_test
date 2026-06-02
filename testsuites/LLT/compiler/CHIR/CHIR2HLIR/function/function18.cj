// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 125
// ASSERT: scan 95

var a = classA112()
var ddd: Range<Int16> = 125..95
var c = true
var f = g()
let j = true
let k: Option<Option<Unit>> = None
let h = ()
let l = false

class classA112 {
    public let m: Option<Option<Unit>> = None
    public let ab123 = 37
    public func func456(): (Range<Int16>, Array<Unit>) {
        (try {
                if (false) {
                    128..75
                } else {
                    ddd
                }
            } catch (e: Exception) {
                67..112
            }, match {
                case _ => []
            })
    }
}

main() {
    println(classA112().func456()[0].start)
    println(classA112().func456()[0].end)
    var range = classA112().func456()[0]
    if (range.start != 125) {
        return 1
    }
    if (range.end != 95) {
        return 2
    }
    return 0
}

struct g {}

func aj(): Option<Option<Unit>> {
    try {
        a.m
    } catch (_) {
        try {
            if (j) {
                k
            } else {
                Some(h)
            }
        } catch (e: Exception) {
            if (l) {
                Some(h)
            } else {
                None
            }
        }
    }
}

func ak() {
    try {
        if (true) {
            g()
        } else {
            f
        }
    } catch (e: Exception) {
        g()
    }
    func al() {
        let ao: (UInt64, String, Array<UInt64>, UInt32, Range<Int64>) = (5, "", [], 3, 39..7)
        f |> {
            ap: g => if (try {
                l
            } catch (_) {
                ao
                c
            }) {
                var aq = 131..9
                for (i in aq) {}
            }
        }
    }
    al
}
