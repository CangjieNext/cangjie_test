/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.math.*
import std.collection.*

struct DecimalContext {
    public let precision: Int64

    public let roundingMode: RoundingMode

    public init(precision: Int64, roundingMode: RoundingMode) {
        if (precision < 0) {
            throw IllegalArgumentException("Precision cannot be negative number.")
        }

        this.precision = precision
        this.roundingMode = roundingMode
    }
}

/*
 * Test description: Test the arithmetic operation func for decimal
 * Test class:
 * public struct Decimal <: Comparable<Decimal> & Hashable & ToString
 */
struct TestCaseStruct {
    let d1: Decimal
    let d2: Decimal
    let ctx: DecimalContext
    let result: String

    public init(d1: Decimal, d2: Decimal, result: String, ctx!: DecimalContext = DecimalContext(0, RoundingMode.HalfEven)) {
        this.d1 = d1
        this.d2 = d2
        this.ctx = ctx
        this.result = result
    }
}

struct TC {
    let n1: String
    let n2: String
    let ctx: DecimalContext
    let result: String
    public init(n1: String, n2: String, ctx: DecimalContext, result: String) {
        this.n1 = n1
        this.n2 = n2
        this.ctx = ctx
        this.result = result
    }
}

struct ShiftTC {
    let d: Decimal
    let n: Int32
    let result: String
    public init(d: Decimal, n: Int32, result: String) {
        this.d = d
        this.n = n
        this.result = result
    }
}

struct QR {
    let n1: String
    let n2: String
    let ctx: DecimalContext
    let qu: String
    let re: String
    public init(n1: String, n2: String, ctx: DecimalContext, qu: String, re: String) {
        this.n1 = n1
        this.n2 = n2
        this.ctx = ctx
        this.qu = qu
        this.re = re
    }
}

func printRoundingMode(roundingMode: RoundingMode): String {
    match (roundingMode) {
        case RoundingMode.Up => "Up"
        case RoundingMode.Down => "Down"
        case RoundingMode.Ceiling => "Ceiling"
        case RoundingMode.Floor => "Floor"
        case RoundingMode.HalfEven => "HalfEven"
        case RoundingMode.HalfUp => "HalfUp"
    }
}

func printStructInfo(tcStruct: TestCaseStruct, oper: String, execRes: String, verifyResult: Bool, isDetail: Bool): Unit {
    if (isDetail) {
        println(
            "result: ${verifyResult}, ${tcStruct.d1} ${oper} ${tcStruct.d2} = ${execRes}, expectResult: ${tcStruct.result}, ctx: (${tcStruct.ctx.precision}, ${printRoundingMode(tcStruct.ctx.roundingMode)})")
    } else {
        println("result: ${verifyResult}, execResult: ${execRes}, expectResult: ${tcStruct.result}")
    }
}

