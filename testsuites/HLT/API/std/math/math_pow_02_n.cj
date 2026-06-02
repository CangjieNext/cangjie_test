/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*
import std.random.*

main() {
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(2.2), Float32(2.2)), Float32(5.666695), Float32(0.001)),
            (pow(Float32(2.2), Float32(2)), Float32(4.84), Float32(0.001)),
            (pow(Float32(2.2), Float32(-2.2)), Float32(0.176470), Float32(0.001)),
            (pow(Float32(2.2), Float32(-2)), Float32(0.206611), Float32(0.001)),
            (pow(Float32(0.454099), Float32(0.324191)), Float32(0.774197101593018), Float32(0.000001)),
            (pow(Float32(4.570736), Float32(0.463520)), Float32(2.022632360458374), Float32(0.000001)),
            (pow(Float32(7.386916), Float32(6.153345)), Float32(220776.8906), Float32(0.001)),
            (pow(Float32(0.552941), Float32(4.015821)), Float32(0.092607170343399), Float32(0.000001)),
            (pow(Float32(0.122513), Float32(-0.399773)), Float32(2.314836), Float32(0.000001)),
            (pow(Float32(0.993355), Float32(-2.629788)), Float32(1.017687559127808), Float32(0.000001)),
            (pow(Float32(8.463117), Float32(-6.291790)), Float32(0.000001459398732), Float32(0.000001)),
            (pow(Float32(1.554023), Float32(-0.691986)), Float32(0.737079262733459), Float32(0.000001)),
            (pow(Float32(2.2), -inf32), Float32(0), Float32(0.001)),
            (pow(-inf32, -inf32), Float32(0), Float32(0.001)),
            (pow(inf32, -inf32), Float32(0), Float32(0.001))
        ],
        description: "base是正小数,exponent是整数，小数"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(2.2), Int32(2)), Float32(4.84), Float32(0.000001)),
            (pow(Float32(2.2), Int32(-2)), Float32(0.206611), Float32(0.000001)),
            (pow(Float32(4.241825), Int32(-980984209)), Float32(0.0000000), Float32(0.000001)),
            (pow(Float32(4.518452), Int32(-4)), Float32(0.002399060642347), Float32(0.000001)),
            (pow(Float32(4.149), Int32(20)), Float32(2284910018560.000000), Float32(0.000001)),
            (pow(Float32(2.478), Int32(61)), Float32(1096930448196367756034048.000000), Float32(0.000001)),
            (pow(Float32(66.000), Int32(52)), inf32, Float32(0.000001)),
            (pow(Float32(0.989), Int32(24)), Float32(0.766851), Float32(0.0001)),
            (pow(Float32(0.665335), Int32(-55)), Float32(5404804096.000000), Float32(0.000001))
        ],
        description: "base是正小数Float32,exponent是整数 Int32"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(2), Float32(2.2)), Float32(4.594793), Float32(0.001)),
            (pow(Float32(2), Float32(2)), Float32(4), Float32(0.001)),
            (pow(Float32(2), Float32(-2.2)), Float32(0.217637), Float32(0.001)),
            (pow(Float32(2), Float32(-2)), Float32(0.25), Float32(0.001)),
            (pow(Float32(6.000000), Float32(7.046014)), Float32(303993.625000), Float32(0.000001)),
            (pow(Float32(3.0), Float32(7.0)), Float32(2187.00000), Float32(0.000001)),
            (pow(Float32(10.000000), Float32(-6.0)), Float32(0.000000999999), Float32(0.000001)),
            (pow(Float32(12.000000), Float32(0.672057)), Float32(5.312161), Float32(0.000001)),
            (pow(Float32(1.000000), Float32(0.866678)), Float32(1.000), Float32(0.000001)),
            (pow(Float32(13.0), Float32(-0.317904)), Float32(0.442458450794220), Float32(0.000001))
        ],
        description: "base是正整数,exponent是整数，小数"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(4.000000), Int32(7)), Float32(16384.00000000), Float32(0.001)),
            (pow(Float32(10.0000), Int32(-5)), Float32(0.000009999999747), Float32(0.001)),
            (pow(Float32(3.000), Int32(-1)), Float32(0.333333343267441), Float32(0.001))
        ],
        description: "base是正整数,exponent是整数 Int32"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(-2.2), Float32(2)), Float32(4.84), Float32(0.001)),
            (pow(Float32(-2.2), Float32(-2)), Float32(0.206611), Float32(0.001)),
            (pow(Float32(-2.760993), Float32(-5.00)), Float32(-0.006232655141503), Float32(0.000001)),
            (pow(Float32(-13.747289), Float32(10.000)), Float32(241085186048.00000), Float32(0.000001))
        ],
        description: "base是负小数,exponent是整数"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(-2.2), Int32(2)), Float32(4.84), Float32(0.001)),
            (pow(Float32(-2.2), Int32(-2)), Float32(0.206611), Float32(0.000001)),
            (pow(Float32(-0.066219), Int32(-4)), Float32(52007.917969), Float32(0.000001)),
            (pow(Float32(-9.277688), Int32(3)), Float32(-798.581604003906250), Float32(0.001))
        ],
        description: "base是负小数,exponent是整数 Int32"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(-2), Float32(2)), Float32(4), Float32(0.001)),
            (pow(Float32(-2), Float32(-2)), Float32(0.25), Float32(0.001)),
            (pow(Float32(-11.000), Float32(8.000)), Float32(214358880.000000), Float32(0.000001)),
            (pow(Float32(-12.00), Float32(-3.0000)), Float32(-0.000578703708015), Float32(0.000001))
        ],
        description: "base是负整数,exponent是整数"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(-71.00), Int32(39)), -inf32, Float32(0.000001)),
            (pow(Float32(-72.000000), Int32(8)), Float32(722204119531520.0000), Float32(0.000001)),
            (pow(Float32(-49.000000), Int32(-3)), Float32(-0.000008499860087), Float32(0.000001)),
            (pow(Float32(-23.00), Int32(-1)), Float32(-0.043478261679411), Float32(0.000001))
        ],
        description: "base是负整数,exponent是整数 Int32"
    )
    CaseRunner<Float32>().runCases(
        [
            (pow(Float32(-0), Float32(2)), Float32(0), Float32(0.001)),
            (pow(Float32(0), Float32(2)), Float32(0), Float32(0.001))
        ],
        description: "特殊值：base=0，exponent是正整数"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            //x是特殊值：返回inf，结果为true
            pow(Float32(0), Float32(-2)).isInf(),
            pow(Float32(-0), Float32(-2)).isInf()
        ],
        description: "特殊值：base=0,exponent是负整数"
    )

    var rdm: Random = Random()
    var Base: Float32 = rdm.nextFloat32() * Float32.Max
    var Base_smaller: Float32 = rdm.nextFloat32()
    var Exponent: Float32 = rdm.nextFloat32() * Float32.Max
    var Exponent_smaller: Float32 = rdm.nextFloat32()
    var Exponent_100: Float32 = rdm.nextFloat32() * 100.0
    var Exponent_1000: Float32 = rdm.nextFloat32() * 1000.0

    var ExponentInt16: Int16 = rdm.nextInt16()
    var ExponentInt32: Int32 = rdm.nextInt32()

    //求奇偶数 flag 1:奇数 2：偶数
    func to_odd_Or_even(x: Int16, flag: Int32): Int16 {
        if (flag == 1) {
            return (x / 2 * 2) + 1
        } else {
            return x / 2 * 2
        }
    }

    //求正负数 flag 1:positive 2:Negative 
    func to_positive_Or_Negative(x: Int16, flag: Int32): Int16 {
        if (flag == 1) {
            return abs(x)
        } else {
            return abs(x) * (-1)
        }
    }

    func to_positive_Or_Negative(x: Float32, flag: Int32): Float32 {
        if (flag == 1) {
            return abs(x)
        } else {
            return abs(x) * (-1.0)
        }
    }

    func not_1(x: Float32): Float32 {
        if (abs(x) >= 0.999999999999999 && abs(x) <= 1.000000000000001) {
            return rdm.nextFloat32()
        } else {
            return x
        }
    }

    CaseRunner<Float32>().runCases(
        [
            (pow(Float32.Max, Float32(1.0)), Float32.Max, Float32(1e-8)), // Float32.Max ** Float32(1.0) = Float32.Max
            (pow(Float32.Min, Float32(1.0)), Float32.Min, Float32(1e-8)), // Float32.Min ** Float32(1.0) = Float32.Min
            (pow(Float32(1.1), Float32(0.0)), Float32(1.0), Float32(1e-8)), // Float32(1.1) ** Float32(0.0) = Float32(1.0)
            (pow(Float32(12.999999), Float32(2.777777)), Float32(1242.470495), Float32(0.001))
        ],
        description: "Float32：边界值验证"
    )

    CaseRunner<Float32>().runCases(
        [

            //当左操作类型为 Float32，右操作数类型为 Float32 时，同样存在一些特殊情况需要明确求幂表达式的值。
            (pow(Base, Float32(0.0)), Float32(1.0), Float32(1e-8)), // x ** 0.0 = 1.0  for any x
            (pow(Base, Float32(-0.0)), Float32(1.0), Float32(1e-8)), // x ** -0.0 = 1.0  for any x
            (pow(Float32(0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 2))), inf32, Float32(1e-8)), // 0.0 ** y = POSITIVE_INFINITY  for the value of y is equal to an odd integer < 0
            (pow(Float32(-0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 2))), -inf32, Float32(1e-8)), // -0.0 ** y = NEGATIVE_INFINITY  for the value of y is equal to an odd integer < 0
            (pow(Float32(0.0), -inf32), inf32, Float32(1e-8)), // 0.0 ** NEGATIVE_INFINITY = POSITIVE_INFINITY
            (pow(Float32(-0.0), -inf32), inf32, Float32(1e-8)), // -0.0 ** NEGATIVE_INFINITY = POSITIVE_INFINITY
            (pow(Float32(0.0), inf32), Float32(0.0), Float32(1e-8)), // 0.0 ** POSITIVE_INFINITY = 0.0
            (pow(Float32(-0.0), inf32), Float32(0.0), Float32(1e-8)), // -0.0 ** POSITIVE_INFINITY = 0.0
            (pow(Float32(0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 1))), Float32(0.0),
                Float32(1e-8)), // 0.0 ** y = 0.0 for finite y > 0.0 and its value is equal to an odd integer
            (pow(Float32(-0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 1))), Float32(-0.0),
                Float32(1e-8)), // -0.0 ** y = -0.0 for finite y > 0.0 and its value is equal to an odd integer
            (pow(Float32(-1.0), inf32), Float32(1.0), Float32(1e-8)), // -1.0 ** POSITIVE_INFINITY = 1.0
            (pow(Float32(-1.0), -inf32), Float32(1.0), Float32(1e-8)), // -1.0 ** NEGATIVE_INFINITY = 1.0
            (pow(Float32(1.0), Exponent), Float32(1.0), Float32(1e-8)), // 1.0 ** y = 1.0  for any y 

            (pow(Base_smaller, inf32), Float32(0.0), Float32(1e-8)), //x ** POSITIVE_INFINITY = 0.0 for 0.0 < x < 1.0
            (pow(to_positive_Or_Negative(Base_smaller, 2), inf32), Float32(0.0), Float32(1e-8)), //x ** POSITIVE_INFINITY = 0.0 for -1.0 < x < 0.0
            (pow(Base_smaller + 1.0, inf32), inf32, Float32(1e-8)), //x ** POSITIVE_INFINITY = POSITIVE_INFINITY for any x > 1.0
            (pow(to_positive_Or_Negative(Base_smaller, 2) - 1.0, inf32), inf32, Float32(1e-8)), //x ** POSITIVE_INFINITY = POSITIVE_INFINITY for any x < -1.0 

            (pow(Base_smaller, -inf32), inf32, Float32(1e-8)), //x ** NEGATIVE_INFINITY = POSITIVE_INFINITY for 0.0 < x < 1.0
            (pow(to_positive_Or_Negative(Base_smaller, 2), -inf32), inf32, Float32(1e-8)), //x ** NEGATIVE_INFINITY = POSITIVE_INFINITY for -1.0 < x < 0.0
            (pow(Base_smaller + 1.0, -inf32), Float32(0.0), Float32(1e-8)), //x ** NEGATIVE_INFINITY = 0.0 for any x > 1.0
            (pow(to_positive_Or_Negative(Base_smaller, 2) - 1.0, -inf32), Float32(0.0), Float32(1e-8)), //x ** NEGATIVE_INFINITY = 0.0 for any x < -1.0

            (pow(inf32, to_positive_Or_Negative(Exponent, 2)), Float32(0.0), Float32(1e-8)), //POSITIVE_INFINITY ** y = 0.0  for y < 0.0
            (pow(inf32, to_positive_Or_Negative(Exponent, 1)), inf32, Float32(1e-8)), //POSITIVE_INFINITY ** y = POSITIVE_INFINITY for y > 0.0 

            (pow(-inf32, Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 2))), Float32(0.0), Float32(1e-8)), //NEGATIVE_INFINITY ** y = -0.0 for finite y < 0.0 and its value is equal to an odd integer 
            (pow(-inf32, Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 1))), -inf32, Float32(1e-8)), //NEGATIVE_INFINITY ** y = NEGATIVE_INFINITY for finite y > 0.0 and its value is equal to an odd integer

            (pow(-inf32, Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 2))), Float32(0.0), Float32(1e-8)), //NEGATIVE_INFINITY ** y = 0.0 for finite y < 0.0 and its value is not equal to an odd integer
            (pow(-inf32, Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 1))), inf32, Float32(1e-8)), //NEGATIVE_INFINITY ** y = NEGATIVE_INFINITY for finite y > 0.0 and its value is equal to an odd integer
            (pow(Float32(0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 2))), inf32, Float32(1e-8)), //0.0 ** y = POSITIVE_INFINITY for finite y < 0.0 and its value is not equal to an odd integer 
            (pow(Float32(-0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 2))), inf32, Float32(1e-8)), //-0.0 ** y = POSITIVE_INFINITY for finite y < 0.0 and its value is not equal to an odd integer 
            (pow(Float32(0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 1))), Float32(0.0),
                Float32(1e-8)), //0.0 ** y = 0.0 for finite y > 0.0 and its value is not equal to an odd integer
            (pow(Float32(-0.0), Float32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 1))), Float32(0.0),
                Float32(1e-8)) //-0.0 ** y = 0.0 for finite y > 0.0 and its value is not equal to an odd integer

        ],
        description: "Float32：一些特殊情况需要明确求幂表达式的值"
    )

    CaseRunner<Float32>().runCases(
        [
            (pow(Float32.Max, Int32(1)), Float32.Max, Float32(1e-8)), // Float32.Max ** Int32(1) = Float32.Max
            (pow(Float32.Min, Int32(1)), Float32.Min, Float32(1e-8)), // Float32.Min ** Int32(1) = Float32.Min
            (pow(Float32(1.1), Int32(0)), Float32(1.0), Float32(1e-8)), // Float32(1.1) ** Int32(0) = Float32(1.0)
            (pow(Float32(12.999999), Float32(2.777777)), Float32(1242.470495), Float32(0.001))
        ],
        description: "Float32,Int32：边界值验证"
    )

    CaseRunner<Float32>().runCases(
        [

            //当左操作类型为 Float32，右操作数类型为 Int32 时，存在一些特殊情况需要明确求幂表达式的值。
            (pow(Base, Int32(0.0)), Float32(1.0), Float32(1e-8)), // x ** 0 = 1.0 for any x
            (pow(Float32(0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 2))), inf32, Float32(1e-8)), // 0.0 ** n = POSITIVE_INFINITY for odd n < 0
            (pow(Float32(-0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 2))), -inf32, Float32(1e-8)), // -0.0 ** n = NEGATIVE_INFINITY  for odd n < 0
            (pow(Float32(0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 2))), inf32, Float32(1e-8)), // 0.0 ** n = POSITIVE_INFINITY for even n < 0
            (pow(Float32(-0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 2))), inf32, Float32(1e-8)), // -0.0 ** n = POSITIVE_INFINITY  for even n < 0

            (pow(Float32(0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 1))), Float32(0.0),
                Float32(1e-8)), // 0.0 ** n = 0.0 for even n > 0
            (pow(Float32(-0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 1))), Float32(0.0),
                Float32(1e-8)), // -0.0 ** n = 0.0 for even n > 0
            (pow(Float32(0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 1))), Float32(0.0),
                Float32(1e-8)), // 0.0 ** n = 0.0 for odd n > 0
            (pow(Float32(-0.0), Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 1))), Float32(-0.0),
                Float32(1e-8)), // -0.0 ** n = -0.0 for odd n > 0

            (pow(inf32, Int32(to_positive_Or_Negative(ExponentInt16, 1))), inf32, Float32(1e-8)), // POSITIVE_INFINITY ** n = POSITIVE_INFINITY for n > 0
            (pow(-inf32, Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 1))), -inf32, Float32(1e-8)), // NEGATIVE_INFINITY ** n = NEGATIVE_INFINITY for odd n > 0
            (pow(-inf32, Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 1))), inf32, Float32(1e-8)), // NEGATIVE_INFINITY ** n = POSITIVE_INFINITY for even n > 0

            (pow(inf32, Int32(to_positive_Or_Negative(ExponentInt16, 2))), Float32(0.0), Float32(1e-8)), // POSITIVE_INFINITY ** n = 0.0 for n < 0
            (pow(-inf32, Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 1), 2))), Float32(-0.0), Float32(1e-8)), // NEGATIVE_INFINITY ** n = -0.0 for odd n < 0
            (pow(-inf32, Int32(to_positive_Or_Negative(to_odd_Or_even(ExponentInt16, 2), 2))), Float32(0.0), Float32(1e-8)) // NEGATIVE_INFINITY ** n = 0.0 for even n < 0

        ],
        description: "Float32, Int32：一些特殊情况需要明确求幂表达式的值"
    )

    CaseRunner<Bool>().runCasesTrue(
        [pow(to_positive_Or_Negative(Base, 2), not_1(Exponent_smaller)).isNaN() //x ** y = NaN for finite x < 0.0 and finite y whose value is not equal to an integer

            ],
        description: "Float32：一些特殊情况需要明确求幂表达式的值 x ** y = NaN"
    )

    CaseRunner<Bool>().runCasesTrue(
        [
            //一旦有操作数的值为 NaN，则求幂表达式的值等于 NaN
            pow(Base, nan32).isNaN(),
            pow(Base, -nan32).isNaN(),
            pow(nan32, Exponent).isNaN(),
            pow(-nan32, Exponent).isNaN(),
            pow(nan32, nan32).isNaN(),
            pow(nan32, -nan32).isNaN(),
            pow(-nan32, nan32).isNaN(),
            pow(-nan32, -nan32).isNaN()
        ],
        description: "Float32：一些特殊情况需要明确求幂表达式的值 任意操作数的值为 NaN"
    )

    CaseRunner<Bool>().runCasesTrue(
        [
            //当左操作数的值为 NaN 时，无论右操作数取何值，求幂表达式的值均等于 NaN
            pow(Float32.NaN, ExponentInt32).isNaN()],
        description: "Float32,Int64：当左操作数的值为 NaN 时，无论右操作数取何值，求幂表达式的值均等于 NaN"
    )

    return 0
}
