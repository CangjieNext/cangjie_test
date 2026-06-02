/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*
import std.math as smath
import std.random.*

foreign func pow(x: Float64, y: Float64): Float64

main() {
    var rdm: Random = Random()
    var Base: Float64 = rdm.nextFloat64() * Float64.Max
    var Base_smaller: Float64 = rdm.nextFloat64()
    var Exponent: Float64 = rdm.nextFloat64() * Float64.Max
    var Exponent_smaller: Float64 = rdm.nextFloat64()
    var Exponent_100: Float64 = rdm.nextFloat64() * 100.0
    var Exponent_1000: Float64 = rdm.nextFloat64() * 1000.0

    var ExponentInt32: Int32 = rdm.nextInt32()
    var ExponentInt64: Int64 = rdm.nextInt64()

    func cfunction(base: Float64, exponent: Float64): Float64 {
        return unsafe { pow(base, exponent) }
    }

    //求奇偶数 flag 1:奇数 2：偶数
    func to_odd_Or_even(x: Int32, flag: Int32): Int32 {
        if (flag == 1) {
            return (x / 2 * 2) + 1
        } else {
            return x / 2 * 2
        }
    }

    //求正负数 flag 1:positive 2:Negative
    func to_positive_Or_Negative(x: Int32, flag: Int32): Int32 {
        if (flag == 1) {
            return abs(x)
        } else {
            return abs(x) * (-1)
        }
    }

    func to_positive_Or_Negative(x: Float64, flag: Int32): Float64 {
        if (flag == 1) {
            return abs(x)
        } else {
            return abs(x) * (-1.0)
        }
    }

    func not_1(x: Float64): Float64 {
        if (abs(x) >= 0.999999999999999 && abs(x) <= 1.000000000000001) {
            return rdm.nextFloat64()
        } else {
            return x
        }
    }

    CaseRunner<Float64>().runCases(
        [
            (smath.pow(Float64.Max, Float64(1.0)), Float64.Max, Float64(1e-15)), // Float64.Max ** Float64(1.0) = Float64.Max
            (smath.pow(Float64.Min, Float64(1.0)), Float64.Min, Float64(1e-15)), // Float64.Min ** Float64(1.0) = Float64.Min
            (smath.pow(Float64(1.1), Float64(0.0)), Float64(1.0), Float64(1e-15)) // Float64(1.1) ** Float64(0.0) = Float64(1.0)

        ],
        description: "Float64：边界值验证"
    )

    CaseRunner<Float64>().runCases(
        [
            (smath.pow(Base, Exponent), cfunction(Base, Exponent), Float64(1e-15)), // base,exponent 均为随机数对比验证
            (smath.pow(Base, Exponent_smaller), cfunction(Base, Exponent_smaller), Float64(1e-15)), // base,exponent 均为随机数对比验证 exponent < 1
            (smath.pow(Base_smaller, Exponent), cfunction(Base_smaller, Exponent), Float64(1e-15)), // base,exponent 均为随机数对比验证 base < 1
            (smath.pow(Base_smaller, Exponent_smaller), cfunction(Base_smaller, Exponent_smaller), Float64(1e-15)), // base,exponent 均为随机数对比验证 base，exponent < 1

            (smath.pow(to_positive_Or_Negative(Base, 2), to_positive_Or_Negative(Exponent, 2)), cfunction(
                    to_positive_Or_Negative(Base, 2), to_positive_Or_Negative(Exponent, 2)), Float64(1e-15)), // base,exponent 均为随机负数对比验证
            //(smath.pow(to_positive_Or_Negative(Base,2), to_positive_Or_Negative(Exponent_smaller,2)), cfunction(to_positive_Or_Negative(Base,2), to_positive_Or_Negative(Exponent_smaller,2)), Float64(1e-15)), // base,exponent 均为随机负数对比验证 exponent < 1
            (smath.pow(to_positive_Or_Negative(Base_smaller, 2), to_positive_Or_Negative(Exponent, 2)), cfunction(
                    to_positive_Or_Negative(Base_smaller, 2), to_positive_Or_Negative(Exponent, 2)), Float64(1e-15)), // base,exponent 均为随机负数对比验证 base < 1
            //(smath.pow(to_positive_Or_Negative(Base_smaller,2), to_positive_Or_Negative(Exponent_smaller,2)), cfunction(to_positive_Or_Negative(Base_smaller,2), to_positive_Or_Negative(Exponent_smaller,2)), Float64(1e-15)), // base,exponent 均为随机负数对比验证 base，exponent < 1

            (smath.pow(Base, Exponent_100), cfunction(Base, Exponent_100), Float64(1e-15)), // base,exponent 均为随机数对比验证 exponent * 100 增加返回值不为Inf的概率
            (smath.pow(Base, Exponent_1000), cfunction(Base, Exponent_1000), Float64(1e-15)) // base,exponent 均为随机数对比验证 exponent * 1000 增加返回值不为Inf的概率

        ],
        description: "Float64：base,exponent 均为Float64随机数与C语言math库对比验证"
    )

    CaseRunner<Float64>().runCases(
        [

            //当左操作类型为 Float64，右操作数类型为 Float64 时，同样存在一些特殊情况需要明确求幂表达式的值。
            (smath.pow(Base, Float64(0.0)), Float64(1.0), Float64(1e-15)), // x ** 0.0 = 1.0  for any x
            (smath.pow(Base, Float64(-0.0)), Float64(1.0), Float64(1e-15)), // x ** -0.0 = 1.0  for any x
            (smath.pow(Float64(0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 2))), inf64,
                Float64(1e-15)), // 0.0 ** y = POSITIVE_INFINITY  for the value of y is equal to an odd integer < 0
            (smath.pow(Float64(-0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 2))), -inf64,
                Float64(1e-15)), // -0.0 ** y = NEGATIVE_INFINITY  for the value of y is equal to an odd integer < 0
            (smath.pow(Float64(0.0), -inf64), inf64, Float64(1e-15)), // 0.0 ** NEGATIVE_INFINITY = POSITIVE_INFINITY
            (smath.pow(Float64(-0.0), -inf64), inf64, Float64(1e-15)), // -0.0 ** NEGATIVE_INFINITY = POSITIVE_INFINITY
            (smath.pow(Float64(0.0), inf64), Float64(0.0), Float64(1e-15)), // 0.0 ** POSITIVE_INFINITY = 0.0
            (smath.pow(Float64(-0.0), inf64), Float64(0.0), Float64(1e-15)), // -0.0 ** POSITIVE_INFINITY = 0.0
            (smath.pow(Float64(0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 1))), Float64(0.0),
                Float64(1e-15)), // 0.0 ** y = 0.0 for finite y > 0.0 and its value is equal to an odd integer
            (smath.pow(Float64(-0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 1))), Float64(-0.0),
                Float64(1e-15)), // -0.0 ** y = -0.0 for finite y > 0.0 and its value is equal to an odd integer
            (smath.pow(Float64(-1.0), inf64), Float64(1.0), Float64(1e-15)), // -1.0 ** POSITIVE_INFINITY = 1.0
            (smath.pow(Float64(-1.0), -inf64), Float64(1.0), Float64(1e-15)), // -1.0 ** NEGATIVE_INFINITY = 1.0
            (smath.pow(Float64(1.0), Exponent), Float64(1.0), Float64(1e-15)), // 1.0 ** y = 1.0  for any y

            (smath.pow(Base_smaller, inf64), Float64(0.0), Float64(1e-15)), //x ** POSITIVE_INFINITY = 0.0 for 0.0 < x < 1.0
            (smath.pow(to_positive_Or_Negative(Base_smaller, 2), inf64), Float64(0.0), Float64(1e-15)), //x ** POSITIVE_INFINITY = 0.0 for -1.0 < x < 0.0
            (smath.pow(Base_smaller + 1.0, inf64), inf64, Float64(1e-15)), //x ** POSITIVE_INFINITY = POSITIVE_INFINITY for any x > 1.0
            (smath.pow(to_positive_Or_Negative(Base_smaller, 2) - 1.0, inf64), inf64, Float64(1e-15)), //x ** POSITIVE_INFINITY = POSITIVE_INFINITY for any x < -1.0

            (smath.pow(Base_smaller, -inf64), inf64, Float64(1e-15)), //x ** NEGATIVE_INFINITY = POSITIVE_INFINITY for 0.0 < x < 1.0
            (smath.pow(to_positive_Or_Negative(Base_smaller, 2), -inf64), inf64, Float64(1e-15)), //x ** NEGATIVE_INFINITY = POSITIVE_INFINITY for -1.0 < x < 0.0
            (smath.pow(Base_smaller + 1.0, -inf64), Float64(0.0), Float64(1e-15)), //x ** NEGATIVE_INFINITY = 0.0 for any x > 1.0
            (smath.pow(to_positive_Or_Negative(Base_smaller, 2) - 1.0, -inf64), Float64(0.0), Float64(1e-15)), //x ** NEGATIVE_INFINITY = 0.0 for any x < -1.0

            (smath.pow(inf64, to_positive_Or_Negative(Exponent, 2)), Float64(0.0), Float64(1e-15)), //POSITIVE_INFINITY ** y = 0.0  for y < 0.0
            (smath.pow(inf64, to_positive_Or_Negative(Exponent, 1)), inf64, Float64(1e-15)), //POSITIVE_INFINITY ** y = POSITIVE_INFINITY for y > 0.0

            (smath.pow(-inf64, Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 2))), Float64(0.0),
                Float64(1e-15)), //NEGATIVE_INFINITY ** y = -0.0 for finite y < 0.0 and its value is equal to an odd integer
            (smath.pow(-inf64, Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 1))), -inf64, Float64(1e-15)), //NEGATIVE_INFINITY ** y = NEGATIVE_INFINITY for finite y > 0.0 and its value is equal to an odd integer

            (smath.pow(-inf64, Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 2))), Float64(0.0),
                Float64(1e-15)), //NEGATIVE_INFINITY ** y = 0.0 for finite y < 0.0 and its value is not equal to an odd integer
            (smath.pow(-inf64, Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 1))), inf64, Float64(1e-15)), //NEGATIVE_INFINITY ** y = NEGATIVE_INFINITY for finite y > 0.0 and its value is equal to an odd integer
            (smath.pow(Float64(0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 2))), inf64,
                Float64(1e-15)), //0.0 ** y = POSITIVE_INFINITY for finite y < 0.0 and its value is not equal to an odd integer
            (smath.pow(Float64(-0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 2))), inf64,
                Float64(1e-15)), //-0.0 ** y = POSITIVE_INFINITY for finite y < 0.0 and its value is not equal to an odd integer
            (smath.pow(Float64(0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 1))), Float64(0.0),
                Float64(1e-15)), //0.0 ** y = 0.0 for finite y > 0.0 and its value is not equal to an odd integer
            (smath.pow(Float64(-0.0), Float64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 1))), Float64(0.0),
                Float64(1e-15)) //-0.0 ** y = 0.0 for finite y > 0.0 and its value is not equal to an odd integer

        ],
        description: "Float64：一些特殊情况需要明确求幂表达式的值"
    )

    CaseRunner<Float64>().runCases(
        [
            (smath.pow(Float64.Max, Int64(1)), Float64.Max, Float64(1e-15)), // Float64.Max ** Int64(1) = Float64.Max
            (smath.pow(Float64.Min, Int64(1)), Float64.Min, Float64(1e-15)), // Float64.Min ** Int64(1) = Float64.Min
            (smath.pow(Float64(1.1), Int64(0)), Float64(1.0), Float64(1e-15)) // Float64(1.1) ** Int64(0) = Float64(1.0)

        ],
        description: "Float64,Int64：边界值验证"
    )

    CaseRunner<Float64>().runCases(
        [
            (smath.pow(Float64(2.2), Int64(2)), Float64(4.84), Float64(0.000001)),
            (smath.pow(Float64(2.2), Int64(-2)), Float64(0.206611), Float64(0.000001)),
            (smath.pow(Float64(1.938272896481110), Int64(3)), Float64(7.281900974836969), Float64(1e10)),
            (smath.pow(Float64(1.485705237242234), Int64(12)), Float64(115.662307247879724), Float64(1e10)),
            (smath.pow(Float64(2.642169920966885), Int64(4)), Float64(48.735225129632738), Float64(1e10)),
            (smath.pow(Float64(3.756661068691912), Int64(-5)), Float64(0.001336564522690), Float64(1e10)),
            (smath.pow(Float64(1.810577349498990), Int64(-9203446)), Float64(0.000000000000000), Float64(1e10)),
            (smath.pow(Float64(4.515586779635886), Int64(1957481465)), inf64, Float64(1e10)),
            (smath.pow(Float64(0.112416532406611), Int64(103775914)), Float64(0.000000000000000), Float64(1e10)),
            (smath.pow(Float64(1.163717392657175), Int64(-2085801921)), Float64(0.000000000000000), Float64(1e10)),
            (smath.pow(Float64(0.170173782467842), Int64(-2125917363)), inf64, Float64(1e10))
        ],
        description: "base是Float64,exponent是整数Int64"
    )

    CaseRunner<Float64>().runCases(
        [

            //当左操作类型为 Float64，右操作数类型为 Int64 时，存在一些特殊情况需要明确求幂表达式的值。
            (smath.pow(Base, Int64(0.0)), Float64(1.0), Float64(1e-15)), // x ** 0 = 1.0 for any x
            (smath.pow(Float64(0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 2))), inf64,
                Float64(1e-15)), // 0.0 ** n = POSITIVE_INFINITY for odd n < 0
            (smath.pow(Float64(-0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 2))), -inf64,
                Float64(1e-15)), // -0.0 ** n = NEGATIVE_INFINITY  for odd n < 0
            (smath.pow(Float64(0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 2))), inf64,
                Float64(1e-15)), // 0.0 ** n = POSITIVE_INFINITY for even n < 0
            (smath.pow(Float64(-0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 2))), inf64,
                Float64(1e-15)), // -0.0 ** n = POSITIVE_INFINITY  for even n < 0

            (smath.pow(Float64(0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 1))), Float64(0.0),
                Float64(1e-15)), // 0.0 ** n = 0.0 for even n > 0
            (smath.pow(Float64(-0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 1))), Float64(0.0),
                Float64(1e-15)), // -0.0 ** n = 0.0 for even n > 0
            (smath.pow(Float64(0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 1))), Float64(0.0),
                Float64(1e-15)), // 0.0 ** n = 0.0 for odd n > 0
            (smath.pow(Float64(-0.0), Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 1))), Float64(-0.0),
                Float64(1e-15)), // -0.0 ** n = -0.0 for odd n > 0

            (smath.pow(inf64, Int64(to_positive_Or_Negative(ExponentInt32, 1))), inf64, Float64(1e-15)), // POSITIVE_INFINITY ** n = POSITIVE_INFINITY for n > 0
            (smath.pow(-inf64, Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 1))), -inf64, Float64(1e-15)), // NEGATIVE_INFINITY ** n = NEGATIVE_INFINITY for odd n > 0
            (smath.pow(-inf64, Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 1))), inf64, Float64(1e-15)), // NEGATIVE_INFINITY ** n = POSITIVE_INFINITY for even n > 0

            (smath.pow(inf64, Int64(to_positive_Or_Negative(ExponentInt32, 2))), Float64(0.0), Float64(1e-15)), // POSITIVE_INFINITY ** n = 0.0 for n < 0
            (smath.pow(-inf64, Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 1), 2))), Float64(-0.0),
                Float64(1e-15)), // NEGATIVE_INFINITY ** n = -0.0 for odd n < 0
            (smath.pow(-inf64, Int64(to_positive_Or_Negative(to_odd_Or_even(ExponentInt32, 2), 2))), Float64(0.0),
                Float64(1e-15)) // NEGATIVE_INFINITY ** n = 0.0 for even n < 0

        ],
        description: "Float64, Int64：一些特殊情况需要明确求幂表达式的值"
    )

    CaseRunner<Bool>().runCasesTrue(
        [smath.pow(to_positive_Or_Negative(Base, 2), not_1(Exponent_smaller)).isNaN() //x ** y = NaN for finite x < 0.0 and finite y whose value is not equal to an integer

            ],
        description: "Float64：一些特殊情况需要明确求幂表达式的值 x ** y = NaN"
    )

    CaseRunner<Bool>().runCasesTrue(
        [
            //一旦有操作数的值为 NaN，则求幂表达式的值等于 NaN
            smath.pow(Base, nan64).isNaN(),
            smath.pow(Base, -nan64).isNaN(),
            smath.pow(nan64, Exponent).isNaN(),
            smath.pow(-nan64, Exponent).isNaN(),
            smath.pow(nan64, nan64).isNaN(),
            smath.pow(nan64, -nan64).isNaN(),
            smath.pow(-nan64, nan64).isNaN(),
            smath.pow(-nan64, -nan64).isNaN()
        ],
        description: "Float64,Float64：一些特殊情况需要明确求幂表达式的值 任意操作数的值为 NaN"
    )

    CaseRunner<Bool>().runCasesTrue(
        [
            //当左操作数的值为 NaN 时，无论右操作数取何值，求幂表达式的值均等于 NaN
            smath.pow(Float64.NaN, ExponentInt64).isNaN()],
        description: "Float64,Int64：当左操作数的值为 NaN 时，无论右操作数取何值，求幂表达式的值均等于 NaN"
    )

    return 0
}
