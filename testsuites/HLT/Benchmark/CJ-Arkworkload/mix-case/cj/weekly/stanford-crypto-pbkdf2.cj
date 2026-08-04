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
import std.time.*
import std.collection.*
import std.math.*
import std.convert.*
import std.regex.*
import std.env.*

/**
 * Arrays of bits, encoded as arrays of Numbers.
 * @namespace
 * @description
 * <p>
 * These objects are the currency accepted by SJCL's crypto functions.
 * </p>
 *
 * <p>
 * Most of our crypto primitives operate on arrays of 4-byte words internally,
 * but many of them can take arguments that are not a multiple of 4 bytes.
 * This library encodes arrays of bits (whose size need not be a multiple of 8
 * bits) as arrays of 32-bit words.  The bits are packed, big-endian, into an
 * array of words, 32 bits at a time.  Since the words are double-precision
 * floating point numbers, they fit some extra data.  We use this (in a private,
 * possibly-changing manner) to encode the number of bits actually  present
 * in the last word of the array.
 * </p>
 *
 * <p>
 * Because bitwise ops clear this out-of-band data, these arrays can be passed
 * to ciphers like AES which want arrays of words.
 * </p>
 */
class BitArray {

    /**
     * Make a partial word for a bit array.
     * @param {Number} len The number of bits in the word.
     * @param {Number} x The bits.
     * @param {Number} [_end=0] Pass 1 if x has already been shifted to the high side.
     * @return {Number} The partial word.
     */
    static func partial(len: Int, x: Int, end!: Bool = false): Int {
        if (len == 32) {
            return x
        } else {
            var result = 0
            if (end) {
                result = x | 0 + len * 0x10000000000
            } else {
                result = initUInt32(x << (32 - len)) + len * 0x10000000000
            }

            return result
        }
    }

    /**
     * Concatenate two bit arrays.
     * @param {bitArray} a1 The first array.
     * @param {bitArray} a2 The second array.
     * @return {bitArray} The concatenation of a1 and a2.
     */
    static func concat(a1: ArrayList<Int64>, a2: ArrayList<Int64>): ArrayList<Int64> {
        if (a1.size == 0 || a2.size == 0) {
            var tmp = a1.clone()
            tmp.add(all: a2)
            return tmp
        }

        let last = a1[a1.size - 1]
        var shift = BitArray.getPartial(last)
        if (shift == 32) {
            var tmp = a1.clone()
            tmp.add(all: a2)
            return tmp
        } else {
            return BitArray.shiftRight(a2, shift, carry: last | 0, out: a1[0..a1.size - 1])
        }
    }

    /**
     * Truncate an array.
     * @param {bitArray} a The array.
     * @param {Number} len The length to truncate to, in bits.
     * @return {bitArray} A new array, truncated to len bits.
     */
    static func clamp(a: ArrayList<Int64>, len: Int): ArrayList<Int64> {
        var _a = a
        var _len = len
        if (_a.size * 32 < _len) {
            return _a
        }

        let sliceLength = Int64(ceil(Float64(_len) / 32.0))
        _a = a[0..sliceLength]

        let l = _a.size
        _len = _len & 31

        if (l > 0 && _len != 0) {
            _a[l - 1] = BitArray.partial(_len, _a[l - 1] & 0x80000000 >> (_len - 1), end: true)
        }

        return _a
    }

    /**
     * Find the length of an array of bits.
     * @param {bitArray} a The array.
     * @return {Number} The length of a, in bits.
     */
    static func bitLength(a: ArrayList<Int64>): Int64 {
        let l = a.size
        var x: ?Int
        if (l == 0) {
            return 0
        }
        x = a[l - 1]
        return (l - 1) * 32 + BitArray.getPartial(x.getOrThrow())
    }