let isDebug: Bool = false
let isDetail: Bool = false
let addTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("1"), Decimal.parse("2"), "3"),
    TestCaseStruct(Decimal.parse("13234"), Decimal.parse("-244564"), "-231330"),
    TestCaseStruct(Decimal.parse("-13155665816816198441651816816816"), Decimal.parse("-6816811661168131316581"),
        "-13155665823633010102819948133397"),
    TestCaseStruct(Decimal.parse("16531531"), Decimal.parse("16313515131.1611658161341"), "16330046662.1611658161341"),
    TestCaseStruct(Decimal.parse("-2621613"), Decimal.parse("2616116531313131131311.18651113813251"),
        "2616116531313128509698.18651113813251"),
    TestCaseStruct(Decimal.parse("-681631368355"), Decimal.parse("-463068163811680351546.16816835116813651"),
        "-463068164493311719901.16816835116813651"),
    TestCaseStruct(Decimal.parse("13513131313105.161653131"), Decimal.parse("4161313135.113035053101681"),
        "13517292626240.274688184101681"),
    TestCaseStruct(Decimal.parse("163031131.16513131386513825156113"),
        Decimal.parse("-168131313115.186052131521130301341351351351351135805"),
        "-167968281984.020920817655992049780221351351351135805"),
    TestCaseStruct(Decimal.parse("-138613188585.1313151321431353"),
        Decimal.parse("-1685158147434713431.174343156813844175341545812"),
        "-1685158286047902016.305658288956979475341545812"),
    TestCaseStruct(Decimal.parse("-121355.00000"), Decimal.parse("-35135150.000000000"), "-35256505.000000000"),
    TestCaseStruct(Decimal.parse("-121355.00000"), Decimal.parse("121355.000000000"), "0.000000000")
]
let addTCWithCtxArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("168131354168135"), Decimal.parse("13113816813186111316134441041131"),
        "13113816813186111485000000000000", ctx: DecimalContext(20, Up)),
    TestCaseStruct(Decimal.parse("-36138341354165313515"), Decimal.parse("1531385121861313476126813113434"),
        "1531385121825175134700000000000", ctx: DecimalContext(20, Down)),
    TestCaseStruct(Decimal.parse("-4631438135138513515135"), Decimal.parse("-16513841115441685346134135"),
        "-16518472553576800000000000", ctx: DecimalContext(15, Ceiling)),
    TestCaseStruct(Decimal.parse("681631368355.46134683515"), Decimal.parse("15211865135134135453431"),
        "15211865135815700000000", ctx: DecimalContext(15, Floor)),
    TestCaseStruct(Decimal.parse("-315341815.15613218"), Decimal.parse("168351168"), "-146990647.156",
        ctx: DecimalContext(12, HalfUp)),
    TestCaseStruct(Decimal.parse("-453818643.18115441"), Decimal.parse("-156138411313156"), "-156138865131799.2",
        ctx: DecimalContext(16, HalfEven)),
    TestCaseStruct(Decimal.parse("16813453.161514"), Decimal.parse("152318486.156315101"), "169131939.3",
        ctx: DecimalContext(10, HalfEven)),
    TestCaseStruct(Decimal.parse("-1515131.15616165815"), Decimal.parse("16163245.16816835116813651"),
        "14648114.0120067", ctx: DecimalContext(15, HalfUp)),
    TestCaseStruct(Decimal.parse("-65136813154.1613454651"), Decimal.parse("-4643844210.1616357418642"), "-69780657300",
        ctx: DecimalContext(9, Down))
]
let subTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("161314435465"), Decimal.parse("64813138454151"), "-64651824018686"),
    TestCaseStruct(Decimal.parse("224466889977553322.11"), Decimal.parse("224466889977552222.00"), "1100.11"),
    TestCaseStruct(Decimal.parse("-16513135165116531"), Decimal.parse("155131681351351351"), "-171644816516467882"),
    TestCaseStruct(Decimal.parse("-012168168154"), Decimal.parse("-54515134185341663516"), "54515134173173495362"),
    TestCaseStruct(Decimal.parse("168134183154731831"), Decimal.parse("94681683543415.168513218154"),
        "168039501471188415.831486781846"),
    TestCaseStruct(Decimal.parse("-161864131.168510446"), Decimal.parse("1811724124138"), "-1811885988269.168510446"),
    TestCaseStruct(Decimal.parse("-1651143443516158"), Decimal.parse("-4611684.1681545468"),
        "-1651143438904473.8318454532"),
    TestCaseStruct(Decimal.parse("46168118616.1618961783546646118"), Decimal.parse("1515413434514186.1865118743481"),
        "-1515367266395570.0246156959934353882"),
    TestCaseStruct(Decimal.parse("-116843435.1568165156454"), Decimal.parse("16513486.153248132518"),
        "-133356921.3100646481634"),
    TestCaseStruct(Decimal.parse("-13518614685158.16851543546851"), Decimal.parse("-416154856.16581631851158"),
        "-13518198530302.00269911695693")
]
let subTCWithCtxArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("15616513243434"), Decimal.parse("1568186413416311351351"), "-1568186397799798108000",
        ctx: DecimalContext(20, Up)),
    TestCaseStruct(Decimal.parse("-1651861631618861"), Decimal.parse("8616168131681418683165344"),
        "-8616168133333280314700000", ctx: DecimalContext(20, Down)),
    TestCaseStruct(Decimal.parse("-168161316816186131315321"), Decimal.parse("-16168343434874751351681681"),
        "16000182118058600000000000", ctx: DecimalContext(15, Ceiling)),
    TestCaseStruct(Decimal.parse("168168438441386.1891684416413"), Decimal.parse("4861658684431634344"),
        "-4861490515993200000", ctx: DecimalContext(15, Floor)),
    TestCaseStruct(Decimal.parse("-16511531.4151815615"), Decimal.parse("181684161643431"), "-181684178155000",
        ctx: DecimalContext(12, HalfUp)),
    TestCaseStruct(Decimal.parse("-16851613131.1811544115611"), Decimal.parse("-15116843430054161"), "15116826578441030",
        ctx: DecimalContext(16, HalfEven)),
    TestCaseStruct(Decimal.parse("1681161265134115.161165165514"), Decimal.parse("484835468343.68464468"),
        "1680676430000000", ctx: DecimalContext(10, HalfEven)),
    TestCaseStruct(Decimal.parse("-1134345516.15616165815"), Decimal.parse("4848432.16816835116813651"),
        "-1139193948.32433", ctx: DecimalContext(15, HalfUp)),
    TestCaseStruct(Decimal.parse("-8444843411.6846844"), Decimal.parse("-4864643418.47867434741"), "-3580199993.20601",
        ctx: DecimalContext(15, Down))
]
let mulTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("161314435465"), Decimal.parse("64813138454151"), "10455294840446251350865215"),
    TestCaseStruct(Decimal.parse("-16513135165116531"), Decimal.parse("155131681351351351"),
        "-2561710422546652364427912239283381"),
    TestCaseStruct(Decimal.parse("-012168168154"), Decimal.parse("-54515134185341663516"),
        "663349319705111163604774869464"),
    TestCaseStruct(Decimal.parse("168134183154731831"), Decimal.parse("94681683543415.168513218154"),
        "15919227522286924644612456040781.974670859974"),
    TestCaseStruct(Decimal.parse("-161864131.168510446"), Decimal.parse("1811724124138"),
        "-293253151270627934265.453745548"),
    TestCaseStruct(Decimal.parse("-1651143443516158"), Decimal.parse("-4611684.1681545468"),
        "7614552077815647036322.9469671944"),
    TestCaseStruct(Decimal.parse("46168118616.1618961783546646118"), Decimal.parse("1515413434514186.1865118743481"),
        "69963787197176235837264077.74341362040360578787355926456758"),
    TestCaseStruct(Decimal.parse("-116843435.1568165156454"), Decimal.parse("16513486.153248132518"),
        "-1929492448560035.5704492513650372794971172"),
    TestCaseStruct(Decimal.parse("-13518614685158.16851543546851"), Decimal.parse("-416154856.16581631851158"),
        "5625837149863089874234.2908265578359640596231603458"),
    TestCaseStruct(Decimal.parse("0.000"), Decimal.parse("-416154856.16581631851158"), "0.00000000000000000"),
    TestCaseStruct(Decimal.parse("-0.00000000000000000000000"), Decimal.parse("-416154856.16581631851158"),
        "0.0000000000000000000000000000000000000")
]
let mulTCWithCtxArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("168131354168135"), Decimal.parse("13113816813186111316134441041131"),
        "2204843779113837539500000000000000000000000000", ctx: DecimalContext(20, Up)),
    TestCaseStruct(Decimal.parse("-36138341354165313515"), Decimal.parse("1531385121861313476126813113434"),
        "-55341718278514192904000000000000000000000000000000", ctx: DecimalContext(20, Down)),
    TestCaseStruct(Decimal.parse("-4631438135138513515135"), Decimal.parse("-16513841115441685346134135"),
        "76482833499675000000000000000000000000000000000", ctx: DecimalContext(15, Ceiling)),
    TestCaseStruct(Decimal.parse("681631368355.46134683515"), Decimal.parse("15211865135134135453431"),
        "10368884447300200000000000000000000", ctx: DecimalContext(15, Floor)),
    TestCaseStruct(Decimal.parse("-315341815.15613218"), Decimal.parse("168351168"), "-53088162900800000",
        ctx: DecimalContext(12, HalfUp)),
    TestCaseStruct(Decimal.parse("-453818643.18115441"), Decimal.parse("-15613841.1313156"), "7085852197059747",
        ctx: DecimalContext(16, HalfEven)),
    TestCaseStruct(Decimal.parse("16813453.161514"), Decimal.parse("152318486.156315101"), "2560999733000000",
        ctx: DecimalContext(10, HalfEven)),
    TestCaseStruct(Decimal.parse("-1515131.15616165815"), Decimal.parse("16163245.16816835116813651"),
        "-24489436338971.2", ctx: DecimalContext(15, HalfUp)),
    TestCaseStruct(Decimal.parse("-65136813154.1613454651"), Decimal.parse("-4643844210.1616357418642"),
        "302485212000000000000", ctx: DecimalContext(9, Down))
]
let divTCWithCtxArray: Array<TC> = [
    TC("12345.6789", "987.654321", DecimalContext(34, HalfEven), "12.49999988609375000142382812498220"),
    TC("6", "3", DecimalContext(5, HalfEven), "2"),
    TC("676", "-338", DecimalContext(3, Down), "-2"),
    TC("-999", "-999", DecimalContext(2, Down), "1"),
    TC("-3.1415926", "3.1415", DecimalContext(8, Ceiling), "-1.0000294"),
    TC("2.2", "1.1", DecimalContext(1, HalfEven), "2"),
    TC("-2.2", "-1.1", DecimalContext(1, HalfEven), "2"),
    TC("1023427554493", "43432632", DecimalContext(21, HalfEven), "23563.5628642767953828"),
    TC("1", "434324545566634", DecimalContext(2, HalfEven), "0.0000000000000023"),
    TC("1", "3", DecimalContext(16, HalfEven), "0.3333333333333333"),
    TC("2", "3", DecimalContext(16, HalfEven), "0.6666666666666667"),
    TC("10000", "3", DecimalContext(20, HalfEven), "3333.3333333333333333"),
    TC("10234274355545544493", "-3", DecimalContext(35, HalfEven), "-3411424785181848164.3333333333333333"),
    TC("-4612301402398.4753343454", "23.5", DecimalContext(28, HalfEven), "-196268144782.9138440146978723"),
    TC("1240000000000", "3", DecimalContext(27, HalfEven), "413333333333.333333333333333"),
    TC("1240000000000", "0.3", DecimalContext(28, HalfEven), "4133333333333.333333333333333"),
    TC("1240000000000", "6", DecimalContext(27, HalfEven), "206666666666.666666666666667"),
    TC("1240000000000", "0.6", DecimalContext(28, HalfEven), "2066666666666.666666666666667"),
    TC("100000000000", "10", DecimalContext(11, HalfEven), "10000000000"),
    TC("18446744073709551616", "123456789", DecimalContext(33, HalfEven), "149418628356.756886136087663838398"),
    TC("18446744073709551616", "10", DecimalContext(34, HalfEven), "1844674407370955161.6"),
    TC("18446744073709551616", "1357924680.00236", DecimalContext(35, HalfEven), "13584511972.841889999189125231601147"),
    TC("18446744073709551616957", "-2222222222222", DecimalContext(17, HalfEven), "-8301034833.1701283"),
    TC("18446744073709551616957", "-77777777777777777777.2339", DecimalContext(10, HalfEven), "-237.1724238"),
    TC("18446744073709551616957", "-777777777777777777772339.65464000000000000000000000", DecimalContext(10, HalfEven),
        "-0.02371724238"),
    TC("10", "-777777777777777777772339.65464000000000000000000000", DecimalContext(108, HalfEven),
        "-0.0000000000000000000000128571428571428571429470383620734693877557305787346277318681793217707552467595614282795936946441001606056025"),
    TC("-18446744073709551616957.070809010", "-0.0000000000673921", DecimalContext(25, HalfEven),
        "273722648110231787063425400000000"),
    TC("-18446744073709551616957.07080901", "18446744073709551616957.070809", DecimalContext(3, HalfEven), "-1.00"),
    TC("5555", "9999", DecimalContext(2, Up), "0.56"),
    TC("5555", "9999", DecimalContext(2, Down), "0.55"),
    TC("5555", "9999", DecimalContext(2, Ceiling), "0.56"),
    TC("5555", "9999", DecimalContext(2, Floor), "0.55"),
    TC("5555", "9999", DecimalContext(2, HalfUp), "0.56"),
    TC("56789", "-98765", DecimalContext(2, Up), "-0.58"),
    TC("56789", "-98765", DecimalContext(2, Down), "-0.57"),
    TC("56789", "-98765", DecimalContext(2, Ceiling), "-0.57"),
    TC("56789", "-98765", DecimalContext(2, Floor), "-0.58"),
    TC("56789", "-98765", DecimalContext(2, HalfUp), "-0.57"),
    TC("0", "111", DecimalContext(2, HalfUp), "0"),
    TC("0.00000000000000", "111", DecimalContext(2, HalfUp), "0.00000000000000"),
    TC("000000.000", "111", DecimalContext(2, HalfUp), "0.000"),
    TC("-000.000", "111", DecimalContext(2, HalfUp), "0.000"),
    TC("1", "003.00", DecimalContext(0, Up), "0.3333333333333333333333333333333334"),
    TC("0001.000", "-006.00", DecimalContext(0, Down), "-0.1666666666666666666666666666666666"),
    TC("18446744073709551616957", "184467440737095516169596576462354657732542564", DecimalContext(0, Up),
        "0.00000000000000000000009999999999999999999998559287088906"),
    TC("-000.000", "111", DecimalContext(0, HalfUp), "0.000"),
    TC("666.00", "00111", DecimalContext(0, HalfUp), "6.00"),
    TC("0.0036", "0.04", DecimalContext(0, HalfUp), "0.09"),
    TC("-000.0000000000000000000000028", "14", DecimalContext(0, HalfUp), "-0.0000000000000000000000002"),
    TC("36000000000000000000000000000000", "1800", DecimalContext(0, HalfUp), "20000000000000000000000000000"),
    TC("-169", "-951", DecimalContext(0, HalfUp), "0.1777076761303890641430073606729758"),
    TC("-169.96111111", "-951.159", DecimalContext(0, Down), "0.1786884328592800993314472133470849"),
    TC("20002000200020002000", "-10.10101010", DecimalContext(0, Ceiling), "-1980198020000000000"),
    TC("1073741824.1073741824", "205891132094649", DecimalContext(0, Ceiling),
        "0.000005215095051368072768102820866378238"),
    TC("1073741824.1073741824", "205891132094649", DecimalContext(0, Floor), "0.000005215095051368072768102820866378237")
]
let divAndRemTCWithCtxArray: Array<QR> = [
    QR("10", "1", DecimalContext(1, HalfEven), "10", "0"),
    QR("1", "10", DecimalContext(0, HalfEven), "0", "1"),
    QR("1", "4", DecimalContext(2, HalfEven), "0", "1"),
    QR("1", "8", DecimalContext(2, HalfEven), "0", "1"),
    QR("10", "3", DecimalContext(1, HalfEven), "3", "1"),
    QR("100", "3", DecimalContext(2, HalfEven), "33", "1"),
    QR("1000", "3", DecimalContext(3, HalfEven), "333", "1"),
    QR("1000", "10", DecimalContext(3, HalfEven), "100", "0"),
    QR("1e-3", "2e-5", DecimalContext(0, HalfEven), "50", "0.0000"),
    QR("1e-3", "2e-3", DecimalContext(1, HalfEven), "0", "0.001"),
    QR("4e-3", "0.8", DecimalContext(4, HalfEven), "0", "0.004"),
    QR("-4", "-3", DecimalContext(0, HalfEven), "1", "-1"),
    QR("-4", "3", DecimalContext(0, HalfEven), "-1", "-1"),
    QR("0.00", "3", DecimalContext(0, Up), "0", "0.00"),
    QR("0", "0.11111", DecimalContext(0, Up), "0", "0"),
    QR("224466889977553322.11", "222222", DecimalContext(0, Up), "1010102015001", "1100.11")
]
let negTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("161314435465"), Decimal.parse("0"), "-161314435465"),
    TestCaseStruct(Decimal.parse("-16513135165116531"), Decimal.parse("0"), "16513135165116531"),
    TestCaseStruct(Decimal.parse("-012168168154"), Decimal.parse("0"), "12168168154"),
    TestCaseStruct(Decimal.parse("15919227522286924644612456040781.974670859974"), Decimal.parse("0"),
        "-15919227522286924644612456040781.974670859974"),
    TestCaseStruct(Decimal.parse("-161864131.168510446"), Decimal.parse("0"), "161864131.168510446"),
    TestCaseStruct(Decimal.parse("-151E10"), Decimal.parse("0"), "1510000000000"),
    TestCaseStruct(Decimal.parse("6456151.151541851E-3"), Decimal.parse("0"), "-6456.151151541851"),
    TestCaseStruct(Decimal(Int64.Min), Decimal.parse("0"), "9223372036854775808"),
    TestCaseStruct(Decimal.parse("-0.000"), Decimal.parse("0"), "0.000"),
    TestCaseStruct(Decimal.parse("0.000"), Decimal.parse("0"), "0.000")
]
let negTCWithCtxArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("168131354168135"), Decimal.parse("0"), "-168131354168135", ctx: DecimalContext(20, Up)),
    TestCaseStruct(Decimal.parse("-6515156164168516"), Decimal.parse("0"), "6515156164168516",
        ctx: DecimalContext(30, Down)),
    TestCaseStruct(Decimal.parse("-36138341354165313515231"), Decimal.parse("0"), "36138341354165313515000",
        ctx: DecimalContext(20, Down)),
    TestCaseStruct(Decimal.parse("4631438135138513515135"), Decimal.parse("0"), "-4631438135138510000000",
        ctx: DecimalContext(15, Ceiling)),
    TestCaseStruct(Decimal.parse("681631368355.46134683515"), Decimal.parse("0"), "-681631368355.462",
        ctx: DecimalContext(15, Floor)),
    TestCaseStruct(Decimal.parse("-315341815.15613218"), Decimal.parse("0"), "315341815.156",
        ctx: DecimalContext(12, HalfUp)),
    TestCaseStruct(Decimal.parse("-453818643.18115441"), Decimal.parse("0"), "453818643.1811544",
        ctx: DecimalContext(16, HalfEven)),
    TestCaseStruct(Decimal.parse("16813453.165514"), Decimal.parse("0"), "-16813453.17",
        ctx: DecimalContext(10, HalfEven)),
    TestCaseStruct(Decimal.parse("-0.000"), Decimal.parse("0"), "0.000", ctx: DecimalContext(2, HalfEven)),
    TestCaseStruct(Decimal.parse("0.000"), Decimal.parse("0"), "0.000", ctx: DecimalContext(3, HalfEven))
]
let absTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("161314435465"), Decimal.parse("0"), "161314435465"),
    TestCaseStruct(Decimal.parse("-16513135165116531"), Decimal.parse("0"), "16513135165116531"),
    TestCaseStruct(Decimal.parse("-012168168154"), Decimal.parse("0"), "12168168154"),
    TestCaseStruct(Decimal(Int64.Min), Decimal.parse("0"), "9223372036854775808"),
    TestCaseStruct(Decimal.parse("-161864131.168510446E-5"), Decimal.parse("0"), "1618.64131168510446"),
    TestCaseStruct(Decimal.parse("-1564.168510446E-5"), Decimal.parse("0"), "0.01564168510446"),
    TestCaseStruct(Decimal.parse("46168118616.1618961783546646118"), Decimal.parse("0"),
        "46168118616.1618961783546646118"),
    TestCaseStruct(Decimal.parse("-1929492448560035.5704492513650372794971172"), Decimal.parse("0"),
        "1929492448560035.5704492513650372794971172"),
    TestCaseStruct(Decimal.parse("-1929492448560035.570E5"), Decimal.parse("0"), "192949244856003557000"),
    TestCaseStruct(Decimal.parse("-0.000"), Decimal.parse("0"), "0.000"),
    TestCaseStruct(Decimal.parse("-0.00000000000000000000000"), Decimal.parse("0"), "0.00000000000000000000000")
]
let shiftPointTCArray: Array<ShiftTC> = [
    ShiftTC(Decimal.parse("64813138454151"), 5, "648131384.54151"),
    ShiftTC(Decimal.parse("651561"), 10, "0.0000651561"),
    ShiftTC(Decimal.parse("-155131681351351351"), 20, "-0.00155131681351351351"),
    ShiftTC(Decimal.parse("-1561561"), 5, "-15.61561"),
    ShiftTC(Decimal.parse("-54515134185341663516"), -5, "-5451513418534166351600000"),
    ShiftTC(Decimal.parse("-1561561.115"), -5, "-156156111500"),
    ShiftTC(Decimal.parse("94681683543415.168513218154"), -10, "946816835434151685132181.54"),
    ShiftTC(Decimal.parse("0.00"), 5, "0.0000000"),
    ShiftTC(Decimal.parse("-0.00"), -5, "0"),
    ShiftTC(Decimal.parse("1"), 5, "0.00001"),
    ShiftTC(Decimal.parse("0.1"), -5, "10000"),
    ShiftTC(Decimal.parse("1234.56789"), -10, "12345678900000"),
    ShiftTC(Decimal.parse("-45801681351.515616810"), 15, "-0.000045801681351515616810"),
    ShiftTC(Decimal.parse("-00000000002561616816.168518616"), 13, "-0.0002561616816168518616"),
    ShiftTC(Decimal.parse("-00000000002561616816.168518616"), -13, "-25616168161685186160000"),
    ShiftTC(Decimal.parse("+16518616.561861685"), -9, "16518616561861685"),
    ShiftTC(Decimal.parse("+16518616.561861685"), 5, "165.18616561861685"),
    ShiftTC(Decimal.parse("00.000000"), 2, "0.00000000"),
    ShiftTC(Decimal.parse("-00.000000"), -2, "0.0000"),
    ShiftTC(Decimal.parse("-15165E12"), 13, "-1516.5"),
    ShiftTC(Decimal.parse("+16810631E-20"), 21, "0.00000000000000000000000000000000016810631"),
    ShiftTC(Decimal.parse("+18616161.51125312e-10"), -20, "186161615112531200"),
    ShiftTC(Decimal.parse("0E5"), 5, "0"),
    ShiftTC(Decimal.parse("0E-5"), 2, "0.0000000"),
    ShiftTC(Decimal.parse("0.e0"), 0, "0"),
    ShiftTC(Decimal.parse(".0e-0"), 0, "0.0"),
    ShiftTC(Decimal.parse("156161.1681E0"), 0, "156161.1681"),
    ShiftTC(Decimal.parse("24515668.89118"), 0, "24515668.89118"),
    ShiftTC(Decimal.parse("148611161"), 0, "148611161"),
    ShiftTC(Decimal.parse("115613615631E-10"), 2, "0.115613615631"),
    ShiftTC(Decimal.parse("-.2168168464e+5"), 5, "-0.2168168464")
]
let roundTCArray: Array<TestCaseStruct> = [
    TestCaseStruct(Decimal.parse("168131354168135"), Decimal.parse("0"), "168131354168135", ctx: DecimalContext(20, Up)),
    TestCaseStruct(Decimal.parse("-6515156164168516"), Decimal.parse("0"), "-6515156164168516",
        ctx: DecimalContext(30, Down)),
    TestCaseStruct(Decimal.parse("-36138341354165313515231"), Decimal.parse("0"), "-36138341354165313515000",
        ctx: DecimalContext(20, Down)),
    TestCaseStruct(Decimal.parse("4631438135138513515135"), Decimal.parse("0"), "4631438135138520000000",
        ctx: DecimalContext(15, Ceiling)),
    TestCaseStruct(Decimal.parse("681631368355.46134683515"), Decimal.parse("0"), "681631368355.461",
        ctx: DecimalContext(15, Floor)),
    TestCaseStruct(Decimal.parse("-315341815.15613218"), Decimal.parse("0"), "-315341815.156",
        ctx: DecimalContext(12, HalfUp)),
    TestCaseStruct(Decimal.parse("-453818643.18115441"), Decimal.parse("0"), "-453818643.1811544",
        ctx: DecimalContext(16, HalfEven)),
    TestCaseStruct(Decimal.parse("16813453.165514"), Decimal.parse("0"), "16813453.17", ctx: DecimalContext(10, HalfEven)),
    TestCaseStruct(Decimal.parse("-0.000"), Decimal.parse("0"), "0.000", ctx: DecimalContext(2, HalfEven)),
    TestCaseStruct(Decimal.parse("0.000"), Decimal.parse("0"), "0.000", ctx: DecimalContext(3, HalfEven))
]

