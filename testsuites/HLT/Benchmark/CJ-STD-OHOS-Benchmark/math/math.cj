/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*
import std.math.*
import std.overflow.*
import std.convert.*

func timeBenchmarkAbs() {
    var arr = Array<Int64>(100000, {i => -i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = abs(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCheckedAbs() {
    var arr = Array<Int64>(100000, {i => -i})
    var arrTmp = Array<Option<Int64>>(100000, repeat: Some(0))
    var start = DateTime.now()
    for (i in 0..100000) {
        arrTmp[i] = checkedAbs(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCbrt() {
    var arr = Array<Float64>(100000, {i => Float64(i)})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = cbrt(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCeil() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 3.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = ceil(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkClamp() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 3.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = clamp(arr[i], 1.0, 10000.0)
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCountOne() {
    var arr = Array<Int64>(100000, repeat: 0xFFFFFFFFFFFFFFF)
    var start = DateTime.now()
    var temp: Int8 = 0
    for (i in 0..100000) {
        temp = countOnes(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkErf() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 3.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = erf(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkPow() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 2.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = pow(arr[i], Float64(3.0))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkExp() {
    var arr = Array<Float64>(100000, repeat: Float64(0))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] += exp(Float64(3))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkExp2() {
    var arr = Array<Float64>(100000, repeat: Float64(0))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] += exp2(Float64(32))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkFloor() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 3.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = floor(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkGamma() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 3.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = gamma(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkGcd() {
    var arr = Array<Int64>(1000, {i => i + 1})
    var arr2 = Array<Int64>(1000, {i => 999 - i})
    var start = DateTime.now()
    for (i in 0..1000) {
        arr[i] = gcd(arr[i], arr2[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkLcm() {
    var arr = Array<Int64>(1000, {i => i + 1})
    var arr2 = Array<Int64>(1000, {i => 999 - i})
    var start = DateTime.now()
    for (i in 0..1000) {
        arr[i] = lcm(arr[i], arr2[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkLeadingZeros() {
    var arr = Array<Int64>(100000, repeat: 1234567890)
    var start = DateTime.now()
    var temp: Int8 = 0
    for (i in 0..100000) {
        temp = leadingZeros(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkLog() {
    var arr = Array<Float64>(10000, {i => Float64(i + 1)})
    var start = DateTime.now()
    for (i in 0..10000) {
        arr[i] = log(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkLog2() {
    var arr = Array<Float64>(10000, {i => Float64(i + 1)})
    var start = DateTime.now()
    for (i in 0..10000) {
        arr[i] = log2(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkLog10() {
    var arr = Array<Float64>(10000, {i => Float64(i + 1)})
    var start = DateTime.now()
    for (i in 0..10000) {
        arr[i] = log10(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkLogBase() {
    var arr = Array<Float64>(10000, {i => Float64(i + 1)})
    var start = DateTime.now()
    for (i in 0..10000) {
        arr[i] = logBase(arr[i], Float64(3))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkMax() {
    var arr = Array<Int64>(100000, {i => i})
    var arr2 = Array<Int64>(100000, {i => 99999 - i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = max(arr[i], arr2[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkMin() {
    var arr = Array<Int64>(100000, {i => i})
    var arr2 = Array<Int64>(100000, {i => 99999 - i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = min(arr[i], arr2[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkMaxNaN() {
    var arr = Array<Float64>(100000, {i => Float64(i)})
    var arr2 = Array<Float64>(100000, {i => Float64(99999 - i)})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = Float64.max(arr[i], arr2[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkMinNaN() {
    var arr = Array<Float64>(100000, {i => Float64(i)})
    var arr2 = Array<Float64>(100000, {i => Float64(99999 - i)})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = Float64.min(arr[i], arr2[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkReverse() {
    var arr = Array<UInt64>(100000, {i => UInt64(i)})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = reverse(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkRotate() {
    var arr = Array<Int64>(100000, {i => i})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = rotate(arr[i], Int8(5))
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSqrt() {
    var arr = Array<Float64>(100000, {i => Float64(i)})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = sqrt(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkTrailingZeros() {
    var arr = Array<Int64>(100000, repeat: 1234567890)
    var arr2 = Array<Int8>(100000, repeat: Int8(0))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr2[i] += trailingZeros(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkTrunc() {
    var arr = Array<Float64>(100000, {i => Float64(i) / Float64(3)})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] += trunc(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSin() {
    var arr = Array<Float64>(100000, repeat: Float64.GetPI() / 3.0)
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = sin(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCos() {
    var arr = Array<Float64>(100000, repeat: Float64.GetPI() / 3.0)
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = cos(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkTan() {
    var arr = Array<Float64>(100000, repeat: Float64.GetPI() / 3.0)
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = tan(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkAsin() {
    var arr = Array<Float64>(100000, repeat: Float64(0.5))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = asin(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkAcos() {
    var arr = Array<Float64>(100000, repeat: Float64(0.5))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = acos(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkAtan() {
    var arr = Array<Float64>(100000, repeat: Float64(0.5))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = atan(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkSinh() {
    var arr = Array<Float64>(100000, repeat: Float64.GetPI() / 3.0)
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = sinh(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkCosh() {
    var arr = Array<Float64>(100000, repeat: Float64.GetPI() / 3.0)
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = cosh(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkTanh() {
    var arr = Array<Float64>(100000, repeat: Float64.GetPI() / 3.0)
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = tanh(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkAsinh() {
    var arr = Array<Float64>(100000, repeat: Float64(0.5))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = asinh(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkAcosh() {
    var arr = Array<Float64>(100000, repeat: Float64(1.5))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = acosh(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkAtanh() {
    var arr = Array<Float64>(100000, repeat: Float64(0.5))
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = atanh(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

func timeBenchmarkRound() {
    var arr = Array<Float64>(100000, {i => Float64(i) / 3.0})
    var start = DateTime.now()
    for (i in 0..100000) {
        arr[i] = round(arr[i])
    }
    var end = DateTime.now()
    return Float64((end - start).toNanoseconds())
}

class Benchmark {
    func runIterationTime() {
        timeBenchmarkAbs() //warmup
        println("math-abs: ms = ${(timeBenchmarkAbs() / 100000.0 / 1000000.0).format(".8")}")
        println("math-checckedAbs: ms = ${(timeBenchmarkCheckedAbs() / 100000.0 / 1000000.0).format(".8")}")
        println("math-cbrt: ms = ${(timeBenchmarkCbrt() / 100000.0 / 1000000.0).format(".8")}")
        println("math-ceil: ms = ${(timeBenchmarkCeil() / 100000.0 / 1000000.0).format(".8")}")
        println("math-clamp: ms = ${(timeBenchmarkClamp() / 100000.0 / 1000000.0).format(".8")}")
        println("math-countOne: ms = ${(timeBenchmarkCountOne() / 100000.0 / 1000000.0).format(".8")}")
        println("math-erf: ms = ${(timeBenchmarkErf() / 100000.0 / 1000000.0).format(".8")}")
        println("math-pow: ms = ${(timeBenchmarkPow() / 100000.0 / 1000000.0).format(".8")}")
        println("math-exp: ms = ${(timeBenchmarkExp() / 100000.0 / 1000000.0).format(".8")}")
        println("math-exp2: ms = ${(timeBenchmarkExp2() / 100000.0 / 1000000.0).format(".8")}")
        println("math-floor: ms = ${(timeBenchmarkFloor() / 100000.0 / 1000000.0).format(".8")}")
        println("math-gamma: ms = ${(timeBenchmarkGamma() / 100000.0 / 1000000.0).format(".8")}")
        println("math-gcd: ms = ${(timeBenchmarkGcd() / 1000.0 / 1000000.0).format(".8")}")
        println("math-lcm: ms = ${(timeBenchmarkLcm() / 1000.0 / 1000000.0).format(".8")}")
        println("math-leadingZeros: ms = ${(timeBenchmarkLeadingZeros() / 100000.0 / 1000000.0).format(".8")}")
        println("math-log: ms = ${(timeBenchmarkLog() / 10000.0 / 1000000.0).format(".8")}")
        println("math-log2: ms = ${(timeBenchmarkLog2() / 10000.0 / 1000000.0).format(".8")}")
        println("math-log10: ms = ${(timeBenchmarkLog10() / 10000.0 / 1000000.0).format(".8")}")
        println("math-logBase: ms = ${(timeBenchmarkLogBase() / 10000.0 / 1000000.0).format(".8")}")
        println("math-max: ms = ${(timeBenchmarkMax() / 100000.0 / 1000000.0).format(".8")}")
        println("math-min: ms = ${(timeBenchmarkMin() / 100000.0 / 1000000.0).format(".8")}")
        println("math-maxNaN: ms = ${(timeBenchmarkMaxNaN() / 100000.0 / 1000000.0).format(".8")}")
        println("math-minNaN: ms = ${(timeBenchmarkMinNaN() / 100000.0 / 1000000.0).format(".8")}")
        println("math-reverse: ms = ${(timeBenchmarkReverse() / 100000.0 / 1000000.0).format(".8")}")
        println("math-rotate: ms = ${(timeBenchmarkRotate() / 100000.0 / 1000000.0).format(".8")}")
        println("math-sqrt: ms = ${(timeBenchmarkSqrt() / 100000.0 / 1000000.0).format(".8")}")
        println("math-trailingZeros: ms = ${(timeBenchmarkTrailingZeros() / 100000.0 / 1000000.0).format(".8")}")
        println("math-trunc: ms = ${(timeBenchmarkTrunc() / 100000.0 / 1000000.0).format(".8")}")
        println("math-sin: ms = ${(timeBenchmarkSin() / 100000.0 / 1000000.0).format(".8")}")
        println("math-cos: ms = ${(timeBenchmarkCos() / 100000.0 / 1000000.0).format(".8")}")
        println("math-tan: ms = ${(timeBenchmarkTan() / 100000.0 / 1000000.0).format(".8")}")
        println("math-asin: ms = ${(timeBenchmarkAsin() / 100000.0 / 1000000.0).format(".8")}")
        println("math-acos: ms = ${(timeBenchmarkAcos() / 100000.0 / 1000000.0).format(".8")}")
        println("math-atan: ms = ${(timeBenchmarkAtan() / 100000.0 / 1000000.0).format(".8")}")
        println("math-sinh: ms = ${(timeBenchmarkSinh() / 100000.0 / 1000000.0).format(".8")}")
        println("math-cosh: ms = ${(timeBenchmarkCosh() / 100000.0 / 1000000.0).format(".8")}")
        println("math-tanh: ms = ${(timeBenchmarkTanh() / 100000.0 / 1000000.0).format(".8")}")
        println("math-asinh: ms = ${(timeBenchmarkAsinh() / 100000.0 / 1000000.0).format(".8")}")
        println("math-acosh: ms = ${(timeBenchmarkAcosh() / 100000.0 / 1000000.0).format(".8")}")
        println("math-atanh: ms = ${(timeBenchmarkAtanh() / 100000.0 / 1000000.0).format(".8")}")
        println("math-round: ms = ${(timeBenchmarkRound() / 100000.0 / 1000000.0).format(".8")}")
    }
}

main() {
    Benchmark().runIterationTime()
}
