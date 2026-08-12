/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.collection.ArrayList
import std.math.floor
import std.math.pow
import std.math.log
import std.random.Random
import std.time.DateTime
import std.convert.*
import std.convert.*

open class Crypto <: Hashable & ToString {
    init() { }

    static let CRYPTO_NUMBER_0XFFFFFF = 16777215i64

    static let CRYPTO_NUMBER_0XEFCAFE = 15715070i64

    static let CRYPTO_NUMBER_0 = 0i64

    static let CRYPTO_NUMBER_1 = 1i64

    static let CRYPTO_NUMBER_2 = 2i64

    static let CRYPTO_NUMBER_3 = 3i64

    static let CRYPTO_NUMBER_5 = 5i64

    static let CRYPTO_NUMBER_7 = 7i64

    static let CRYPTO_NUMBER_11 = 11i64

    static let CRYPTO_NUMBER_13 = 13i64

    static let CRYPTO_NUMBER_17 = 17i64

    static let CRYPTO_NUMBER_19 = 19i64

    static let CRYPTO_NUMBER_23 = 23i64

    static let CRYPTO_NUMBER_29 = 29i64

    static let CRYPTO_NUMBER_31 = 31i64

    static let CRYPTO_NUMBER_37 = 37i64

    static let CRYPTO_NUMBER_41 = 41i64

    static let CRYPTO_NUMBER_43 = 43i64

    static let CRYPTO_NUMBER_47 = 47i64

    static let CRYPTO_NUMBER_53 = 53i64

    static let CRYPTO_NUMBER_59 = 59i64

    static let CRYPTO_NUMBER_61 = 61i64

    static let CRYPTO_NUMBER_67 = 67i64

    static let CRYPTO_NUMBER_71 = 71i64

    static let CRYPTO_NUMBER_73 = 73i64

    static let CRYPTO_NUMBER_79 = 79i64

    static let CRYPTO_NUMBER_83 = 83i64

    static let CRYPTO_NUMBER_89 = 89i64

    static let CRYPTO_NUMBER_97 = 97i64

    static let CRYPTO_NUMBER_101 = 101i64

    static let CRYPTO_NUMBER_103 = 103i64

    static let CRYPTO_NUMBER_107 = 107i64

    static let CRYPTO_NUMBER_109 = 109i64

    static let CRYPTO_NUMBER_113 = 113i64

    static let CRYPTO_NUMBER_127 = 127i64

    static let CRYPTO_NUMBER_131 = 131i64

    static let CRYPTO_NUMBER_137 = 137i64

    static let CRYPTO_NUMBER_139 = 139i64

    static let CRYPTO_NUMBER_149 = 149i64

    static let CRYPTO_NUMBER_151 = 151i64

    static let CRYPTO_NUMBER_157 = 157i64

    static let CRYPTO_NUMBER_163 = 163i64

    static let CRYPTO_NUMBER_167 = 167i64

    static let CRYPTO_NUMBER_173 = 173i64

    static let CRYPTO_NUMBER_179 = 179i64

    static let CRYPTO_NUMBER_181 = 181i64

    static let CRYPTO_NUMBER_191 = 191i64

    static let CRYPTO_NUMBER_193 = 193i64

    static let CRYPTO_NUMBER_197 = 197i64

    static let CRYPTO_NUMBER_199 = 199i64

    static let CRYPTO_NUMBER_211 = 211i64

    static let CRYPTO_NUMBER_223 = 223i64

    static let CRYPTO_NUMBER_227 = 227i64

    static let CRYPTO_NUMBER_229 = 229i64

    static let CRYPTO_NUMBER_233 = 233i64

    static let CRYPTO_NUMBER_239 = 239i64

    static let CRYPTO_NUMBER_241 = 241i64

    static let CRYPTO_NUMBER_251 = 251i64

    static let CRYPTO_NUMBER_257 = 257i64

    static let CRYPTO_NUMBER_263 = 263i64

    static let CRYPTO_NUMBER_269 = 269i64

    static let CRYPTO_NUMBER_271 = 271i64

    static let CRYPTO_NUMBER_277 = 277i64

    static let CRYPTO_NUMBER_281 = 281i64

    static let CRYPTO_NUMBER_283 = 283i64

    static let CRYPTO_NUMBER_293 = 293i64

    static let CRYPTO_NUMBER_307 = 307i64

    static let CRYPTO_NUMBER_311 = 311i64

    static let CRYPTO_NUMBER_313 = 313i64

    static let CRYPTO_NUMBER_317 = 317i64

    static let CRYPTO_NUMBER_331 = 331i64

    static let CRYPTO_NUMBER_337 = 337i64

    static let CRYPTO_NUMBER_347 = 347i64

    static let CRYPTO_NUMBER_349 = 349i64

    static let CRYPTO_NUMBER_353 = 353i64

    static let CRYPTO_NUMBER_359 = 359i64

    static let CRYPTO_NUMBER_367 = 367i64

    static let CRYPTO_NUMBER_373 = 373i64

    static let CRYPTO_NUMBER_379 = 379i64

    static let CRYPTO_NUMBER_383 = 383i64

    static let CRYPTO_NUMBER_389 = 389i64

    static let CRYPTO_NUMBER_397 = 397i64

    static let CRYPTO_NUMBER_401 = 401i64

    static let CRYPTO_NUMBER_409 = 409i64

    static let CRYPTO_NUMBER_419 = 419i64

    static let CRYPTO_NUMBER_421 = 421i64

    static let CRYPTO_NUMBER_431 = 431i64

    static let CRYPTO_NUMBER_433 = 433i64

    static let CRYPTO_NUMBER_439 = 439i64

    static let CRYPTO_NUMBER_443 = 443i64

    static let CRYPTO_NUMBER_449 = 449i64

    static let CRYPTO_NUMBER_457 = 457i64

    static let CRYPTO_NUMBER_461 = 461i64

    static let CRYPTO_NUMBER_463 = 463i64

    static let CRYPTO_NUMBER_467 = 467i64

    static let CRYPTO_NUMBER_479 = 479i64

    static let CRYPTO_NUMBER_487 = 487i64

    static let CRYPTO_NUMBER_491 = 491i64

    static let CRYPTO_NUMBER_499 = 499i64

    static let CRYPTO_NUMBER_503 = 503i64

    static let CRYPTO_NUMBER_509 = 509i64

    static let CRYPTO_NUMBER_26 = 26i64

    static let CRYPTO_NUMBER_0X4000000 = 67108864i64

    static let CRYPTO_NUMBER_0X3FFFFFF = 67108863i64

    static let CRYPTO_NUMBER_0X7FFF = 32767i64

    static let CRYPTO_NUMBER_15 = 15i64

    static let CRYPTO_NUMBER_0X3FFFFFFF = 1073741823i64

    static let CRYPTO_NUMBER_30 = 30i64

    static let CRYPTO_NUMBER_0X3FFF = 16383i64

    static let CRYPTO_NUMBER_14 = 14i64

    static let CRYPTO_NUMBER_28 = 28i64

    static let CRYPTO_NUMBER_0XFFFFFFF = 268435455i64

    static let CRYPTO_NUMBER_0X1FFF = 8191i64

    static let CRYPTO_NUMBER_52 = 52i64

    static let CRYPTO_NUMBER_9 = 9i64

    static let CRYPTO_NUMBER_36 = 36i64

    static let CRYPTO_NUMBER_256 = 256i64

    static let CRYPTO_NUMBER_16 = 16i64

    static let CRYPTO_NUMBER_4 = 4i64

    static let CRYPTO_NUMBER_8 = 8i64

    static let CRYPTO_NUMBER_32 = 32i64

    static let CRYPTO_NUMBER_0XFF = 255i64

    static let CRYPTO_NUMBER_0X80 = 128i64

    static let CRYPTO_NUMBER_0XF = 15i64

    static let CRYPTO_NUMBER_0XFFFF = 65535i64

    static let CRYPTO_NUMBER_0XFFFFFFFF = 4294967295

    static let CRYPTO_NUMBER_24 = 24i64

    static let CRYPTO_NUMBER_10 = 10i64

    static let CRYPTO_NUMBER_18 = 18i64

    static let CRYPTO_NUMBER_48 = 48i64

    static let CRYPTO_NUMBER_144 = 144i64

    static let CRYPTO_NUMBER_768 = 768i64

    static let CRYPTO_NUMBER_6 = 6i64

    static let CRYPTO_NUMBER_255 = 255i64

    static let CRYPTO_NUMBER_1122926989487 = 1122926989487

    static let CRYPTO_NUMBER_65536 = 65536i64

    static let CRYPTO_NUMBER_0X10 = 16i64

    static let CRYPTO_NUMBER_1000 = 1000i64

    static let CRYPTO_RUNCOUNT_120 = 120i64

    static var dbits: Int64 = 0

    static var bIDB: Int64 = 0

    static var bIDM: Int64 = 0

    static var bIDV: Int64 = 0

    static var bIFP: Int64 = 0

    static var bIFV: Int64 = 0

    static var bIF1: Int64 = 0

    static var bIF2: Int64 = 0

    static var dv = 0i64

    var canary = 244837814094590

    var jLm = (canary & CRYPTO_NUMBER_0XFFFFFF) == CRYPTO_NUMBER_0XEFCAFE

    static var lowprimes: ?Array<Int64> = [CRYPTO_NUMBER_2, CRYPTO_NUMBER_3, CRYPTO_NUMBER_5, CRYPTO_NUMBER_7, CRYPTO_NUMBER_11, CRYPTO_NUMBER_13, CRYPTO_NUMBER_17, CRYPTO_NUMBER_19, CRYPTO_NUMBER_23, CRYPTO_NUMBER_29, CRYPTO_NUMBER_31, CRYPTO_NUMBER_37, CRYPTO_NUMBER_41, CRYPTO_NUMBER_43, CRYPTO_NUMBER_47, CRYPTO_NUMBER_53, CRYPTO_NUMBER_59, CRYPTO_NUMBER_61, CRYPTO_NUMBER_67, CRYPTO_NUMBER_71, CRYPTO_NUMBER_73, CRYPTO_NUMBER_79, CRYPTO_NUMBER_83, CRYPTO_NUMBER_89, CRYPTO_NUMBER_97, CRYPTO_NUMBER_101, CRYPTO_NUMBER_103, CRYPTO_NUMBER_107, CRYPTO_NUMBER_109, CRYPTO_NUMBER_113, CRYPTO_NUMBER_127, CRYPTO_NUMBER_131, CRYPTO_NUMBER_137, CRYPTO_NUMBER_139, CRYPTO_NUMBER_149, CRYPTO_NUMBER_151, CRYPTO_NUMBER_157, CRYPTO_NUMBER_163, CRYPTO_NUMBER_167, CRYPTO_NUMBER_173, CRYPTO_NUMBER_179, CRYPTO_NUMBER_181, CRYPTO_NUMBER_191, CRYPTO_NUMBER_193, CRYPTO_NUMBER_197, CRYPTO_NUMBER_199, CRYPTO_NUMBER_211, CRYPTO_NUMBER_223, CRYPTO_NUMBER_227, CRYPTO_NUMBER_229, CRYPTO_NUMBER_233, CRYPTO_NUMBER_239, CRYPTO_NUMBER_241, CRYPTO_NUMBER_251, CRYPTO_NUMBER_257, CRYPTO_NUMBER_263, CRYPTO_NUMBER_269, CRYPTO_NUMBER_271, CRYPTO_NUMBER_277, CRYPTO_NUMBER_281, CRYPTO_NUMBER_283, CRYPTO_NUMBER_293, CRYPTO_NUMBER_307, CRYPTO_NUMBER_311, CRYPTO_NUMBER_313, CRYPTO_NUMBER_317, CRYPTO_NUMBER_331, CRYPTO_NUMBER_337, CRYPTO_NUMBER_347, CRYPTO_NUMBER_349, CRYPTO_NUMBER_353, CRYPTO_NUMBER_359, CRYPTO_NUMBER_367, CRYPTO_NUMBER_373, CRYPTO_NUMBER_379, CRYPTO_NUMBER_383, CRYPTO_NUMBER_389, CRYPTO_NUMBER_397, CRYPTO_NUMBER_401, CRYPTO_NUMBER_409, CRYPTO_NUMBER_419, CRYPTO_NUMBER_421, CRYPTO_NUMBER_431, CRYPTO_NUMBER_433, CRYPTO_NUMBER_439, CRYPTO_NUMBER_443, CRYPTO_NUMBER_449, CRYPTO_NUMBER_457, CRYPTO_NUMBER_461, CRYPTO_NUMBER_463, CRYPTO_NUMBER_467, CRYPTO_NUMBER_479, CRYPTO_NUMBER_487, CRYPTO_NUMBER_491, CRYPTO_NUMBER_499, CRYPTO_NUMBER_503, CRYPTO_NUMBER_509]