@Test
class DecimalArthmeticOperationTest {
    @TestCase
    func addTest(): Unit {
        for (tc in addTCArray) {
            let addResult = tc.d1 + tc.d2
            let checkResult = addResult.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "+", addResult.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "+", addResult.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func subTest(): Unit {
        for (tc in subTCArray) {
            let subResult = tc.d1 - tc.d2
            let checkResult = subResult.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "-", subResult.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "-", subResult.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func mulTest(): Unit {
        for (tc in mulTCArray) {
            let mulResult = tc.d1 * tc.d2
            let checkResult = mulResult.toString() == tc.result
            @Expect(checkResult, true)
            if (!checkResult) {
                printStructInfo(tc, "*", mulResult.toString(), checkResult, isDetail)
            }

            if (checkResult && isDebug) {
                printStructInfo(tc, "*", mulResult.toString(), checkResult, isDetail)
            }
        }
    }

    @TestCase
    func divTest() {
        for (expectation in divTCWithCtxArray) {
            let n1 = Decimal(expectation.n1)
            let n2 = Decimal(expectation.n2)
            let reality = n1.divWithPrecision(n2, expectation.ctx.precision, roundingMode: expectation.ctx.roundingMode)
            @Expect(reality.toString(), expectation.result)
        }
    }

    @TestCase
    func divAndRemTest() {
        for (expectation in divAndRemTCWithCtxArray) {
            try {
                let n1 = Decimal(expectation.n1)
                let n2 = Decimal(expectation.n2)
                let (qu, re) = n1.divAndMod(n2)
                @Expect(qu.toString(), expectation.qu)
                @Expect(re.toString(), expectation.re)
            } catch (e: Exception) {
                println(e)
                println("qu is ${expectation.qu},re is ${expectation.re}")
            }
        }
    }

    @TestCase
    func divExceptionTest() {
        try {
            Decimal.parse("1") / Decimal.parse("0")
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }

        try {
            Decimal.parse("1") / Decimal.parse("0")
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }

        try {
            let decimal1 = Decimal(UInt32.Min)
            let decimal2 = Decimal(0.193298f32)
            decimal2.divAndMod(decimal1)
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Divided by zero!")
        }
    }

    @TestCase
    func negTest(): Unit {
        for (tc in negTCArray) {
            let negResult = -tc.d1
            @Expect(negResult.toString(), tc.result)
        }
    }

    @TestCase
    func absTest(): Unit {
        for (tc in absTCArray) {
            let absResult = abs(tc.d1)
            @Expect(absResult.toString(), tc.result)
        }
    }

    @TestCase
    func shiftPointTest(): Unit {
        for (tc in shiftPointTCArray) {
            let shiftPointResult = tc.d.shiftPoint(tc.n)
            @Expect(shiftPointResult.toString(), tc.result)
        }
    }

    @TestCase
    func roundTest(): Unit {
        for (tc in roundTCArray) {
            let roundResult = tc.d1.roundWithPrecision(tc.ctx.precision, roundingMode: tc.ctx.roundingMode)
            @Expect(roundResult.toString(), tc.result)
        }
    }
}
