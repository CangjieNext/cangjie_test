/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt -Woff unused -Woff deprecated -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// @CHIRPlugin on a class whose body covers many token kinds for toTokens

/* SCAN
name: TokenPlugin
run: true
*/

import stdx.plugin.*
import stdx.chir.*
import std.sync.*
import std.ast.*

interface Marker {}
interface GenI<T> {}

@CHIRPlugin
public open class TokenPlugin <: Marker & GenI<Int64> {
    /** doc comment */
    @Deprecated
    public var x: Int8 = 1
    public let y: UInt64 = 2
    public static const z: Float32 = 3.0
    private var hide: Int16 = 0
    protected var mid: Int32 = 0
    internal var inn: Float64 = 0.0
    public mut prop p: Int64 {
        get() {
            Int64(this.x)
        }
        set(v) {
            this.x = Int8(v)
        }
    }
    public static func dummy(): Int64 {
        1
    }
    public operator func +(rhs: TokenPlugin): TokenPlugin {
        this.x = this.x + rhs.x
        this
    }
    public func kitchen(a: UInt8, b: UInt16, c: UInt32, d: Float16, e: Rune, f: Bool): Unit {
        var y: Int64 = 1
        let native: IntNative = 1
        let _ = native
        y += 1
        y -= 1
        y *= 2
        y /= 2
        y %= 2
        y **= 1
        var bits: Int64 = 1
        bits <<= 2
        bits >>= 1
        bits &= 3
        bits |= 1
        bits ^= 0
        let arith = 1 + 2 * 3 / 4 % 5 - 0
        let powv = 2 ** 3
        let sh = 1 << 2 >> 1
        let bw = 1 & 2 | 3 ^ 4
        let bn = !false
        let logic = !false && true || false
        let cmp = y > 0 && y >= 0 && y < 10 && y <= 10 && y == 1 && y != 0
        let opt: ?Int64 = None
        let coal = opt ?? 0
        let tup = (1, "x")
        let arr = [1, 2, 3]
        let rng = 0..3
        let crng = 0..=2
        if (cmp) {
            ()
        } else {
            ()
        }
        match (y) {
            case 1 => ()
            case _ => ()
        }
        for (i in rng) {
            if (i == 1) {
                continue
            }
            if (i == 2) {
                break
            }
        }
        while (false) {
            break
        }
        do {
            ()
        } while (false)
        try {
            throw Exception("x")
        } catch (exc: Exception) {
            let _ = exc
        } finally {
            ()
        }
        let lam = { => 1 }
        let _ = 1 as Int64
        if (true is Bool) {
            ()
        }
        unsafe {
            ()
        }
        let r = r'a'
        let s = "s"
        let ml = """
        m
        """
        let raw = #"""
        r
        """#
        let b1 = true
        let b0 = false
        let _ = this
        let _ = a
        let _ = b
        let _ = c
        let _ = d
        let _ = e
        let _ = f
        let _ = arith
        let _ = powv
        let _ = sh
        let _ = bw
        let _ = bn
        let _ = logic
        let _ = coal
        let _ = tup
        let _ = arr
        let _ = crng
        let _ = lam
        let _ = r
        let _ = s
        let _ = ml
        let _ = raw
        let _ = b1
        let _ = b0
        let _ = bits
        return
    }
    public func more(): Unit {
        let q = quote(1 + 2)
        let _ = q
        let mtx = Mutex()
        synchronized(mtx) {
            ()
        }
        spawn { =>
            ()
        }
        var pval: Int64 = 1
        pval += dummy()
        this.p = pval
        let pipe = 1 |> { v: Int64 => v + 1 }
        let _ = pipe
        let noneVal: ?Int64 = None
        if (let Some(v) <- noneVal) {
            let _ = v
        }
    }
    public override func run(pkg: Package): Bool {
        this.kitchen(1, 2, 3, Float16(1.0), r'x', true)
        this.more()
        let _ = pkg
        true
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let p = TokenPlugin()
    println("name: ${p.name}")
    println("run: ${p.run(pkg)}")
}