    static var lplim = (1i64 << CRYPTO_NUMBER_26) / lowprimes.getOrThrow()[lowprimes.getOrThrow().size - 1i64]

    var am1 : (array: ArrayList<?Int64>,i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64) -> Int64 = { array, i, x, w, j, c, n =>
        var tempI = i;
        var tempJ = j;
        var tempC = c;
        var tempN = n - 1;
        while (tempN >= 0) {
            var v = x * array[tempI].getOrThrow() + w.array[tempJ].getOrThrow() + tempC;
            tempC = Int64(floor(Float64(v) / Float64(CRYPTO_NUMBER_0X4000000)));
            Benchmark.insertValue(w.array, v & CRYPTO_NUMBER_0X3FFFFFF, tempJ);
            tempI += 1;
            tempJ += 1;
            tempN -= 1;
        }
        return tempC;
    }

    var am2 : (array: ArrayList<?Int64>,i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64) -> Int64 = { array, i, x, w, j, c, n =>
        var xl = x & CRYPTO_NUMBER_0X7FFF;
        var xh = x >> CRYPTO_NUMBER_15;
        var tempI = i;
        var tempJ = j;
        var tempC = c;
        var tempN = n - 1;
        while (tempN >= 0) {
            var l = array[tempI].getOrThrow()  & CRYPTO_NUMBER_0X7FFF;
            var h = array[tempI].getOrThrow()  >> CRYPTO_NUMBER_15;
            var m = xh * l + h * xl;
            l = xl * l + ((m & CRYPTO_NUMBER_0X7FFF) << CRYPTO_NUMBER_15) + w.array[tempJ].getOrThrow() + (tempC & CRYPTO_NUMBER_0X3FFFFFFF);
            tempC = (l >> CRYPTO_NUMBER_30) + (m >> CRYPTO_NUMBER_15) + xh * h + (tempC >> CRYPTO_NUMBER_30);
            Benchmark.insertValue(w.array, l & CRYPTO_NUMBER_0X3FFFFFFF, tempJ);
            tempI += 1;
            tempJ += 1;
            tempN -= 1;
        }
        return tempC;
    }

    static var am3 : (array: ArrayList<?Int64>,i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64) -> Int64 = { array, i, x, w, j, c, n =>
        var xl = x & CRYPTO_NUMBER_0X3FFF;
        var xh = x >> CRYPTO_NUMBER_14;
        var tempI = i;
        var tempJ = j;
        var tempC = c;
        var tempN = n - 1;
        while (tempN >= 0) {
            var l = array[tempI].getOrThrow()  & CRYPTO_NUMBER_0X3FFF;
            var h = array[tempI].getOrThrow()  >> CRYPTO_NUMBER_14;
            var m = xh * l + h * xl;
            l = xl * l + ((m & CRYPTO_NUMBER_0X3FFF) << CRYPTO_NUMBER_14) + w.array[tempJ].getOrThrow() + tempC;
            tempC = (l >> CRYPTO_NUMBER_28) + (m >> CRYPTO_NUMBER_14) + xh * h;
            Benchmark.insertValue(w.array, l & CRYPTO_NUMBER_0XFFFFFFF, tempJ);
            tempI += 1;
            tempJ += 1;
            tempN -= 1;
        }
        return tempC;
    }

    var am4 : (array: ArrayList<?Int64>,i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64) -> Int64 = { array, i, x, w, j, c, n =>
        var xl = x & CRYPTO_NUMBER_0X1FFF;
        var xh = x >> CRYPTO_NUMBER_13;
        var tempI = i;
        var tempJ = j;
        var tempC = c;
        var tempN = n - 1;
        while (tempN >= 0) {
            var l = array[tempI].getOrThrow()  & CRYPTO_NUMBER_0X1FFF;
            var h = array[tempI].getOrThrow()  >> CRYPTO_NUMBER_13;
            var m = xh * l + h * xl;
            l = xl * l + ((m & CRYPTO_NUMBER_0X1FFF) << CRYPTO_NUMBER_13) + w.array[tempJ].getOrThrow() + tempC;
            tempC = (l >> CRYPTO_NUMBER_26) + (m >> CRYPTO_NUMBER_13) + xh * h;
            Benchmark.insertValue(w.array, l & CRYPTO_NUMBER_0X3FFFFFF, tempJ);
            tempI += 1;
            tempJ += 1;
            tempN -= 1;
        }
        return tempC;
    }

    static var aM: (array: ArrayList<?Int64>, i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64) -> Int64 = {array, i, x, w, j, c, n => return 0 }

    static func setupEngine(fn: (array: ArrayList<?Int64>,i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64) -> Int64, bits: Int64): Unit {
        aM = fn
        dbits = bits
        bIDB = dbits
        bIDM = (1i64 << dbits) - 1i64
        bIDV = (1i64 << dbits)
        bIFP = CRYPTO_NUMBER_52
        bIFV = Int64(pow(Float64(CRYPTO_NUMBER_2), Float64(bIFP)))
        bIF1 = bIFP - dbits
        bIF2 = CRYPTO_NUMBER_2 * dbits - bIFP
    }

    static var bIRM: String = "0123456789abcdefghijklmnopqrstuvwxyz"

    static var bIRC: ArrayList<?Int64> = ArrayList<?Int64>()

    static func initBIRC(): Unit {
        var rr: Int64 = 0
        rr = Int64("0"[0i64])
        do {
            var vv = 0i64
            while (vv <= CRYPTO_NUMBER_9) {
                Benchmark.insertValue(bIRC, vv, rr)
                rr += 1i64
                vv++
            }
        } while (false)
        rr = Int64("a"[0i64])
        do {
            var vv = CRYPTO_NUMBER_10
            while (vv < CRYPTO_NUMBER_36) {
                Benchmark.insertValue(bIRC, vv, rr)
                rr += 1i64
                vv++
            }
        } while (false)
        rr = Int64("A"[0i64])
        do {
            var vv = CRYPTO_NUMBER_10
            while (vv < CRYPTO_NUMBER_36) {
                Benchmark.insertValue(bIRC, vv, rr)
                rr += 1i64
                vv++
            }
        } while (false)
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Crypto@${0}"
    }
}

extend Crypto <: Equatable<Crypto> {
    public operator func == (that: Crypto): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Crypto): Bool {
        return !(this == that)
    }
}

class BigInteger <: Hashable & ToString {
    static var one = BigInteger.nbv(1i64)

    static var zero = BigInteger.nbv(0i64)

    var array: ArrayList<?Int64> = ArrayList<?Int64>()

    var t = 0i64

    var s = 0i64

    // static func foo(t: BigInteger, a : Int64, b : ?Any, c : ?Any) {
    //     return t.fromNumber(a, b, c)
    // }
        // (public) Constructor
    
    init() {

    }

    init(a : ?Any) {
        this(a, None, None);
    }

    init(a: ?Any , b: ?Any) {
        this(a, b, None);
    }

    init(a: ?Any , b: ?Any, c: ?Any) {
        if (a.isSome()) {
            if (let Some(a) <- (a as Int64))  {
                this.fromNumber(a, b, c)
            } else if (b.isNone() && !(a.getOrThrow() is String)) {
                this.fromString(a.getOrThrow(), Crypto.CRYPTO_NUMBER_256)
            } else {
                this.fromString(a.getOrThrow(), (b.getOrThrow() as Int64).getOrThrow())
            }
        }
    }

    static func nbi(): BigInteger {
        return BigInteger()
    }

    static func nbv(i: Int64): BigInteger {
        let r = BigInteger.nbi()
        r.fromInt(i)
        return r
    }

    public open func int2char(n: Int64): String {
        return (Rune(Crypto.bIRM[n])).toString()
    }

    public open func intAt(s: String, i: Int64): Int64 {
        let c = Crypto.bIRC[Int64(s[i])]
        return if (c.isNone()) { -1i64 } else { c.getOrThrow() }
    }