    /**
     * Get the number of bits used by a partial word.
     * @param {Number} x The partial word.
     * @return {Number} The number of bits used by the partial word.
     */
    static func getPartial(x: Int): Int {
        if (Int64(round(Float64(x))) / 0x10000000000 != 0) {
            return Int64(round(Float64(x))) / 0x10000000000
        } else {
            return Int64(32)
        }
    }
    /** Shift an array right.
     * @param {bitArray} a The array to shift.
     * @param {Number} shift The number of bits to shift.
     * @param {Number} [carry=0] A byte to carry in
     * @param {bitArray} [out=[]] An array to prepend to the output.
     * @private
     */
    @OverflowWrapping
    static func shiftRight(a: ArrayList<Int64>, shift: Int, carry!: Int = 0, out!: ArrayList<Int64> = ArrayList<Int64>()): ArrayList<Int64> {
        var last2 = 0
        var shift2: Int64
        var _out = out
        var _carry = initUInt32(carry)
        var _shift = shift
        if (_out.size == 0) {
            _out = ArrayList<Int64>()
        }

        while (_shift >= 32) {
            _out.add(_carry)
            _carry = 0
            _shift -= 32
        }

        if (_shift == 0) {
            var tmp = _out
            tmp.add(all: a)
            return tmp
        }

        for (i in 0..a.size) {
            _out.add((_carry | Int64(UInt32(initUInt32(a[i])) >> _shift)))
            _carry = (a[i] << (32 - _shift)) & 0xFFFFFFFF
        }

        if (a.size == 0) {
            last2 = 0
        } else {
            last2 = a[a.size - 1]
        }

        if (BitArray.getPartial(last2) != 0) {
            shift2 = 1
        } else {
            shift2 = 0
        }

        if (_shift + shift2 > 32) {
            _out.add(BitArray.partial(_shift + shift2 & 31, _carry, end: true))
        } else {
            _out.add(BitArray.partial(_shift + shift2 & 31, _out.remove(at: _out.size - 1), end: true))
        }

        return _out
    }
}

/**
 * UTF-8 strings
 * @namespace
 */
class Utf8String {
    static func toBits(str: String): ArrayList<Int64> {
        var out: ArrayList<Int64> = ArrayList<Int64>()
        var i: Int = 0
        var tmp: Int = 0
        let charArr = str.toArray()
        while (i < str.size) {
            tmp = tmp << 8 | Int64(charArr[i])
            if ((i & 3) == 3) {
                out.add(tmp)
                tmp = 0
            }
            i += 1
        }
        if ((i & 3) != 0) {
            out.add(BitArray.partial(8 * (i & 3), tmp))
        }
        return out
    }
}

/**
 * Hexadecimal
 * @namespace
 */
class SJCLCodecHex {
    /** Convert from a bitArray to a hex string. */
    static func fromBits(arr: ArrayList<Int64>): String {
        var out = ""
        for (i in 0..arr.size) {
            let hexValue: Int64 = (arr[i] | 0) + 0xF00000000000
            out += hexValue.format("x")[4..]
        }
        let str = out[0..BitArray.bitLength(arr) / 4]
        return "${str}"
    }

    /** Convert from a hex string to a bitArray. */
    static func toBits(str: String): ArrayList<Int64> {
        var out: ArrayList<Int64> = ArrayList<Int64>()

        var strHex = Matcher(Regex("\\s|0x"), str).replaceAll("")

        let len = strHex.size
        strHex = strHex + "00000000"
        var i = 0
        while (i < strHex.size) {
            let hexValue = hexSwitch(strHex[i..i + 8])
            out.add(initUInt32(hexValue) ^ 0)
            i += 8
        }

        return BitArray.clamp(out, len * 4)
    }
}

func hexSwitch(charArr: String): Int64 {
    var i = 0
    var sum = 0
    while (i < charArr.size) {
        let s = charArr[i]
        var n = 0
        match (s) {
            case b'A' => n = 10
            case b'B' => n = 11
            case b'C' => n = 12
            case b'D' => n = 13
            case b'E' => n = 14
            case b'F' => n = 15
            case _ => n = (n as Int64).getOrThrow()
        }
        sum = sum + n * Int64(pow(Float64(16.0), Float64(charArr.size - i - 1)))
        i += 1
    }
    return sum
}

/** @fileOverview Javascript SHA-256 implementation.
 *
 * An older version of this implementation is available in the public
 * domain, but this one is (c) Emily Stark, Mike Hamburg, Dan Boneh,
 * Stanford University 2008-2010 and BSD-licensed for liability
 * reasons.
 *
 * Special thanks to Aldo Cortesi for pointing out several bugs in
 * this code.
 *
 * @author Emily Stark
 * @author Mike Hamburg
 * @author Dan Boneh
 */
class Sha256 {
    /**
     * The SHA-256 initialization vector, to be precomputed.
     * @private
     */
    var _init: ArrayList<Int64> = ArrayList<Int64>()
    /*
       _init:[0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19],
     */

    /**
     * The SHA-256 hash key, to be precomputed.
     * @private
     */
    var _key: ArrayList<Int64> = ArrayList<Int64>()
    /*
       _key:
       [0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
       0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
       0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
       0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
       0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
       0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
       0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
       0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2],
     */

    /**
     * The hash's block size, in bits.
     * @constant
     */
    var blockSize = 512

    var _h: ArrayList<Int64> = ArrayList<Int64>()

