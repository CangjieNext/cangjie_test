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

main() {
    //x:Int8=-128(min)，返回值为none，none无法判断，让其指向-32768
    var m80: Int8 = -128
    var x80: Option<Int8> = checkedAbs(Int8(m80))
    var y80 = match (x80) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(-127)(min+)
    var m81: Int8 = -127
    var x81: Option<Int8> = checkedAbs(m81)
    var y81 = match (x81) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(-19)(正常负数)
    var m82: Int8 = -19
    var x82: Option<Int8> = checkedAbs(m82)
    var y82 = match (x82) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(-0)(特殊值)
    var m83: Int8 = -0
    var x83: Option<Int8> = checkedAbs(m83)
    var y83 = match (x83) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(0)(特殊值)
    var m84: Int8 = 0
    var x84: Option<Int8> = checkedAbs(m84)
    var y84 = match (x84) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(54)(正常正数)
    var m85: Int8 = 54
    var x85: Option<Int8> = checkedAbs(m85)
    var y85 = match (x85) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(126)(max-)
    var m86: Int8 = 126
    var x86: Option<Int8> = checkedAbs(m86)
    var y86 = match (x86) {
        case Some(a) => a
        case None => Int8(-128)
    }
    //x:Int8=(127)(max)
    var m87: Int8 = 127
    var x87: Option<Int8> = checkedAbs(m87)
    var y87 = match (x87) {
        case Some(a) => a
        case None => Int8(-128)
    }

    CaseRunner<Int8>().runCases(
        [
            (y80, m80),
            (y81, -m81),
            (y82, -m82),
            (y83, -m83),
            (y84, m84),
            (y85, m85),
            (y86, m86),
            (y87, m87)
        ],
        description: "checkedAbs()入参是Int8"
    )
    //X:Int16=-32768（min），返回值为none，none无法判断，让其指向-32768
    var m160: Int16 = -32768
    var x160: Option<Int16> = checkedAbs(Int16(m160))
    var y160 = match (x160) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(-32767)(min+)
    var m161: Int16 = -32767
    var x161: Option<Int16> = checkedAbs(m161)
    var y161 = match (x161) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(-956)(正常负数)
    var m162: Int16 = -956
    var x162: Option<Int16> = checkedAbs(m162)
    var y162 = match (x162) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(-0)(特殊值)
    var m163: Int16 = -0
    var x163: Option<Int16> = checkedAbs(m163)
    var y163 = match (x163) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(0)(特殊值)
    var m164: Int16 = 0
    var x164: Option<Int16> = checkedAbs(m164)
    var y164 = match (x164) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(745)(正常正数)
    var m165: Int16 = 745
    var x165: Option<Int16> = checkedAbs(m165)
    var y165 = match (x165) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(32766)(max-)
    var m166: Int16 = 32766
    var x166: Option<Int16> = checkedAbs(m166)
    var y166 = match (x166) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    //x:Int16=(32767)(max)
    var m167: Int16 = 32767
    var x167: Option<Int16> = checkedAbs(m167)
    var y167 = match (x167) {
        case Some(a) => a
        case None => Int16(-32768)
    }
    CaseRunner<Int16>().runCases(
        [
            (y160, m160),
            (y161, -m161),
            (y162, -m162),
            (y163, -m163),
            (y164, m164),
            (y165, m165),
            (y166, m166),
            (y167, m167)
        ],
        description: "checkedAbs()函数入参是Int16"
    )
    //x:Int32=(-2147483647)(min)，返回值为none，none无法判断，让其指向-2147483647
    var m320: Int32 = -2147483648
    var x320: Option<Int32> = checkedAbs(m320)
    var y320 = match (x320) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(-2147483647)(min+)
    var m321: Int32 = -2147483647
    var x321: Option<Int32> = checkedAbs(m321)
    var y321 = match (x321) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(-68)(正常负数)
    var m322: Int32 = -68
    var x322: Option<Int32> = checkedAbs(m322)
    var y322 = match (x322) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(-0)(特殊值)
    var m323: Int32 = -0
    var x323: Option<Int32> = checkedAbs(m323)
    var y323 = match (x323) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(0)(特殊值)
    var m324: Int32 = 0
    var x324: Option<Int32> = checkedAbs(m324)
    var y324 = match (x324) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(23)(正常正数)
    var m325: Int32 = 23
    var x325: Option<Int32> = checkedAbs(m325)
    var y325 = match (x325) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(2147483646)(max-)
    var m326: Int32 = 2147483646
    var x326: Option<Int32> = checkedAbs(m326)
    var y326 = match (x326) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    //x:Int32=(2147483647)(max)
    var m327: Int32 = 2147483647
    var x327: Option<Int32> = checkedAbs(m327)
    var y327 = match (x327) {
        case Some(a) => a
        case None => Int32(-2147483648)
    }
    CaseRunner<Int32>().runCases(
        [
            (y320, m320),
            (y321, -m321),
            (y322, -m322),
            (y323, -m323),
            (y324, m324),
            (y325, m325),
            (y326, m326),
            (y327, m327)
        ],
        description: "checkedAbs()函数入参是Int32"
    )
    var m640: Int64 = -9223372036854775808
    var x640: Option<Int64> = checkedAbs(m640)
    var y640 = match (x640) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(-9223372036854775807)(min+)
    var m641: Int64 = -9223372036854775807
    var x641: Option<Int64> = checkedAbs(m641)
    var y641 = match (x641) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(-956)(正常负数)
    var m642: Int64 = -956
    var x642: Option<Int64> = checkedAbs(m642)
    var y642 = match (x642) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(-0)(特殊值)
    var m643: Int64 = -0
    var x643: Option<Int64> = checkedAbs(m643)
    var y643 = match (x643) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(0)(特殊值)
    var m644: Int64 = 0
    var x644: Option<Int64> = checkedAbs(m644)
    var y644 = match (x644) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(745)(正常正数)
    var m645: Int64 = 745
    var x645: Option<Int64> = checkedAbs(m645)
    var y645 = match (x645) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(9223372036854775806)(max-)
    var m646: Int64 = 9223372036854775806
    var x646: Option<Int64> = checkedAbs(m646)
    var y646 = match (x646) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    //x:Int64=(9223372036854775807)(max)
    var m647: Int64 = 9223372036854775807
    var x647: Option<Int64> = checkedAbs(m647)
    var y647 = match (x647) {
        case Some(a) => a
        case None => Int64(-9223372036854775808)
    }
    CaseRunner<Int64>().runCases(
        [
            (y640, m640),
            (y641, -m641),
            (y642, -m642),
            (y643, -m643),
            (y644, m644),
            (y645, m645),
            (y646, m646),
            (y647, m647)
        ],
        description: "checkedAbs()函数入参是Int64"
    )
    return 0
}