    public open func copyTo(r: BigInteger): Unit {
        var i = this.t - 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, this.array[i].getOrThrow(), i)
            i -= 1i64
        }
        r.t = this.t
        r.s = this.s
    }

    public open func fromInt(x: Int64): Unit {
        this.t = 1i64
        this.s = if (x < 0i64) { -1i64 } else { 0i64 }
        if (x > 0i64) {
            Benchmark.insertValue(this.array, x, 0i64)
        } else if (x < -1i64) {
            Benchmark.insertValue(this.array, x + Crypto.dv, 0i64)
        } else {
            this.t = 0i64
        }
    }

    public open func fromString(s: Any, b: Int64): Unit {
        let k: Int64
        if (b == Crypto.CRYPTO_NUMBER_16) {
            k = Crypto.CRYPTO_NUMBER_4
        } else if (b == Crypto.CRYPTO_NUMBER_8) {
            k = Crypto.CRYPTO_NUMBER_3
        } else if (b == Crypto.CRYPTO_NUMBER_256) {
            k = Crypto.CRYPTO_NUMBER_8
        } else if (b == Crypto.CRYPTO_NUMBER_2) {
            k = 1i64
        } else if (b == Crypto.CRYPTO_NUMBER_32) {
            k = Crypto.CRYPTO_NUMBER_5
        } else if (b == Crypto.CRYPTO_NUMBER_4) {
            k = Crypto.CRYPTO_NUMBER_2
        } else {
            this.fromRadix((s as String).getOrThrow(), b)
            return
        }
        this.t = 0i64
        this.s = 0i64
        var i: Int64 = 0
        var mi = false
        var sh = 0i64
        if (k == Crypto.CRYPTO_NUMBER_8) {
            let tempS = (s as ArrayList<?Int64>).getOrThrow()
            i = tempS.size
        } else {
            i = (s as String).getOrThrow().size
        }
        i -= 1i64
        while (i >= 0i64) {
            let x: Int64
            if (k == Crypto.CRYPTO_NUMBER_8) {
                x = (s as ArrayList<?Int64>).getOrThrow()[i].getOrThrow() & Crypto.CRYPTO_NUMBER_0XFF
            } else {
                x = this.intAt((s as String).getOrThrow(), i)
            }
            if (x < 0i64) {
                if ((Rune((s as String).getOrThrow()[i])).toString() == "-") {
                    mi = true
                }
                continue
            }
            mi = false
            if (sh == 0i64) {
                Benchmark.insertValue(this.array, x, this.t)
                this.t += 1i64
            } else if (sh + k > Crypto.bIDB) {
                Benchmark.insertValue(this.array, this.array[this.t - 1i64].getOrThrow() | ((x & ((1i64 << (Crypto.bIDB - sh)) - 1i64)) << sh), this.t - 1i64)
                Benchmark.insertValue(this.array, x >> (Crypto.bIDB - sh), this.t)
                this.t += 1i64
            } else {
                Benchmark.insertValue(this.array, this.array[this.t - 1i64].getOrThrow() | (x << sh), this.t - 1i64)
            }
            sh += k
            if (sh >= Crypto.bIDB) {
                sh -= Crypto.bIDB
            }
            i -= 1i64
        }
        if (k == Crypto.CRYPTO_NUMBER_8 && ((s as ArrayList<?Int64>).getOrThrow()[0].getOrThrow() & Crypto.CRYPTO_NUMBER_0X80) != 0i64) {
            this.s = -1i64
            if (sh > 0i64) {
                this.array[this.t - 1i64] = this.array[this.t - 1i64].getOrThrow() | ((1i64 << (Crypto.bIDB - sh)) - 1i64) << sh
            }
        }
        this.clamp()
        if (mi) {
            BigInteger.zero.subTo(this, this)
        }
    }

    public open func clamp(): Unit {
        let c = this.s & Crypto.bIDM
        while (this.t > 0i64 && this.array[this.t - 1i64].getOrThrow() == c) {
            this.t -= 1i64
        }
    }

    public open func toString(b: Int64): String {
        if (this.s < 0i64) {
            return "-" + this.negate().toString(b)
        }
        let k: Int64
        if (b == Crypto.CRYPTO_NUMBER_16) {
            k = Crypto.CRYPTO_NUMBER_4
        } else if (b == Crypto.CRYPTO_NUMBER_8) {
            k = Crypto.CRYPTO_NUMBER_3
        } else if (b == Crypto.CRYPTO_NUMBER_2) {
            k = 1i64
        } else if (b == Crypto.CRYPTO_NUMBER_32) {
            k = Crypto.CRYPTO_NUMBER_5
        } else if (b == Crypto.CRYPTO_NUMBER_4) {
            k = Crypto.CRYPTO_NUMBER_2
        } else {
            return this.toRadix(b)
        }
        let km = (1i64 << k) - 1i64
        var d: Int64 = 0
        var m = false
        var r: String = ""
        var i = this.t
        var p = Crypto.bIDB - ((i * Crypto.bIDB) % k)
        if (i > 0i64) {
            i -= 1i64
            d = this.array[i].getOrThrow() >> p
            if (p < Crypto.bIDB && d > 0i64) {
                m = true
                r = this.int2char(d)
            }
            while (i >= 0i64) {
                if (p < k) {
                    d = (this.array[i].getOrThrow() & ((1i64 << p) - 1i64)) << (k - p)
                    i -= 1i64
                    p += Crypto.bIDB - k
                    d |= this.array[i].getOrThrow() >> p
                } else {
                    p -= k
                    d = (this.array[i].getOrThrow() >> p) & km
                    if (p <= 0i64) {
                        p += Crypto.bIDB
                        i -= 1i64
                    }
                }
                if (d > 0i64) {
                    m = true
                }
                if (m) {
                    r = r + this.int2char(d)
                }
            }
        }
        return if (m) { r } else { "0" }
    }

    public open func negate(): BigInteger {
        let r = BigInteger.nbi()
        BigInteger.zero.subTo(this, r)
        return r
    }

    public open func abs(): BigInteger {
        return if (this.s < 0i64) { this.negate() } else { this }
    }

    public open func compareTo(a: BigInteger): Int64 {
        var r = this.s - a.s
        if (r != 0i64) {
            return r
        }
        var i = this.t
        r = i - a.t
        if (r != 0i64) {
            return r
        }
        i -= 1i64
        while (i >= 0i64) {
            r = this.array[i].getOrThrow() - a.array[i].getOrThrow()
            if (r != 0i64) {
                return r
            }
            i -= 1i64
        }
        return 0i64
    }

    public open func nbits(x: Int64): Int64 {
        var tempX = x
        var r = 1i64
        var t = tempX >> Crypto.CRYPTO_NUMBER_16
        if (t != 0) {
            tempX = t
            r += Crypto.CRYPTO_NUMBER_16
        }
        t = tempX >> Crypto.CRYPTO_NUMBER_8
        if (t != 0) {
            tempX = t
            r += Crypto.CRYPTO_NUMBER_8
        }
        t = tempX >> Crypto.CRYPTO_NUMBER_4
        if (t != 0) {
            tempX = t
            r += Crypto.CRYPTO_NUMBER_4
        }
        t = tempX >> Crypto.CRYPTO_NUMBER_2
        if (t != 0) {
            tempX = t
            r += Crypto.CRYPTO_NUMBER_2
        }
        t = tempX >> 1
        if (t != 0) {
            tempX = t
            r += 1i64
        }
        return r
    }

    public open func bitLength(): Int64 {
        if (this.t <= 0i64) {
            return 0i64
        }
        return Crypto.bIDB * (this.t - 1i64) + this.nbits((this.array[this.t - 1i64].getOrThrow() ^ (this.s & Crypto.bIDM)))
    }

    public open func dlShiftTo(n: Int64, r: BigInteger): Unit {
        var i = this.t - 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, this.array[i].getOrThrow(), i + n)
            i -= 1i64
        }
        i = n - 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, 0i64, i)
            i -= 1i64
        }
        r.t = this.t + n
        r.s = this.s
    }

    public open func drShiftTo(n: Int64, r: BigInteger): Unit {
        var i = n
        while (i < this.t) {
            Benchmark.insertValue(r.array, this.array[i].getOrThrow(), i - n)
            i += 1i64
        }
        r.t = max(this.t - n, 0i64)
        r.s = this.s
    }

    public open func lShiftTo(n: Int64, r: BigInteger): Unit {
        let bs = n % Crypto.bIDB
        let cbs = Crypto.bIDB - bs
        let bm = (1i64 << cbs) - 1i64
        let ds = Int64(floor(Float64(n) / Float64(Crypto.bIDB)))
        var c = (this.s << bs) & Crypto.bIDM
        var i = this.t - 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, (this.array[i].getOrThrow() >> cbs) | c, i + ds + 1i64)
            c = (this.array[i].getOrThrow() & bm) << bs
            i -= 1i64
        }
        i = ds - 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, 0i64, i)
            i -= 1i64
        }
        Benchmark.insertValue(r.array, c, ds)
        r.t = this.t + ds + 1i64
        r.s = this.s
        r.clamp()
    }

    public open func rShiftTo(n: Int64, r: BigInteger): Unit {
        r.s = this.s
        let ds = Int64(floor(Float64(n) / Float64(Crypto.bIDB)))
        if (ds >= this.t) {
            r.t = 0i64
            return
        }
        let bs = n % Crypto.bIDB
        let cbs = Crypto.bIDB - bs
        let bm = (1i64 << bs) - 1i64
        Benchmark.insertValue(r.array, this.array[ds].getOrThrow() >> bs, 0i64)
        var i = ds + 1i64
        while (i < this.t) {
            Benchmark.insertValue(r.array, r.array[(i - ds - 1i64)].getOrThrow() | ((this.array[i].getOrThrow() & bm) << cbs), i - ds - 1i64)
            Benchmark.insertValue(r.array, this.array[i].getOrThrow() >> bs, i - ds)
            i++
        }
        if (bs > 0i64) {
            Benchmark.insertValue(r.array, r.array[(this.t - ds - 1i64)].getOrThrow() | ((this.s & bm) << cbs), this.t - ds - 1i64)
        }
        r.t = this.t - ds
        r.clamp()
    }

    public open func subTo(a: BigInteger, r: BigInteger): Unit {
        var i = 0i64
        var c = 0i64
        let m = min(a.t, this.t)
        while (i < m) {
            c += this.array[i].getOrThrow() - a.array[i].getOrThrow()
            Benchmark.insertValue(r.array, c & Crypto.bIDM, i)
            c >>= Crypto.bIDB
            i += 1i64
        }
        if (a.t < this.t) {
            c -= a.s
            while (i < this.t) {
                c += this.array[i].getOrThrow()
                Benchmark.insertValue(r.array, c & Crypto.bIDM, i)
                c >>= Crypto.bIDB
                i += 1i64
            }
            c += this.s
        } else {
            c += this.s
            while (i < a.t) {
                c -= a.array[i].getOrThrow()
                Benchmark.insertValue(r.array, c & Crypto.bIDM, i)
                c >>= Crypto.bIDB
                i += 1i64
            }
            c -= a.s
        }
        r.s = if (c < 0i64) { -1i64 } else { 0i64 }
        if (c < -1i64) {
            Benchmark.insertValue(r.array, Crypto.bIDV + c, i)
            i += 1i64
        } else if (c > 0i64) {
            Benchmark.insertValue(r.array, c, i)
            i += 1i64
        }
        r.t = i
        r.clamp()
    }

    public open func multiplyTo(a: BigInteger, r: BigInteger): Unit {
        let x = this.abs()
        let y = a.abs()
        var i = x.t
        r.t = i + y.t
        i -= 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, 0i64, i)
            i -= 1i64
        }
        i = 0i64
        while (i < y.t) {
            let value = x.am(0i64, y.array[i].getOrThrow(), r, i, 0i64, x.t)
            Benchmark.insertValue(r.array, value, i + x.t)
            i++
        }
        r.s = 0i64
        r.clamp()
        if (this.s != a.s) {
            BigInteger.zero.subTo(r, r)
        }
    }

    public open func squareTo(r: BigInteger): Unit {
        let x = this.abs()
        r.t = Crypto.CRYPTO_NUMBER_2 * x.t
        var i = r.t - 1i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, 0i64, i)
            i -= 1i64
        }
        i = 0i64
        while (i < x.t - 1i64) {
            let c = x.am(i, x.array[i].getOrThrow(), r, Crypto.CRYPTO_NUMBER_2 * i, 0i64, 1i64)
            let value = r.array[(i + x.t)].getOrThrow() + x.am(i + 1i64, Crypto.CRYPTO_NUMBER_2 * x.array[i].getOrThrow(), r, Crypto.CRYPTO_NUMBER_2 * i + 1i64, c, x.t - i - 1i64)
            Benchmark.insertValue(r.array, value, i + x.t)
            if (r.array[(i + x.t)].getOrThrow() >= Crypto.bIDV) {
                Benchmark.insertValue(r.array, r.array[(i + x.t)].getOrThrow() - Crypto.bIDV, i + x.t)
                Benchmark.insertValue(r.array, 1i64, i + x.t + 1i64)
            }
            i += 1i64
        }
        if (r.t > 0i64) {
            let value = r.array[(r.t - 1i64)].getOrThrow() + x.am(i, x.array[i].getOrThrow(), r, Crypto.CRYPTO_NUMBER_2 * i, 0i64, 1i64)
            Benchmark.insertValue(r.array, value, r.t - 1i64)
        }
        r.s = 0i64
        r.clamp()
    }

    public open func divRemTo(m: BigInteger, q: ?BigInteger, r: ?BigInteger): ?BigInteger {
        let pm = m.abs()
        if (pm.t <= 0i64) {
            return r
        }
        let pt = this.abs()
        if (pt.t < pm.t) {
            if (let Some(q_new) <- q) {
                q_new.fromInt(0i64)
            }
            if (let Some(rr) <- r) {
                this.copyTo(rr)
            }
            return r
        }
        var rr = r ?? BigInteger.nbi()
        let y = BigInteger.nbi()
        let ts = this.s
        let ms = m.s
        let nsh = Crypto.bIDB - this.nbits(Int64(pm.array[(pm.t - 1i64)].getOrThrow()))
        if (nsh > 0i64) {
            pm.lShiftTo(nsh, y)
            pt.lShiftTo(nsh, rr)
        } else {
            pm.copyTo(y)
            pt.copyTo(rr)
        }
        let ys = y.t
        let y0 = y.array[(ys - 1i64)].getOrThrow()
        if (y0 == 0i64) {
            return rr
        }
        let yt = y0 * (1 << Crypto.bIF1) + (if (ys > 1i64) { y.array[ys - Crypto.CRYPTO_NUMBER_2].getOrThrow() >> Crypto.bIF2 } else { 0 })
        let d1 = Float64(Crypto.bIFV) / Float64(yt)
        let d2 = Float64(1i64 << Crypto.bIF1) / Float64(yt)
        let e = 1i64 << Crypto.bIF2
        var i = rr.t
        var j = i - ys
        let t = q ?? BigInteger.nbi()
        y.dlShiftTo(j, t)
        if (rr.compareTo(t) >= 0i64) {
            Benchmark.insertValue(rr.array, 1i64, rr.t)
            rr.t += 1i64
            rr.subTo(t, rr)
        }
        BigInteger.one.dlShiftTo(ys, t)
        t.subTo(y, y)
        while (y.t < ys) {
            Benchmark.insertValue(y.array, 0i64, y.t)
            y.t += 1i64
        }
        j -= 1i64
        while (j >= 0i64) {
            i -= 1i64
            var qd = if (rr.array[i].getOrThrow() == y0) { Crypto.bIDM } else { Int64(floor(Float64(rr.array[i].getOrThrow()) * d1 + (Float64(rr.array[Int64(i - 1i64)].getOrThrow() + e)) * d2)) }
            let value = rr.array[i].getOrThrow() + y.am(0i64, qd, rr, j, 0i64, ys)
            Benchmark.insertValue(rr.array, value, i)
            if (rr.array[i].getOrThrow() < qd) {
                y.dlShiftTo(j, t)
                rr.subTo(t, rr)
                qd -= 1i64
                while (rr.array[i].getOrThrow() < qd) {
                    rr.subTo(t, rr)
                    qd -= 1i64
                }
            }
            j -= 1i64
        }
        if (let Some(q) <- q) {
            rr.drShiftTo(ys, q)
            if (ts != ms) {
                BigInteger.zero.subTo(q, q)
            }
        }
        rr.t = ys
        rr.clamp()
        if (nsh > 0i64) {
            rr.rShiftTo(nsh, rr)
        }
        if (ts < 0i64) {
            BigInteger.zero.subTo(rr, rr)
        }
        return rr
    }

    public open func mod(a: BigInteger): BigInteger {
        var r = BigInteger.nbi()
        r = this.abs().divRemTo(a, None, r).getOrThrow()
        if (this.s < 0i64 && r.compareTo(BigInteger.zero) > 0i64) {
            a.subTo(r, r)
        }
        return r
    }

    public open func invDigit(): Int64 {
        if (this.t < 1i64) {
            return 0i64
        }
        let x = this.array[0].getOrThrow()
        if ((x & 1i64) == 0i64) {
            return 0i64
        }
        var y = x & Crypto.CRYPTO_NUMBER_3
        y = (y * (Crypto.CRYPTO_NUMBER_2 - (x & Crypto.CRYPTO_NUMBER_0XF) * y)) & Crypto.CRYPTO_NUMBER_0XF
        y = (y * (Crypto.CRYPTO_NUMBER_2 - (x & Crypto.CRYPTO_NUMBER_0XFF) * y)) & Crypto.CRYPTO_NUMBER_0XFF
        y = (y * (Crypto.CRYPTO_NUMBER_2 - (((x & Crypto.CRYPTO_NUMBER_0XFFFF) * y) & Crypto.CRYPTO_NUMBER_0XFFFF))) & Crypto.CRYPTO_NUMBER_0XFFFF
        y = (y * (Crypto.CRYPTO_NUMBER_2 - ((x * y) % Crypto.bIDV))) % Crypto.bIDV
        return if (y > 0i64) { Crypto.bIDV - y } else { -y }
    }

    public open func isEven(): Bool {
        return (if (this.t > 0i64) { this.array[0].getOrThrow() & 1i64 } else { this.s }) == 0i64
    }

    public open func exp(e: Int64, z: ConvertProtocol): BigInteger {
        if (e > Crypto.CRYPTO_NUMBER_0XFFFFFFFF || e < 1) {
            return BigInteger.one
        }
        var r = BigInteger.nbi()
        var r2 = BigInteger.nbi()
        let g = z.convert(this)
        var i = this.nbits(e) - 1i64 - 1i64
        g.copyTo(r)
        while (i >= 0i64) {
            r2 = z.sqrTo(r, r2).getOrThrow()
            if ((e & (1 << i)) > 0) {
                r = z.mulTo(r2, g, r).getOrThrow()
            } else {
                let t = r
                r = r2
                r2 = t
            }
            i -= 1i64
        }
        return z.revert(r)
    }

    public open func modPowInt(e: Int64, m: BigInteger): BigInteger {
        let z: ConvertProtocol
        if (e < Crypto.CRYPTO_NUMBER_256 || m.isEven()) {
            z = Classic(m)
        } else {
            z = Montgomery(m)
        }
        return this.exp(Int64(e), z)
    }

    public open func clones(): BigInteger {
        let r = BigInteger.nbi()
        this.copyTo(r)
        return r
    }

    public open func intValue(): Int64 {
        if (this.s < 0i64) {
            if (this.t == 1i64) {
                return this.array[0].getOrThrow() - Crypto.bIDV
            } else if (this.t == 0i64) {
                return -1i64
            }
        } else if (this.t == 1i64) {
            return this.array[0].getOrThrow()
        } else if (this.t == 0i64) {
            return 0i64
        }
        return ((this.array[1].getOrThrow() & ((1i64 << (Crypto.CRYPTO_NUMBER_32 - Crypto.bIDB)) - 1i64)) << Crypto.bIDB) | this.array[0].getOrThrow()
    }

    public open func byteValue(): Int64 {
        return if (this.t == 0i64) { this.s } else { (this.array[0].getOrThrow() << Crypto.CRYPTO_NUMBER_24) >> Crypto.CRYPTO_NUMBER_24 }
    }

    public open func shortValue(): Int64 {
        return if (this.t == 0i64) { this.s } else { (this.array[0].getOrThrow() << Crypto.CRYPTO_NUMBER_16) >> Crypto.CRYPTO_NUMBER_16 }
    }

    public open func chunkSize(r: Int64): Int64 {
        return Int64(floor(log(2.0) * Float64(Crypto.bIDB)) / log(Float64(r)))
    }

    public open func signum(): Int64 {
        if (this.s < 0i64) {
            return -1i64
        } else if (this.t <= 0i64 || (this.t == 1i64 && this.array[0].getOrThrow() <= 0i64)) {
            return 0i64
        } else {
            return 1i64
        }
    }

    public open func toRadix(b: ?Int64): String {
        let tempB = if (b.isNone()) { Crypto.CRYPTO_NUMBER_10 } else { b.getOrThrow() }
        if (this.signum() == 0i64 || tempB < Crypto.CRYPTO_NUMBER_2 || tempB > Crypto.CRYPTO_NUMBER_36) {
            return "0"
        }
        let cs = this.chunkSize(tempB)
        let a = Int64(pow(Float64(tempB), Float64(cs)))
        let d = nbv(a)
        let y = nbi()
        var z = nbi()
        var r: String = ""
        z = this.divRemTo(d, y, z).getOrThrow()
        let formatter = match(tempB) {
            case 2 => "b"
            case 8 => "o"
            case 16 => "x"
            case _ => throw Exception("it should not be reached")
        }
        while (y.signum() > 0i64) {
            let str = (a + z.intValue()).format(formatter)
            r = str[1..] + r
            z = y.divRemTo(d, y, z).getOrThrow()
        }
        return (z.intValue()).format(formatter) + r
    }

    public open func fromRadix(s: String, b: ?Int64): Unit {
        this.fromInt(0i64)
        let tempB = if (b.isNone()) { Crypto.CRYPTO_NUMBER_10 } else { b.getOrThrow() }
        let cs = this.chunkSize(tempB)
        let d = Int64(pow(Float64(tempB), Float64(cs)))
        var mi = false
        var j = 0i64
        var w = 0i64
        var i = 0i64
        while (i < Int64(s.size)) {
            let x = this.intAt(s, i)
            if (x < 0i64) {
                if ((Rune(s[i])).toString() == "-" && this.signum() == 0i64) {
                    mi = true
                }
                continue
            }
            w = tempB * w + x
            j += 1i64
            if (j >= cs) {
                this.dMultiply(d)
                this.dAddOffset(w, 0i64)
                j = 0i64
                w = 0i64
            }
            i++
        }
        if (j > 0i64) {
            this.dMultiply(Int64(pow(Float64(tempB), Float64(j))))
            this.dAddOffset(w, 0i64)
        }
        if (mi) {
            BigInteger.zero.subTo(this, this)
        }
    }

    public open func fromNumber(a: Int64, b: ?Any, c: ?Any): Unit {
        if (b.getOrThrow() is Int64) {
            if (a < Crypto.CRYPTO_NUMBER_2) {
                this.fromInt(1i64)
            } else {
                this.fromNumber(a, c, None)
                if (!this.testBit(a - 1i64)) {
                    this.bitwiseTo(BigInteger.one.shiftLeft(a - 1i64), this.opOr, this)
                }
                if (this.isEven()) {
                    this.dAddOffset(1i64, 0i64)
                }
                while (!this.isProbablePrime((b.getOrThrow() as Int64).getOrThrow())) {
                    this.dAddOffset(Crypto.CRYPTO_NUMBER_2, 0i64)
                    if (this.bitLength() > a) {
                        this.subTo(BigInteger.one.shiftLeft(a - 1i64), this)
                    }
                }
            }
        } else {
            var x: ArrayList<?Int64> = ArrayList<?Int64>(Int64((a >> Crypto.CRYPTO_NUMBER_3) + 1i64))
            let t = a & Crypto.CRYPTO_NUMBER_7
            (b.getOrThrow() as SecureRandom).getOrThrow().nextBytes(x)
            if (t > 0i64) {
                Benchmark.insertValue(x, x[0].getOrThrow() & ((1i64 << t) - 1i64), 0i64)
            } else {
                Benchmark.insertValue(x, 0i64, 0i64)
            }
            this.fromString(x, Crypto.CRYPTO_NUMBER_256)
        }
    }

    public open func toByteArray(): ArrayList<?Int64> {
        var i = this.t
        var r: ArrayList<?Int64> = ArrayList<?Int64>()
        Benchmark.insertValue(r, this.s, 0i64)
        var p = Crypto.bIDB - ((i * Crypto.bIDB) % Crypto.CRYPTO_NUMBER_8)
        var d: Int64 = 0
        var k = 0i64
        if (i > 0i64) {
            i -= 1i64
            d = this.array[i].getOrThrow() >> p
            if (p < Crypto.bIDB && d != (this.s & Crypto.bIDM) >> p) {
                Benchmark.insertValue(r, d | (this.s << (Crypto.bIDB - p)), k)
                k += 1i64
            }
            while (i >= 0i64) {
                if (p < Crypto.CRYPTO_NUMBER_8) {
                    d = (this.array[i].getOrThrow() & ((1i64 << p) - 1i64)) << (Crypto.CRYPTO_NUMBER_8 - p)
                    i -= 1i64
                    p += Crypto.bIDB - Crypto.CRYPTO_NUMBER_8
                    d |= this.array[i].getOrThrow() >> p
                } else {
                    p -= Crypto.CRYPTO_NUMBER_8
                    d = (this.array[i].getOrThrow() >> p) & Crypto.CRYPTO_NUMBER_0XFF
                    if (p <= 0i64) {
                        p += Crypto.bIDB
                        i -= 1i64
                    }
                }
                if ((d & Crypto.CRYPTO_NUMBER_0X80) != 0i64) {
                    d |= -Crypto.CRYPTO_NUMBER_256
                }
                if (k == 0i64 && (this.s & Crypto.CRYPTO_NUMBER_0X80) != (d & Crypto.CRYPTO_NUMBER_0X80)) {
                    k += 1i64
                }
                if (k > 0i64 || d != this.s) {
                    Benchmark.insertValue(r, d, k)
                    k += 1i64
                }
            }
        }
        return r
    }

    public open func bnEquals(a: BigInteger): Bool {
        return this.compareTo(a) == 0i64
    }

    public open func bnMin(a: BigInteger): BigInteger {
        return if (this.compareTo(a) < 0i64) { this } else { a }
    }

    public open func bnMax(a: BigInteger): BigInteger {
        return if (this.compareTo(a) > 0i64) { this } else { a }
    }

    public open func bitwiseTo(a: BigInteger, op: (Int64, Int64)-> Int64, r: BigInteger): Unit {
        let f: Int64
        let m = min(a.t, this.t)
        do {
            var i = 0i64
            while (i < m) {
                Benchmark.insertValue(r.array, op(this.array[i].getOrThrow(), a.array[i].getOrThrow()), i)
                i++
            }
        } while (false)
        if (a.t < this.t) {
            f = a.s & Crypto.bIDM
            do {
                var i = m
                while (i < this.t) {
                    Benchmark.insertValue(r.array, op(this.array[i].getOrThrow(), f), i)
                    i++
                }
            } while (false)
            r.t = this.t
        } else {
            f = this.s & Crypto.bIDM
            do {
                var i = m
                while (i < a.t) {
                    Benchmark.insertValue(r.array, op(f, a.array[i].getOrThrow()), i)
                    i++
                }
            } while (false)
            r.t = a.t
        }
        r.s = op(this.s, a.s)
        r.clamp()
    }

    var opAnd : ((x: Int64, y: Int64) -> Int64) = {x, y =>
        return x & y;
    }

    public open func bnAnd(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.bitwiseTo(a, this.opAnd, r)
        return r
    }

    var opOr : ((x: Int64, y: Int64) -> Int64) = {x, y =>
        return x | y;
    }

    public open func bnOr(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.bitwiseTo(a, this.opOr, r)
        return r
    }

    var opXor : ((x: Int64, y: Int64) -> Int64) = {x, y =>
        return x ^ y;
    }

    public open func bnXor(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.bitwiseTo(a, this.opXor, r)
        return r
    }

    var opAndnot: ((x: Int64, y: Int64) -> Int64) = {x, y =>
        return x & (!y);
    }

    public open func bnAndNot(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.bitwiseTo(a, this.opAndnot, r)
        return r
    }

    public open func bnNot(): BigInteger {
        let r = BigInteger.nbi()
        var i = 0i64
        while (i < this.t) {
            Benchmark.insertValue(r.array, Crypto.bIDM & !this.array[i].getOrThrow(), i)
            i++
        }
        r.t = this.t
        r.s = !this.s
        return r
    }

    public open func shiftLeft(n: Int64): BigInteger {
        let r = BigInteger.nbi()
        if (n < 0i64) {
            this.rShiftTo(-n, r)
        } else {
            this.lShiftTo(n, r)
        }
        return r
    }

    public open func shiftRight(n: Int64): BigInteger {
        let r = BigInteger.nbi()
        if (n < 0i64) {
            this.lShiftTo(-n, r)
        } else {
            this.rShiftTo(n, r)
        }
        return r
    }

    public open func lbit(x: Int64): Int64 {
        var tempX = x
        if (tempX == 0i64) {
            return -1i64
        }
        var r = 0i64
        if ((tempX & Crypto.CRYPTO_NUMBER_0XFFFF) == 0i64) {
            tempX >>= Crypto.CRYPTO_NUMBER_16
            r += Crypto.CRYPTO_NUMBER_16
        }
        if ((tempX & Crypto.CRYPTO_NUMBER_0XFF) == 0i64) {
            tempX >>= Crypto.CRYPTO_NUMBER_8
            r += Crypto.CRYPTO_NUMBER_8
        }
        if ((tempX & Crypto.CRYPTO_NUMBER_0XF) == 0i64) {
            tempX >>= Crypto.CRYPTO_NUMBER_4
            r += Crypto.CRYPTO_NUMBER_4
        }
        if ((tempX & Crypto.CRYPTO_NUMBER_3) == 0i64) {
            tempX >>= Crypto.CRYPTO_NUMBER_2
            r += Crypto.CRYPTO_NUMBER_2
        }
        if ((tempX & 1i64) == 0i64) {
            r += 1i64
        }
        return r
    }

    public open func getLowestSetBit(): Int64 {
        var i = 0i64
        while (i < this.t) {
            if (this.array[i].getOrThrow() != 0i64) {
                return i * Crypto.bIDB + this.lbit(this.array[i].getOrThrow())
            }
            i++
        }
        if (this.s < 0i64) {
            return this.t * Crypto.bIDB
        }
        return -1i64
    }

    public open func cbit(x: Int64): Int64 {
        var r = 0i64
        var tepmX = x
        while (tepmX != 0i64) {
            tepmX &= tepmX - 1i64
            r += 1i64
        }
        return r
    }

    public open func bitCount(): Int64 {
        var r = 0i64
        let x = this.s & Crypto.bIDM
        var i = 0i64
        while (i < this.t) {
            r += this.cbit(this.array[i].getOrThrow() ^ x)
            i++
        }
        return r
    }

    public open func testBit(n: Int64): Bool {
        let j = Int64(floor(Float64(n) / Float64(Crypto.bIDB)))
        if (j >= this.t) {
            return this.s != 0i64
        }
        return (this.array[Int64(j)].getOrThrow() & (1i64 << n % Crypto.bIDB)) != 0i64
    }

    public open func changeBit(n: Int64, op: (Int64, Int64) -> Int64): BigInteger {
        let r = BigInteger.one.shiftLeft(n)
        this.bitwiseTo(r, op, r)
        return r
    }

    public open func setBit(n: Int64): BigInteger {
        return this.changeBit(n, this.opOr)
    }

    public open func clearBit(n: Int64): BigInteger {
        return this.changeBit(n, this.opAndnot)
    }

    public open func flipBit(n: Int64): BigInteger {
        return this.changeBit(n, this.opXor)
    }

    public open func addTo(a: BigInteger, r: BigInteger): Unit {
        var i = 0i64
        var c = 0i64
        let m = min(a.t, this.t)
        while (i < m) {
            c += this.array[i].getOrThrow() + a.array[i].getOrThrow()
            Benchmark.insertValue(r.array, c & Crypto.bIDM, i)
            c >>= Crypto.bIDB
            i += 1i64
        }
        if (a.t < this.t) {
            c += a.s
            while (i < this.t) {
                c += this.array[i].getOrThrow()
                Benchmark.insertValue(r.array, c & Crypto.bIDM, i)
                c >>= Crypto.bIDB
                i += 1i64
            }
            c += this.s
        } else {
            c += this.s
            while (i < a.t) {
                c += a.array[i].getOrThrow()
                 Benchmark.insertValue(r.array, c & Crypto.bIDM, i)
                c >>= Crypto.bIDB
                i += 1i64
            }
            c += a.s
        }
        r.s = if (c < 0i64) { -1i64 } else { 0i64 }
        if (c > 0i64) {
            Benchmark.insertValue(r.array, c, i)
            i += 1i64
        } else if (c < -1i64) {
            Benchmark.insertValue(r.array, Crypto.bIDV + c, i)
            i += 1i64
        }
        r.t = i
        r.clamp()
    }

    public open func add(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.addTo(a, r)
        return r
    }

    public open func subtract(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.subTo(a, r)
        return r
    }

    public open func multiply(a: BigInteger): BigInteger {
        let r = BigInteger.nbi()
        this.multiplyTo(a, r)
        return r
    }

    public open func divide(a: BigInteger): ?BigInteger {
        let r = BigInteger.nbi()
        var temp: ?BigInteger = None
        temp = this.divRemTo(a, r, temp)
        return r
    }

    public open func remainder(a: BigInteger): BigInteger {
        var r = BigInteger.nbi()
        r = this.divRemTo(a, None, r).getOrThrow()
        return r
    }

    public open func divideAndRemainder(a: BigInteger): ArrayList<BigInteger> {
        let q = BigInteger.nbi()
        var r = BigInteger.nbi()
        r = this.divRemTo(a, q, r).getOrThrow()
        return ArrayList<BigInteger>([q, r])
    }

    public open func dMultiply(n: Int64): Unit {
        let value = this.am(0i64, n - 1i64, this, 0i64, 0i64, this.t)
        Benchmark.insertValue(this.array, value, this.t)
        this.t += 1i64
        this.clamp()
    }

    public open func dAddOffset(n: Int64, w: Int64): Unit {
        var tempW = w
        while (this.t <= tempW) {
            Benchmark.insertValue(this.array, 0i64, this.t)
            this.t += 1i64
        }
        Benchmark.insertValue(this.array, this.array[Int64(tempW)].getOrThrow() + n, tempW)
        while (this.array[Int64(tempW)].getOrThrow() >= Crypto.bIDV) {
            Benchmark.insertValue(this.array, this.array[Int64(tempW)].getOrThrow() - Crypto.bIDV, tempW)
            tempW += 1i64
            if (tempW >= this.t) {
                Benchmark.insertValue(this.array, 0i64, this.t)
                this.t += 1i64
            }
            Benchmark.insertValue(this.array, this.array[Int64(tempW)].getOrThrow() + 1i64, tempW)
        }
    }

    public open func bnPow(e: Int64): BigInteger {
        return this.exp(Int64(e), NullExp())
    }

    public open func multiplyLowerTo(a: BigInteger, n: Int64, r: BigInteger): Unit {
        var i = min(this.t + a.t, n)
        r.s = 0i64
        r.t = i
        while (i > 0i64) {
            i -= 1i64
            Benchmark.insertValue(r.array, 0i64, i)
        }
        while (i < r.t - this.t) {
            let value = this.am(0i64, a.array[i].getOrThrow(), r, i, 0i64, this.t)
            Benchmark.insertValue(r.array, value, i + this.t)
            i += 1i64
        }
        let j = min(a.t, n)
        while (i < j) {
            this.am(0i64, a.array[i].getOrThrow(), r, i, 0i64, n - i)
            i++
        }
        r.clamp()
    }

    public open func multiplyUpperTo(a: BigInteger, n: Int64, r: BigInteger): Unit {
        let tempN = n - 1i64
        r.t = this.t + a.t - tempN
        var i = r.t - 1i64
        r.s = 0i64
        while (i >= 0i64) {
            Benchmark.insertValue(r.array, 0i64, i)
            i -= 1i64
        }
        i = max(tempN - this.t, 0i64)
        while (i < a.t) {
            let value = this.am(tempN - i, a.array[i].getOrThrow(), r, 0i64, 0i64, this.t + i - tempN)
            Benchmark.insertValue(r.array, value, this.t + i - tempN)
            i++
        }
        r.clamp()
        r.drShiftTo(1i64, r)
    }

    public open func modPow(e: BigInteger, m: BigInteger): BigInteger {
        var i = e.bitLength()
        let k: Int64
        var r = BigInteger.nbv(1i64)
        let z: ?ConvertProtocol
        if (i <= 0i64) {
            return r
        } else if (i < Crypto.CRYPTO_NUMBER_18) {
            k = 1i64
        } else if (i < Crypto.CRYPTO_NUMBER_48) {
            k = Crypto.CRYPTO_NUMBER_3
        } else if (i < Crypto.CRYPTO_NUMBER_144) {
            k = Crypto.CRYPTO_NUMBER_4
        } else if (i < Crypto.CRYPTO_NUMBER_768) {
            k = Crypto.CRYPTO_NUMBER_5
        } else {
            k = Crypto.CRYPTO_NUMBER_6
        }
        if (i < Crypto.CRYPTO_NUMBER_8) {
            z = Classic(m)
        } else if (m.isEven()) {
            z = Barrett(m)
        } else {
            z = Montgomery(m)
        }
        var g: ArrayList<?BigInteger> = ArrayList<?BigInteger>()
        var n = Crypto.CRYPTO_NUMBER_3
        let k1 = k - 1i64
        let km = (1i64 << k) - 1i64
        Benchmark.insertBigIntegerValue(g, z.getOrThrow().convert(this), 1i64)
        if (k > 1i64) {
            var g2 = BigInteger.nbi()
            g2 = z.getOrThrow().sqrTo(g[1].getOrThrow(), g2).getOrThrow()
            while (n <= km) {
                Benchmark.insertBigIntegerValue(g, BigInteger.nbi(), n)
                g[n] = z.getOrThrow().mulTo(g2, g[Int64(n - Crypto.CRYPTO_NUMBER_2)].getOrThrow(), g[n])
                n += Crypto.CRYPTO_NUMBER_2
            }
        }
        var j = e.t - 1i64
        var w: Int64 = 0
        var is1 = true
        var r2 = BigInteger.nbi()
        var t: BigInteger
        i = this.nbits(Int64(e.array[Int64(j)].getOrThrow())) - 1i64
        while (j >= 0i64) {
            if (i >= k1) {
                w = (e.array[Int64(j)].getOrThrow() >> (i - k1)) & km
            } else {
                w = (e.array[Int64(j)].getOrThrow() & ((1i64 << (i + 1i64)) - 1i64)) << (k1 - i)
                if (j > 0i64) {
                    w |= e.array[Int64(j - 1i64)].getOrThrow() >> (Crypto.bIDB + i - k1)
                }
            }
            n = k
            while ((w & 1i64) == 0i64) {
                w >>= 1i64
                n -= 1i64
            }
            i -= n
            if (i < 0i64) {
                i += Crypto.bIDB
                j -= 1i64
            }
            if (is1) {
                g[Int64(w)].getOrThrow().copyTo(r)
                is1 = false
            } else {
                while (n > 1i64) {
                    r2 = z.getOrThrow().sqrTo(r, r2).getOrThrow()
                    r = z.getOrThrow().sqrTo(r2, r).getOrThrow()
                    n -= Crypto.CRYPTO_NUMBER_2
                }
                if (n > 0i64) {
                    r2 = z.getOrThrow().sqrTo(r, r2).getOrThrow()
                } else {
                    t = r
                    r = r2
                    r2 = t
                }
                r = z.getOrThrow().mulTo(r2, g[Int64(w)].getOrThrow(), r).getOrThrow()
            }
            while (j >= 0i64 && (e.array[Int64(j)].getOrThrow() & (1i64 << i)) == 0i64) {
                r2 = z.getOrThrow().sqrTo(r, r2).getOrThrow()
                t = r
                r = r2
                r2 = t
                i -= 1i64
                if (i < 0i64) {
                    i = Crypto.bIDB - 1i64
                    j -= 1i64
                }
            }
        }
        return z.getOrThrow().revert(r)
    }

    public open func gcd(a: BigInteger): BigInteger {
        var x = if (this.s < 0i64) { this.negate() } else { this.clones() }
        var y = if (a.s < 0i64) { a.negate() } else { a.clones() }
        if (x.compareTo(y) < 0i64) {
            let t = x
            x = y
            y = t
        }
        var i = x.getLowestSetBit()
        var g = y.getLowestSetBit()
        if (g < 0i64) {
            return x
        }
        if (i < g) {
            g = i
        }
        if (g > 0i64) {
            x.rShiftTo(g, x)
            y.rShiftTo(g, y)
        }
        while (x.signum() > 0i64) {
            i = x.getLowestSetBit()
            if (i > 0i64) {
                x.rShiftTo(i, x)
            }
            i = y.getLowestSetBit()
            if (i > 0i64) {
                y.rShiftTo(i, y)
            }
            if (x.compareTo(y) >= 0i64) {
                x.subTo(y, x)
                x.rShiftTo(Crypto.CRYPTO_NUMBER_1, x)
            } else {
                y.subTo(x, y)
                y.rShiftTo(Crypto.CRYPTO_NUMBER_1, y)
            }
        }
        if (g > 0i64) {
            y.lShiftTo(g, y)
        }
        return y
    }

    public open func modInt(n: Int64): Int64 {
        if (n <= 0i64) {
            return 0i64
        }
        let d = Crypto.bIDV % n
        var r = if (this.s < 0i64) { n - 1i64 } else { 0i64 }
        if (this.t > 0i64) {
            if (d == 0i64) {
                r = this.array[0].getOrThrow() % n
            } else {
                var i = this.t - 1i64
                while (i >= 0i64) {
                    r = (d * r + this.array[i].getOrThrow()) % n
                    i -= 1i64
                }
            }
        }
        return r
    }

    public open func modInverse(m: BigInteger): BigInteger {
        let ac = m.isEven()
        if ((this.isEven() && ac) || m.signum() == 0i64) {
            return BigInteger.zero
        }
        let u = m.clones()
        let v = this.clones()
        let a = BigInteger.nbv(1i64)
        let b = BigInteger.nbv(0i64)
        let c = BigInteger.nbv(0i64)
        let d = BigInteger.nbv(1i64)
        while (u.signum() != 0i64) {
            while (u.isEven()) {
                u.rShiftTo(1i64, u)
                if (ac) {
                    if (!a.isEven() || !b.isEven()) {
                        a.addTo(this, a)
                        b.subTo(m, b)
                    }
                    a.rShiftTo(1i64, a)
                } else if (!b.isEven()) {
                    b.subTo(m, b)
                }
                b.rShiftTo(1i64, b)
            }
            while (v.isEven()) {
                v.rShiftTo(1i64, v)
                if (ac) {
                    if (!c.isEven() || !d.isEven()) {
                        c.addTo(this, c)
                        d.subTo(m, d)
                    }
                    c.rShiftTo(1i64, c)
                } else if (!d.isEven()) {
                    d.subTo(m, d)
                }
                d.rShiftTo(1i64, d)
            }
            if (u.compareTo(v) >= 0i64) {
                u.subTo(v, u)
                if (ac) {
                    a.subTo(c, a)
                }
                b.subTo(d, b)
            } else {
                v.subTo(u, v)
                if (ac) {
                    c.subTo(a, c)
                }
                d.subTo(b, d)
            }
        }
        if (v.compareTo(BigInteger.one) != 0i64) {
            return BigInteger.zero
        }
        if (d.compareTo(m) >= 0i64) {
            return d.subtract(m)
        }
        if (d.signum() < 0i64) {
            d.addTo(m, d)
        } else {
            return d
        }
        if (d.signum() < 0i64) {
            return d.add(m)
        } else {
            return d
        }
    }

    public open func isProbablePrime(t: Int64): Bool {
        let x = this.abs()
        if (x.t == 1i64 && x.array[0].getOrThrow() <= Crypto.lowprimes.getOrThrow()[Int64(Int64(Crypto.lowprimes.getOrThrow().size) - 1i64)]) {
            do {
                var i = 0i64
                while (i < Int64(Crypto.lowprimes.getOrThrow().size)) {
                    if (x.array[0].getOrThrow() == Crypto.lowprimes.getOrThrow()[i]) {
                        return true
                    }
                    i++
                }
            } while (false)
            return false
        }
        if (x.isEven()) {
            return false
        }
        var i = 1i64
        while (i < Int64(Crypto.lowprimes.getOrThrow().size)) {
            var m = Crypto.lowprimes.getOrThrow()[i]
            var j = i + 1i64
            while (j < Int64(Crypto.lowprimes.getOrThrow().size) && m < Crypto.lplim) {
                m *= Crypto.lowprimes.getOrThrow()[Int64(j)]
                j += 1i64
            }
            m = x.modInt(m)
            while (i < j) {
                if (m % Crypto.lowprimes.getOrThrow()[i] == 0i64) {
                    return false
                }
                i += 1i64
            }
        }
        return x.millerRabin(t)
    }

    public open func millerRabin(t: Int64): Bool {
        var tempT = t
        let n1 = this.subtract(BigInteger.one)
        let k = n1.getLowestSetBit()
        if (k <= 0i64) {
            return false
        }
        let r = n1.shiftRight(k)
        tempT = (tempT + 1i64) >> 1i64
        if (tempT > Int64(Crypto.lowprimes.getOrThrow().size)) {
            tempT = Int64(Crypto.lowprimes.getOrThrow().size)
        }
        let a = nbi()
        var i = 0i64
        while (i < tempT) {
            a.fromInt(Crypto.lowprimes.getOrThrow()[i])
            var y = a.modPow(r, this)
            if (y.compareTo(BigInteger.one) != 0i64 && y.compareTo(n1) != 0i64) {
                var j = 1i64
                while (j < k && y.compareTo(n1) != 0i64) {
                    j += 1i64
                    y = y.modPowInt(Crypto.CRYPTO_NUMBER_2, this)
                    if (y.compareTo(BigInteger.one) == 0i64) {
                        return false
                    }
                }
                if (y.compareTo(n1) != 0i64) {
                    return false
                }
            }
            i++
        }
        return true
    }

    public open func am(i: Int64, x: Int64, w: BigInteger, j: Int64, c: Int64, n: Int64): Int64 {
        return Crypto.aM(this.array, i, x, w, j, c, n)
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "BigInteger@${0}"
    }
}