    var _buffer: ArrayList<Int64> = ArrayList<Int64>()

    var _length = 0

    /**
     * Hash a string or an array of words.
     * @static
     * @param {bitArray|String} data the data to hash.
     * @return {bitArray} The hash value, an array of 16 big-endian words.
     */
    static func hash(data: Any): ArrayList<Int64> {
        return Sha256(hash: Option<Sha256>.None).update(data).finalize()
    }
    /**
     * Context for a SHA-256 operation in progress.
     * @constructor
     */
    init(hash!: ?Sha256 = Option<Sha256>.None) {
        if (this._key.size == 0) {
            this._precompute()
        }
        if (hash.isSome()) {
            this._h = hash.getOrThrow()._h
            this._buffer = hash.getOrThrow()._buffer
            this._length = hash.getOrThrow()._length
        } else {
            this.reset()
        }
    }
    func frac(x: Float64): Int64 {
        var a = Int64((x - floor(x)) * Float64(0x100000000)) | 0
        a = initUInt32(a)
        return a
    }
    /**
     * Function to precompute _init and _key.
     * @private
     */
    private func _precompute() {
        var i = 0
        var prime = 2
        var isPrime: Bool
        this._init = ArrayList<Int64>(8, {x: Int64 => 0})
        this._key = ArrayList<Int64>(64, {x: Int64 => 0})
        while (i < 64) {
            isPrime = true
            var factor = 2
            while (factor * factor <= prime) {
                if (prime % factor == 0) {
                    isPrime = false
                    break
                }
                factor += 1
            }
            if (isPrime) {
                if (i < 8) {
                    this._init[i] = this.frac(pow(Float64(prime), 1.0 / 2.0))
                }
                this._key[i] = this.frac(pow(Float64(prime), 1.0 / 3.0))
                i += 1
            }
            prime += 1
        }
    }
    /**
     * Reset the hash state.
     * @return this
     */
    func reset(): Sha256 {
        this._h = this._init
        this._buffer = ArrayList<Int64>()
        this._length = 0
        return this
    }
    /**
     * Input several words to the hash.
     * @param {bitArray|String} data the data to hash.
     * @return this
     */
    func update(datas: Any): Sha256 {
        var data: ArrayList<Int64> = ArrayList<Int64>()
        if (datas is String) {
            data = Utf8String.toBits((datas as String).getOrThrow())
        } else {
            data = (datas as ArrayList<Int64>).getOrThrow()
        }
        var i: Int = 0
        this._buffer = BitArray.concat(this._buffer, data)
        var b = this._buffer
        let ol = this._length
        this._length = this._length + BitArray.bitLength(data)
        let nl = this._length
        if (nl > 9007199254740991) {
            throw Exception("INVALID Cannot hash more than 2^53 - 1 bits")
        }

        var c: ArrayList<Int64> = ArrayList<Int64>()
        for (item in b) {
            c.add(initUInt32(item))
        }

        var j = 0
        i = 512 + ol - ((512 + ol) & 511)
        while (i <= nl) {
            this._block(c[16 * j..16 * (j + 1)])
            j += 1
            i += 512
        }
        b.remove(0..16 * j)
        return this
    }

    /**
     * Complete hashing and output the hash value.
     * @return {bitArray} The hash value, an array of 8 big-endian words.
     */
    func finalize(): ArrayList<Int64> {
        // Round out and push the buffer
        _buffer = BitArray.concat(_buffer, ArrayList<Int64>([BitArray.partial(1, 1)]))

        // Round out the buffer to a multiple of 16 words, less the 2 length words.
        var i = _buffer.size + 2
        while ((i & 15) != 0) {
            _buffer.add(0)
            i += 1
        }

        // append the length
        let a = this._length / 0x100000000 | 0
        _buffer.add(a)
        _buffer.add(this._length)

        while (!(_buffer.size == 0)) {
            let chunk = _buffer[0..16]
            this._buffer.remove(0..16)
            this._block(chunk)
        }
        this.reset()
        return _h
    }