extend BigInteger <: Equatable<BigInteger> {
    public operator func == (that: BigInteger): Bool {
        return refEq(this, that)
    }

    public operator func != (that: BigInteger): Bool {
        return !(this == that)
    }
}

open interface ConvertProtocol {
    open func convert(x: BigInteger): BigInteger

    open func revert(x: BigInteger): BigInteger

    open func reduce(x: ?BigInteger): ?BigInteger

    open func sqrTo(x: BigInteger, r: ?BigInteger): ?BigInteger

    open func mulTo(x: BigInteger, y: BigInteger, r: ?BigInteger): ?BigInteger
}

open class Classic <: ConvertProtocol & Hashable & ToString {
    var m: BigInteger

    init(m: BigInteger) {
        this.m = m
    }

    override public open func convert(x: BigInteger): BigInteger {
        if (x.s < 0i64 || x.compareTo(this.m) >= 0i64) {
            return x.mod(this.m)
        } else {
            return x
        }
    }

    override public open func revert(x: BigInteger): BigInteger {
        return x
    }

    override public open func reduce(x: ?BigInteger): ?BigInteger {
        return x.getOrThrow().divRemTo(this.m, None, x)
    }

    override public open func sqrTo(x: BigInteger, r: ?BigInteger): ?BigInteger {
        x.squareTo(r.getOrThrow())
        this.reduce(r)
    }

    override public open func mulTo(x: BigInteger, y: BigInteger, r: ?BigInteger): ?BigInteger {
        x.multiplyTo(y, r.getOrThrow())
        this.reduce(r)
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Classic@${0}"
    }
}

extend Classic <: Equatable<Classic> {
    public operator func == (that: Classic): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Classic): Bool {
        return !(this == that)
    }
}

open class Montgomery <: ConvertProtocol & Hashable & ToString {
    var m: BigInteger

    var mp: Int64 = 0

    var mpl: Int64 = 0

    var mph: Int64 = 0

    var um: Int64 = 0

    var mt2: Int64 = 0

    init(m: BigInteger) {
        this.m = m
        this.mp = m.invDigit()
        this.mpl = this.mp & Crypto.CRYPTO_NUMBER_0X7FFF
        this.mph = this.mp >> Crypto.CRYPTO_NUMBER_15
        this.um = (1i64 << (Crypto.bIDB - Crypto.CRYPTO_NUMBER_15)) - 1i64
        this.mt2 = Crypto.CRYPTO_NUMBER_2 * m.t
    }

    override public open func convert(x: BigInteger): BigInteger {
        var r = BigInteger.nbi()
        x.abs().dlShiftTo(this.m.t, r)
        r = r.divRemTo(this.m, None, r).getOrThrow()
        if (x.s < 0i64 && r.compareTo(BigInteger.zero) > 0i64) {
            this.m.subTo(r, r)
        }
        return r
    }