    /**
     * Perform one cycle of SHA-256.
     * @param {Uint32Array|bitArray} w one block of words.
     * @private
     */
    @OverflowWrapping
    private func _block(input: ArrayList<Int64>) {
        var w = input
        var tmp: Int64
        var a: Int64
        var b: Int64
        let k = this._key
        var h0 = _h[0]
        var h1 = _h[1]
        var h2 = _h[2]
        var h3 = _h[3]
        var h4 = _h[4]
        var h5 = _h[5]
        var h6 = _h[6]
        var h7 = _h[7]

        /* Rationale for placement of |0 :
         * If a value can overflow is original 32 bits by a factor of more than a few
         * million (2^23 ish), there is a possibility that it might overflow the
         * 53-bit mantissa and lose precision.
         *
         * To avoid this, we clamp back to 32 bits by |'ing with 0 on any value that
         * propagates around the loop, and on the hash state h[].  I don't believe
         * that the clamps on h4 and on h0 are strictly necessary, but it's close
         * (for h4 anyway), and better safe than sorry.
         *
         * The clamps on h[] are necessary for the output to be correct even in the
         * common case and for short inputs.
         */
        for (i in 0..64) {
            // load up the input word for this round
            if (i < 16) {
                tmp = w[i]
            } else {
                a = initUInt32(w[(i + 1) & 15])
                b = initUInt32(w[(i + 14) & 15])

                let value1 = Int64(UInt32(a) >> 7) ^ Int64(UInt32(a) >> 18) ^ Int64(UInt32(a) >> 3) ^ a << 25 ^ a << 14
                let value2 = Int64(UInt32(b) >> 17) ^ Int64(UInt32(b) >> 19) ^ Int64(UInt32(b) >> 10) ^ b << 15 ^ b << 13
                let value3 = w[i & 15] + w[(i + 9) & 15]

                w[i & 15] = initUInt32(value1 + value2 + value3)
                tmp = w[i & 15]
            }
            h4 = initUInt32(h4)

            let value = Int64(UInt32(h4) >> 6) ^ Int64(UInt32(h4) >> 11) ^ Int64(UInt32(h4) >> 25) ^ h4 << 26 ^ h4 << 21 ^
                h4 << 7

            tmp = Int64(initUInt32(tmp + h7 + value + (h6 ^ h4 & (h5 ^ h6)) + k[i]))
            // shift register
            h7 = initUInt32(h6)
            h6 = initUInt32(h5)
            h5 = initUInt32(h4)
            h4 = initUInt32(h3 + tmp)
            h3 = initUInt32(h2)
            h2 = initUInt32(h1)
            h1 = initUInt32(h0)
            h0 = initUInt32(
                tmp + ((h1 & h2) ^ (h3 & (h1 ^ h2))) + (Int64(UInt32(h1) >> 2) ^ Int64(UInt32(h1) >> 13) ^ Int64(UInt32(h1) >>
                    22) ^ h1 << 30 ^ h1 << 19 ^ h1 << 10))
        }
        _h[0] = initUInt32(_h[0] + h0)
        _h[1] = initUInt32(_h[1] + h1)
        _h[2] = initUInt32(_h[2] + h2)
        _h[3] = initUInt32(_h[3] + h3)
        _h[4] = initUInt32(_h[4] + h4)
        _h[5] = initUInt32(_h[5] + h5)
        _h[6] = initUInt32(_h[6] + h6)
        _h[7] = initUInt32(_h[7] + h7)
        _init = _h
    }
}
/** HMAC with the specified hash function.
 * @constructor
 * @param {bitArray} key the key for HMAC.
 * @param {Object} [Hash=sjcl.hash.sha256] The hash function to use.
 */

class HMAC {
    var hash: Sha256
    var baseHash: ArrayList<Sha256>
    var resultHash: Sha256
    var exKey: ArrayList<ArrayList<Int64>> = ArrayList<ArrayList<Int64>>.of(ArrayList<Int64>([]), ArrayList<Int64>([]))
    var updated: Bool = false

    // @OverflowWrapping
    init(key!: ArrayList<Int64> = ArrayList<Int64>(), hash!: Sha256 = Sha256()) {
        this.hash = hash
        this.baseHash = ArrayList<Sha256>([Sha256(), Sha256()])
        let bs = hash.blockSize / 32
        this.exKey[0] = ArrayList<Int64>(bs, {x: Int64 => 0})
        this.exKey[1] = ArrayList<Int64>(bs, {x: Int64 => 0})
        var _key = key
        if (key.size > bs) {
            _key = Sha256.hash(_key)
        }

        for (i in 0..bs) {
            if (i < key.size) {
                this.exKey[0][i] = _key[i] ^ 0x36363636
                this.exKey[1][i] = _key[i] ^ 0x5C5C5C5C
            } else {
                this.exKey[0][i] = 0 ^ 0x36363636
                this.exKey[1][i] = 0 ^ 0x5C5C5C5C
            }
        }

        this.baseHash[0].update(exKey[0])
        this.baseHash[1].update(exKey[1])
        this.resultHash = this.baseHash[0]
    }