    override public open func revert(x: BigInteger): BigInteger {
        var r = BigInteger.nbi()
        x.copyTo(r)
        r = this.reduce(r).getOrThrow()
        return r
    }

    override public open func reduce(x: ?BigInteger): ?BigInteger {
        while (x.getOrThrow().t <= this.mt2) {
            Benchmark.insertValue(x.getOrThrow().array, 0i64, x.getOrThrow().t)
            x.getOrThrow().t += 1i64
        }
        var i = 0i64
        while (i < this.m.t) {
            var j = x.getOrThrow().array[i].getOrThrow() & Crypto.CRYPTO_NUMBER_0X7FFF
            let u0 = (j * this.mpl + (((j * this.mph + (x.getOrThrow().array[i].getOrThrow() >> Crypto.CRYPTO_NUMBER_15) * this.mpl) & this.um) << Crypto.CRYPTO_NUMBER_15)) & Crypto.bIDM
            j = i + this.m.t
            let value = x.getOrThrow().array[Int64(j)].getOrThrow() + this.m.am(0i64, u0, x.getOrThrow(), i, 0i64, this.m.t)
            Benchmark.insertValue(x.getOrThrow().array, value, j)
            while (x.getOrThrow().array[Int64(j)].getOrThrow() >= Crypto.bIDV) {
                Benchmark.insertValue(x.getOrThrow().array, x.getOrThrow().array[Int64(j)].getOrThrow() - Crypto.bIDV, j)
                j += 1i64
                Benchmark.insertValue(x.getOrThrow().array, x.getOrThrow().array[Int64(j)].getOrThrow() + 1i64, j)
            }
            i++
        }
        x.getOrThrow().clamp()
        x.getOrThrow().drShiftTo(this.m.t, x.getOrThrow())
        if (x.getOrThrow().compareTo(this.m) >= 0i64) {
            x.getOrThrow().subTo(this.m, x.getOrThrow())
        }
        return x
    }

    override public open func sqrTo(x: BigInteger, r: ?BigInteger): ?BigInteger {
        x.squareTo(r.getOrThrow())
        this.reduce(r)
    }

    override public open func mulTo(x: BigInteger, y: BigInteger, r: ?BigInteger): ?BigInteger {
        x.multiplyTo(y, r.getOrThrow())
        this.reduce(r)
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Montgomery@${0}"
    }
}

extend Montgomery <: Equatable<Montgomery> {
    public operator func == (that: Montgomery): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Montgomery): Bool {
        return !(this == that)
    }
}

open class NullExp <: ConvertProtocol & Hashable & ToString {
    init() { }

    override public open func convert(x: BigInteger): BigInteger {
        return x
    }

    override public open func revert(x: BigInteger): BigInteger {
        return x
    }

    override public open func reduce(x: ?BigInteger): ?BigInteger { return x }

    override public open func sqrTo(x: BigInteger, r: ?BigInteger): ?BigInteger {
        x.squareTo(r.getOrThrow())
        r
    }

    override public open func mulTo(x: BigInteger, y: BigInteger, r: ?BigInteger): ?BigInteger {
        x.multiplyTo(y, r.getOrThrow())
        r
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "NullExp@${0}"
    }
}

extend NullExp <: Equatable<NullExp> {
    public operator func == (that: NullExp): Bool {
        return refEq(this, that)
    }

    public operator func != (that: NullExp): Bool {
        return !(this == that)
    }
}

open class Barrett <: ConvertProtocol & Hashable & ToString {
    var r2: BigInteger

    var q3: BigInteger

    var mu: BigInteger

    var m: BigInteger

    init(m: BigInteger) {
        this.r2 = BigInteger.nbi()
        this.q3 = BigInteger.nbi()
        BigInteger.one.dlShiftTo(Crypto.CRYPTO_NUMBER_2 * m.t, this.r2)
        this.mu = this.r2.divide(m).getOrThrow()
        this.m = m
    }

    override public open func convert(x: BigInteger): BigInteger {
        if (x.s < 0i64 || x.t > Crypto.CRYPTO_NUMBER_2 * this.m.t) {
            return x.mod(this.m)
        } else if (x.compareTo(this.m) < 0i64) {
            return x
        } else {
            var r = BigInteger.nbi()
            x.copyTo(r)
            r = this.reduce(r).getOrThrow()
            return r
        }
    }

    override public open func revert(x: BigInteger): BigInteger {
        return x
    }

    override public open func reduce(x: ?BigInteger): ?BigInteger {
        x.getOrThrow().drShiftTo(this.m.t - 1i64, this.r2)
        if (x.getOrThrow().t > this.m.t + 1i64) {
            x.getOrThrow().t = this.m.t + 1i64
            x.getOrThrow().clamp()
        }
        this.mu.multiplyUpperTo(this.r2, this.m.t + 1i64, this.q3)
        this.m.multiplyLowerTo(this.q3, this.m.t + 1i64, this.r2)
        while (x.getOrThrow().compareTo(this.r2) < 0i64) {
            x.getOrThrow().dAddOffset(1i64, this.m.t + 1i64)
        }
        x.getOrThrow().subTo(this.r2, x.getOrThrow())
        while (x.getOrThrow().compareTo(this.m) >= 0i64) {
            x.getOrThrow().subTo(this.m, x.getOrThrow())
        }
        return x
    }

    override public open func sqrTo(x: BigInteger, r: ?BigInteger): ?BigInteger {
        x.squareTo(r.getOrThrow())
        this.reduce(r)
    }

    override public open func mulTo(x: BigInteger, y: BigInteger, r: ?BigInteger): ?BigInteger {
        x.multiplyTo(y, r.getOrThrow())
        this.reduce(r)
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Barrett@${0}"
    }
}

extend Barrett <: Equatable<Barrett> {
    public operator func == (that: Barrett): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Barrett): Bool {
        return !(this == that)
    }
}

open class Arcfour <: Hashable & ToString {
    init() { }

    var i = 0i64

    var j = 0i64

    var s: ArrayList<?Int64> = ArrayList<?Int64>()

    public open func arc4Init(key: ArrayList<?Int64>): Unit {
        var j = 0i64
        var t = 0i64
        do {
            var i = 0i64
            while (i < Crypto.CRYPTO_NUMBER_256) {
                Benchmark.insertValue(this.s, i, i)
                i++
            }
        } while (false)
        do {
            var i = 0i64
            while (i < Crypto.CRYPTO_NUMBER_256) {
                j = (j + this.s[i].getOrThrow() + key[(i % (key.size))].getOrThrow()) & Crypto.CRYPTO_NUMBER_255
                t = this.s[i].getOrThrow()
                Benchmark.insertValue(this.s, this.s[j].getOrThrow(), i)
                Benchmark.insertValue(this.s, t, j)
                i++
            }
        } while (false)
        this.i = 0i64
        this.j = 0i64
    }

    public open func next(): Int64 {
        let t: Int64
        this.i = (this.i + 1i64) & Crypto.CRYPTO_NUMBER_255
        this.j = (this.j + this.s[Int64(this.i)].getOrThrow()) & Crypto.CRYPTO_NUMBER_255
        t = this.s[Int64(this.i)].getOrThrow()
        Benchmark.insertValue(this.s, this.s[(this.j)].getOrThrow(), this.i)
        Benchmark.insertValue(this.s, t, this.j)
        return this.s[Int64((t + this.s[Int64(this.i)].getOrThrow()) & Crypto.CRYPTO_NUMBER_255)].getOrThrow()
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Arcfour@${0}"
    }
}

extend Arcfour <: Equatable<Arcfour> {
    public operator func == (that: Arcfour): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Arcfour): Bool {
        return !(this == that)
    }
}

open class RngPool <: Hashable & ToString {
    init() { }

    static func prngNewstate(): ?Arcfour {
        return Arcfour()
    }

    static var rngPsize = Crypto.CRYPTO_NUMBER_256

    static var rngState: ?Arcfour = None

    static var rngPool: ?ArrayList<?Int64> = None

    static var rngPptr = 0i64

    static func rngSeedInt(x: Int64): Unit {
        rngPool.getOrThrow()[Int64(rngPptr)] = rngPool.getOrThrow()[Int64(rngPptr)].getOrThrow() ^ Int64(x & Crypto.CRYPTO_NUMBER_255)
        rngPptr += 1i64
        rngPool.getOrThrow()[Int64(rngPptr)] = rngPool.getOrThrow()[Int64(rngPptr)].getOrThrow() ^ (Int64(x >> Crypto.CRYPTO_NUMBER_8) & Crypto.CRYPTO_NUMBER_255)
        rngPptr += 1i64
        rngPool.getOrThrow()[Int64(rngPptr)] = rngPool.getOrThrow()[Int64(rngPptr)].getOrThrow() ^ (Int64(x >> Crypto.CRYPTO_NUMBER_16) & Crypto.CRYPTO_NUMBER_255)
        rngPptr += 1i64
        rngPool.getOrThrow()[Int64(rngPptr)] = rngPool.getOrThrow()[Int64(rngPptr)].getOrThrow() ^ (Int64(x >> Crypto.CRYPTO_NUMBER_24) & Crypto.CRYPTO_NUMBER_255)
        rngPptr += 1i64
        if (rngPptr >= rngPsize) {
            rngPptr -= rngPsize
        }
    }

    static func rngSeedTime(): Unit {
        rngSeedInt(Crypto.CRYPTO_NUMBER_1122926989487)
    }

    static func initRngPool(): Unit {
        if (rngPool.isNone()) {
            rngPool = ArrayList<?Int64>()
            rngPptr = 0i64
            var t: Int64 = 0
            while (rngPptr < rngPsize) {
                t = Int64(floor(Float64(Crypto.CRYPTO_NUMBER_65536) * Random().nextFloat64()))
                Benchmark.insertValue(rngPool.getOrThrow(), (t >> Crypto.CRYPTO_NUMBER_8), rngPptr)
                rngPptr += 1i64
                Benchmark.insertValue(rngPool.getOrThrow(), t & Crypto.CRYPTO_NUMBER_255, rngPptr)
                rngPptr += 1i64
            }
            rngPptr = 0i64
            rngSeedTime()
        }
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "RngPool@${0}"
    }
}

extend RngPool <: Equatable<RngPool> {
    public operator func == (that: RngPool): Bool {
        return refEq(this, that)
    }

    public operator func != (that: RngPool): Bool {
        return !(this == that)
    }
}

open class SecureRandom <: Hashable & ToString {
    init() { }

    public open func nextBytes(ba: ArrayList<?Int64>): Unit {
        var i = 0i64
        while (i < ba.size) {
            Benchmark.insertValue(ba, this.rngGetByte(), i)
            i++
        }
    }

    public open func rngGetByte(): Int64 {
        if (RngPool.rngState.isNone()) {
            RngPool.rngSeedTime()
            RngPool.rngState = RngPool.prngNewstate()
            RngPool.rngState.getOrThrow().arc4Init(RngPool.rngPool.getOrThrow())
            RngPool.rngPptr = 0i64
            while (RngPool.rngPptr < RngPool.rngPool.getOrThrow().size) {
                Benchmark.insertValue(RngPool.rngPool.getOrThrow(), 0i64, RngPool.rngPptr)
                RngPool.rngPptr += 1i64
            }
            RngPool.rngPptr = 0i64
        }
        return RngPool.rngState.getOrThrow().next()
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "SecureRandom@${0}"
    }
}

extend SecureRandom <: Equatable<SecureRandom> {
    public operator func == (that: SecureRandom): Bool {
        return refEq(this, that)
    }

    public operator func != (that: SecureRandom): Bool {
        return !(this == that)
    }
}

open class RsaKey <: Hashable & ToString {
    var n: ?BigInteger = None

    var d: ?BigInteger = None

    var p: ?BigInteger = None

    var q: ?BigInteger = None

    var e: Int64 = 0

    var dmp1: ?BigInteger = None

    var dmq1: ?BigInteger = None

    var coeff: ?BigInteger = None

    init() {
        this.n = None
        this.e = Crypto.CRYPTO_NUMBER_0
        this.d = None
        this.p = None
        this.q = None
        this.dmp1 = None
        this.dmq1 = None
        this.coeff = None
    }

    public open func parseBigInt(str: String, r: Any): BigInteger {
        return BigInteger(str, r)
    }

    public open func linebrk(s: ?String, n: Int64): String {
        var ret: String = ""
        var i = 0i64
        while (i + n < s.getOrThrow().size) {
            ret += s.getOrThrow()[i..(i + n)] + "\n".toString()
            i += n
        }
        return ret + s.getOrThrow()[i..s.getOrThrow().size]
    }

    public open func byte2Hex(b: Int64): String {
        if (b < Crypto.CRYPTO_NUMBER_0X10) {
            return "0" + b.format("x")
        } else {
            return b.format("x")
        }
    }

    public open func pkcs1pad2(s: String, n: Int64): ?BigInteger {
        if (n < s.size + Crypto.CRYPTO_NUMBER_11) {
            return None
        }
        var tempN = n
        var ba: ArrayList<?Int64> = ArrayList<?Int64>()
        var i = s.size - 1i64
        while (i >= 0i64 && tempN > 0i64) {
            tempN -= 1i64
            Benchmark.insertValue(ba, Int64(s[i]), tempN)
            i -= 1i64
        }
        tempN -= 1i64
        Benchmark.insertValue(ba, 0i64, tempN)
        let rng = SecureRandom()
        var x: ArrayList<?Int64> = ArrayList<?Int64>()
        while (tempN > Crypto.CRYPTO_NUMBER_2) {
            Benchmark.insertValue(x, 0i64, 0i64)
            while (x[0].getOrThrow() == 0i64) {
                rng.nextBytes(x)
            }
            tempN -= 1i64
            Benchmark.insertValue(ba, x[0].getOrThrow(), tempN)
        }
        tempN -= 1i64
        Benchmark.insertValue(ba, Crypto.CRYPTO_NUMBER_2, tempN)
        tempN -= 1i64
        Benchmark.insertValue(ba, 0i64, tempN)
        return BigInteger(ba)
    }