    func encrypt(data: ArrayList<Int64>): ArrayList<Int64> {
        if (!updated) {
            this.update(data)
            return digest()
        } else {
            throw Exception("encrypt on already updated hmac called!")
        }
    }

    func reset() {
        this.resultHash = Sha256(hash: this.baseHash[0])
        this.updated = false
    }

    func update(data: ArrayList<Int64>) {
        this.updated = true
        this.resultHash._buffer = ArrayList<Int64>()
        this.resultHash.update(data)
    }

    func digest(): ArrayList<Int64> {
        let w = this.resultHash.finalize()
        let b = Sha256(hash: this.baseHash[1])
        b._buffer = ArrayList<Int64>()
        let c = b.update(w)

        let finalResult = c.finalize()
        reset()
        return finalResult
    }
}

class Pbkdf2 {
    static func pbkdf2(password: Any, salt: Any, size!: Int64 = 10000, length!: ?Int64 = 0,
        Prff!: ?HMAC = Option<HMAC>.None): ArrayList<Int64> {
        if (length.isNone() || size < 0) {
            throw Exception("invalid params to pbkdf2")
        }
        var passwordArr: ArrayList<Int64> = ArrayList<Int64>()
        var saltArr: ArrayList<Int64> = ArrayList<Int64>()
        if (password is String) {
            let arr = Utf8String.toBits((password as String).getOrThrow())
            var i = 0
            while (i < arr.size) {
                let n = arr[i]
                passwordArr.add(initUInt32(n))
                i += 1
            }
        } else {
            let arr = (password as String).getOrThrow()
            var i = 0
            while (i < arr.size) {
                let n = arr[i]
                passwordArr.add(initUInt32(Int64(n)))
                i += 1
            }
        }
        if (salt is String) {
            let arr = Utf8String.toBits((salt as String).getOrThrow())
            var i = 0
            while (i < arr.size) {
                let n = arr[i]
                saltArr.add(initUInt32(n))
                i += 1
            }
        } else {
            let arr = (salt as ArrayList<Int64>).getOrThrow()
            var i = 0
            while (i < arr.size) {
                let n = arr[i]
                saltArr.add(initUInt32(n))
                i += 1
            }
        }

        var u: ArrayList<Int64>
        var ui: ArrayList<Int64>
        var out: ArrayList<Int64> = ArrayList<Int64>()

        var k = 1

        var tmp = 1
        if (length != 0) {
            tmp = length.getOrThrow()
        }

        while (32 * out.size < tmp) {
            u = HMAC(key: passwordArr).encrypt(BitArray.concat(saltArr, ArrayList<Int64>([k])))
            ui = HMAC(key: passwordArr).encrypt(BitArray.concat(saltArr, ArrayList<Int64>([k])))

            for (_ in 1..size) {
                ui = HMAC(key: passwordArr).encrypt(ui)
                for (j in 0..ui.size) {
                    u[j] ^= ui[j]
                }
            }

            out.add(all: u)
            k += 1
        }

        if (length != 0) {
            out = BitArray.clamp(out, length.getOrThrow())
        }
        
        return out
    }
}
/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    /*
    * @Benchmark
    */
    func runIteration() {
        let startTime = Timer().getTime()
        for (_ in 0..20) {
            let password = getVariable("SRYPTO_PASSWORD").getOrThrow()
            let salt = "BA DB EE FB AD BE EF 00"
            let count = 2048
            let strArr = SJCLCodecHex.toBits(salt)
            
            let output = SJCLCodecHex.fromBits(Pbkdf2.pbkdf2(password, strArr, size: count))
            
            if (output != "5436c4c0d73e425a521f4a5a13e0fffe5cd957a823f435385fa0a75068a26803") {
                throw Exception("Bad output")
            }
        }
        let endTime = Timer().getTime()
        println("stanford-crypto-pbkdf2: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
    }
}

func initUInt32(a: Int64): Int64 {
    var tmp = a
    if (tmp > 2147483647) {
        let max = 4294967295
        tmp = tmp % (max + 1)
        if (tmp > 2147483647) {
            tmp = tmp - max - 1
        }
    } else if (tmp < -2147483648) {
        let max = 4294967295
        tmp = tmp % (max + 1)
        if (tmp < -2147483648) {
            tmp = tmp + max + 1
        }
    }
    return tmp
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

let isDebug: Bool = false
func DeBugLog(msg: Any, file: String, line: Int64, fn: String) {
    if (isDebug) {
        let prefix = "${(msg as String).getOrThrow()}"
        println(prefix)
    }
}

main() {
    Benchmark().runIteration()
}