    public open func setPublic(n: String, e: String): Unit {
        if (n.size > 0i64 && e.size > 0i64) {
            this.n = this.parseBigInt(n, Crypto.CRYPTO_NUMBER_16)
            this.e = Int64.tryParse("0x" + e) ?? 0
        } else { }
    }

    public open func doPublic(x: BigInteger): ?BigInteger {
        return x.modPowInt(this.e, this.n.getOrThrow())
    }

    public open func encrypt(text: String): ?String {
        let m = this.pkcs1pad2(text, (this.n.getOrThrow().bitLength() + Crypto.CRYPTO_NUMBER_7) >> Crypto.CRYPTO_NUMBER_3)
        if (m.isNone()) {
            return None
        }
        let c = this.doPublic(m.getOrThrow())
        if (c.isNone()) {
            return None
        }
        let h = c.getOrThrow().toString(Crypto.CRYPTO_NUMBER_16)
        if ((h.size & 1i64) == 0i64) {
            return h
        } else {
            return '0'.toString() + h
        }
    }

    public open func pkcs1unpad2(d: BigInteger, n: Int64): ?String {
        let b = d.toByteArray()
        var i = 0i64
        while (i < b.size && b[i].getOrThrow() == 0i64) {
            i += 1i64
        }
        if (b.size - i != n - 1i64 || b[i].getOrThrow() != Crypto.CRYPTO_NUMBER_2) {
            return None
        }
        i += 1i64
        while (b[i].getOrThrow() != 0i64) {
            i += 1i64
            if (i >= b.size) {
                return None
            }
        }
        var ret: String = ""
        i += 1i64
        while (i < b.size) {
            ret += String(Rune(b[i].getOrThrow()))
            i += 1i64
        }
        return ret
    }

    public open func setPrivate(n: String, e: String, d: String): Unit {
        if (n.size > 0i64 && e.size > 0i64) {
            this.n = this.parseBigInt(n, Crypto.CRYPTO_NUMBER_16)
            this.e = Int64.tryParse("0x" + e) ?? 0
            this.d = this.parseBigInt(d, Crypto.CRYPTO_NUMBER_16)
        } else { }
    }

    public open func setPrivateEx(n: String, e: String, d: String, p: String, q: String, dp: String, dq: String, c: String): Unit {
        if (n.size > 0i64 && e.size > 0i64) {
            this.n = this.parseBigInt(n, Crypto.CRYPTO_NUMBER_16)
            this.e = Int64.tryParse("0x" + e) ?? 0
            this.d = this.parseBigInt(d, Crypto.CRYPTO_NUMBER_16)
            this.p = this.parseBigInt(p, Crypto.CRYPTO_NUMBER_16)
            this.q = this.parseBigInt(q, Crypto.CRYPTO_NUMBER_16)
            this.dmp1 = this.parseBigInt(dp, Crypto.CRYPTO_NUMBER_16)
            this.dmq1 = this.parseBigInt(dq, Crypto.CRYPTO_NUMBER_16)
            this.coeff = this.parseBigInt(c, Crypto.CRYPTO_NUMBER_16)
        } else { }
    }

    public open func generate(b: Int64, e: String): Unit {
        let rng = SecureRandom()
        let qs = b >> 1i64
        this.e = Int64.tryParse("0x" + e) ?? 0
        let ee = BigInteger(e, Crypto.CRYPTO_NUMBER_16)
        while (true) {
            while (true) {
                this.p = BigInteger(b - qs, 1i64, rng)
                if (this.p.getOrThrow().subtract(BigInteger.one).gcd(ee).compareTo(BigInteger.one) == 0i64 && this.p.getOrThrow().isProbablePrime(Crypto.CRYPTO_NUMBER_10)) {
                    break
                }
            }
            while (true) {
                this.q = BigInteger(qs, 1i64, rng)
                if (this.q.getOrThrow().subtract(BigInteger.one).gcd(ee).compareTo(BigInteger.one) == 0i64 && this.q.getOrThrow().isProbablePrime(Crypto.CRYPTO_NUMBER_10)) {
                    break
                }
            }
            if (this.p.getOrThrow().compareTo(this.q.getOrThrow()) <= 0i64) {
                let t = this.p
                this.p = this.q
                this.q = t
            }
            let p1 = this.p.getOrThrow().subtract(BigInteger.one)
            let q1 = this.q.getOrThrow().subtract(BigInteger.one)
            let phi = p1.multiply(q1)
            if (phi.gcd(ee).compareTo(BigInteger.one) == 0i64) {
                this.dmp1 = this.d.getOrThrow().mod(p1)
                this.dmq1 = this.d.getOrThrow().mod(q1)
                this.n = this.p.getOrThrow().multiply(this.q.getOrThrow())
                this.d = ee.modInverse(phi)
                this.coeff = this.q.getOrThrow().modInverse(this.p.getOrThrow())
                break
            }
        }
    }

    public open func doPrivate(x: BigInteger): ?BigInteger {
        if (this.p.isNone() || this.q.isNone()) {
            return x.modPow(this.d.getOrThrow(), this.n.getOrThrow())
        }
        var xp = x.mod(this.p.getOrThrow()).modPow(this.dmp1.getOrThrow(), this.p.getOrThrow())
        let xq = x.mod(this.q.getOrThrow()).modPow(this.dmq1.getOrThrow(), this.q.getOrThrow())
        while (xp.compareTo(xq) < 0i64) {
            xp = xp.add(this.p.getOrThrow())
        }
        return xp.subtract(xq).multiply(this.coeff.getOrThrow()).mod(this.p.getOrThrow()).multiply(this.q.getOrThrow()).add(xq)
    }

    public open func decrypt(ctext: String): ?String {
        let c = this.parseBigInt(ctext, Crypto.CRYPTO_NUMBER_16)
        let m = this.doPrivate(c)
        if (m.isNone()) {
            return None
        }
        return this.pkcs1unpad2(m.getOrThrow(), (this.n.getOrThrow().bitLength() + Crypto.CRYPTO_NUMBER_7) >> Crypto.CRYPTO_NUMBER_3)
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "RsaKey@${0}"
    }
}

extend RsaKey <: Equatable<RsaKey> {
    public operator func == (that: RsaKey): Bool {
        return refEq(this, that)
    }

    public operator func != (that: RsaKey): Bool {
        return !(this == that)
    }
}

open class Crypt <: Hashable & ToString {
    init() { }

    static var nValue: String = "a5261939975948bb7a58dffe5ff54e65f0498f9175f5a09288810b8975871e99af3b5dd94057b0fc07535f5f97444504fa35169d461d0d30cf0192e307727c065168c788771c561a9400fb49175e9e6aa4e23fe11af69e9412dd23b0cb6684c4c2429bce139e848ab26d0829073351f4acd36074eafd036a5eb83359d2a698d3"

    static var eValue: String = "10001"

    static var dValue: String = "8e9912f6d3645894e8d38cb58c0db81ff516cf4c7e5a14c7f1eddb1459d2cded4d8d293fc97aee6aefb861859c8b6a3d1dfe710463e1f9ddc72048c09751971c4a580aa51eb523357a3cc48d31cfad1d4a165066ed92d4748fb6571211da5cb14bc11b6e2df7c1a559e6d5ac1cd5c94703a22891464fba23d0d965086277a161"

    static var pValue: String = "d090ce58a92c75233a6486cb0a9209bf3583b64f540c76f5294bb97d285eed33aec220bde14b2417951178ac152ceab6da7090905b478195498b352048f15e7d"

    static var qValue: String = "cab575dc652bb66df15a0359609d51d1db184750c00c6698b90ef3465c99655103edbf0d54c56aec0ce3c4d22592338092a126a0cc49f65a4a30d222b411e58f"

    static var dmp1Value: String = "1a24bca8e273df2f0e47c199bbf678604e7df7215480c77c8db39f49b000ce2cf7500038acfff5433b7d582a01f1826e6f4d42e1c57f5e1fef7b12aabc59fd25"

    static var dmq1Value: String = "3d06982efbbe47339e1f6d36b1216b8a741d410b0c662f54f7118b27b9a4ec9d914337eb39841d8666f3034408cf94f5b62f11c402fc994fe15a05493150d9fd"

    static var coeffValue: String = "3a3e731acd8960b7ff9eb81a7ff93bd1cfa74cbd56987db58b4594fb09c09084db1734c8143f98b602b981aaa9243ca28deb69b5b280ee8dcee0fd2625e53250"

    static var text: String = "The quick brown fox jumped over the extremely lazy frog! Now is the time for all good men to come to the party."

    static var encrypted: ?String = None

    static func encrypt(): Unit {
        let RSA = RsaKey()
        RSA.setPublic(nValue, eValue)
        RSA.setPrivateEx(nValue, eValue, dValue, pValue, qValue, dmp1Value, dmq1Value, coeffValue)
        encrypted = RSA.encrypt(text)
    }

    static func decrypt(): Unit {
        let RSA = RsaKey()
        RSA.setPublic(nValue, eValue)
        RSA.setPrivateEx(nValue, eValue, dValue, pValue, qValue, dmp1Value, dmq1Value, coeffValue)
        let decrypted = RSA.decrypt(encrypted.getOrThrow())
        if (!(decrypted.getOrThrow() == text)) { }
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Crypt@${0}"
    }
}

extend Crypt <: Equatable<Crypt> {
    public operator func == (that: Crypt): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Crypt): Bool {
        return !(this == that)
    }
}

open class Benchmark <: Hashable & ToString {
    init() { }

    public open func cryptoSetup(): Unit {
        Crypto.initBIRC()
        RngPool.initRngPool()
        Crypto.setupEngine(Crypto.am3, Crypto.CRYPTO_NUMBER_28)
    }

    public open func runIteration(): Unit {
        Crypt.encrypt()
        Crypt.decrypt()
    }

    static func cryptoRunIteration(): Unit {
        let benchmark = Benchmark()
        let setupStart = Float64(DateTime.now().toUnixTimeStamp().toNanoseconds()) / 1000000.0
        benchmark.cryptoSetup()
        let setupEnd = Float64(DateTime.now().toUnixTimeStamp().toNanoseconds()) / 1000000.0
        let runTimes = ArrayList<?Float64>()
        let runStart = Float64(DateTime.now().toUnixTimeStamp().toNanoseconds()) / 1000000.0
        var index = 0i64
        while (index < Crypto.CRYPTO_RUNCOUNT_120) {
            let start = Float64(DateTime.now().toUnixTimeStamp().toNanoseconds()) / 1000000.0
            benchmark.runIteration()
            let end = Float64(DateTime.now().toUnixTimeStamp().toNanoseconds()) / 1000000.0
            let runtime = end - start
            runTimes.add(runtime)
            index++
        }
        let endTime = Float64(DateTime.now().toUnixTimeStamp().toNanoseconds()) / 1000000.0
        println("crypto: ms = " + ((endTime - setupStart).toString()))
    }

    static func debugLog(str: ?String): Unit {
        let isLog = false
        if (isLog) {
            println(str ?? "null")
        }
    }

    static func insertBigIntegerValue(arr: ArrayList<?BigInteger>, value: BigInteger, i: Int64): Unit {
        if (i < arr.size) {
            arr[i] = value
        } else {
            let surplus = i - arr.size
            let surplusArr = Array<?BigInteger>(surplus + 1, repeat : None)
            arr.add(all: surplusArr)
            arr[i] = value
        }
    }

    static func insertValue(arr: ArrayList<?Int64>, value: Int64, i: Int64): Unit {
        if (i < arr.size) {
            arr[i] = value
        } else {
            let surplus = i - arr.size
            let surplusArr = Array<Option<Int64>>(surplus + 1, repeat : None)
            arr.add(all: surplusArr)
            arr[i] = value
        }
    }

    public static func javaMain(args: ?Array<?String>): Unit {
        cryptoRunIteration()
    }

    public open func hashCode(): Int64 {
        return 0
    }

    public open func toString(): String {
        return "Benchmark@${0}"
    }
}

extend Benchmark <: Equatable<Benchmark> {
    public operator func == (that: Benchmark): Bool {
        return refEq(this, that)
    }

    public operator func != (that: Benchmark): Bool {
        return !(this == that)
    }
}

main() {
    Benchmark.javaMain([])
}
