/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: manydecl.cj
// EXEC: %compiler %cmp_opt manydecl.cj --mock=on %compile_lib_opt --output manydecl.%middle
// EXEC: %compiler %cmp_opt manydecl.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*
import std.unittest.mock.*
import manydecl.*

@Test
public class StressMocks {
    @TestCase
    func stressTopLevel() {
        @On(f0(_)).returns(10000)
        @Assert(f0(0) == 10000)

        @On(f1(_)).returns(10001)
        @Assert(f1(0) == 10001)

        @On(f2(_)).returns(10002)
        @Assert(f2(0) == 10002)

        @On(f3(_)).returns(10003)
        @Assert(f3(0) == 10003)

        @On(f4(_)).returns(10004)
        @Assert(f4(0) == 10004)

        @On(f5(_)).returns(10005)
        @Assert(f5(0) == 10005)

        @On(f6(_)).returns(10006)
        @Assert(f6(0) == 10006)

        @On(f7(_)).returns(10007)
        @Assert(f7(0) == 10007)

        @On(f8(_)).returns(10008)
        @Assert(f8(0) == 10008)

        @On(f9(_)).returns(10009)
        @Assert(f9(0) == 10009)

        @On(f10(_)).returns(10010)
        @Assert(f10(0) == 10010)

        @On(f11(_)).returns(10011)
        @Assert(f11(0) == 10011)

        @On(f12(_)).returns(10012)
        @Assert(f12(0) == 10012)

        @On(f13(_)).returns(10013)
        @Assert(f13(0) == 10013)

        @On(f14(_)).returns(10014)
        @Assert(f14(0) == 10014)

        @On(f15(_)).returns(10015)
        @Assert(f15(0) == 10015)

        @On(f16(_)).returns(10016)
        @Assert(f16(0) == 10016)

        @On(f17(_)).returns(10017)
        @Assert(f17(0) == 10017)

        @On(f18(_)).returns(10018)
        @Assert(f18(0) == 10018)

        @On(f19(_)).returns(10019)
        @Assert(f19(0) == 10019)

        @On(f20(_)).returns(10020)
        @Assert(f20(0) == 10020)

        @On(f21(_)).returns(10021)
        @Assert(f21(0) == 10021)

        @On(f22(_)).returns(10022)
        @Assert(f22(0) == 10022)

        @On(f23(_)).returns(10023)
        @Assert(f23(0) == 10023)

        @On(f24(_)).returns(10024)
        @Assert(f24(0) == 10024)

        @On(f25(_)).returns(10025)
        @Assert(f25(0) == 10025)

        @On(f26(_)).returns(10026)
        @Assert(f26(0) == 10026)

        @On(f27(_)).returns(10027)
        @Assert(f27(0) == 10027)

        @On(f28(_)).returns(10028)
        @Assert(f28(0) == 10028)

        @On(f29(_)).returns(10029)
        @Assert(f29(0) == 10029)

        @On(f30(_)).returns(10030)
        @Assert(f30(0) == 10030)

        @On(f31(_)).returns(10031)
        @Assert(f31(0) == 10031)

        @On(f32(_)).returns(10032)
        @Assert(f32(0) == 10032)

        @On(f33(_)).returns(10033)
        @Assert(f33(0) == 10033)

        @On(f34(_)).returns(10034)
        @Assert(f34(0) == 10034)

        @On(f35(_)).returns(10035)
        @Assert(f35(0) == 10035)

        @On(f36(_)).returns(10036)
        @Assert(f36(0) == 10036)

        @On(f37(_)).returns(10037)
        @Assert(f37(0) == 10037)

        @On(f38(_)).returns(10038)
        @Assert(f38(0) == 10038)

        @On(f39(_)).returns(10039)
        @Assert(f39(0) == 10039)

        @On(f40(_)).returns(10040)
        @Assert(f40(0) == 10040)

        @On(f41(_)).returns(10041)
        @Assert(f41(0) == 10041)

        @On(f42(_)).returns(10042)
        @Assert(f42(0) == 10042)

        @On(f43(_)).returns(10043)
        @Assert(f43(0) == 10043)

        @On(f44(_)).returns(10044)
        @Assert(f44(0) == 10044)

        @On(f45(_)).returns(10045)
        @Assert(f45(0) == 10045)

        @On(f46(_)).returns(10046)
        @Assert(f46(0) == 10046)

        @On(f47(_)).returns(10047)
        @Assert(f47(0) == 10047)

        @On(f48(_)).returns(10048)
        @Assert(f48(0) == 10048)

        @On(f49(_)).returns(10049)
        @Assert(f49(0) == 10049)

        @On(f50(_)).returns(10050)
        @Assert(f50(0) == 10050)

        @On(f51(_)).returns(10051)
        @Assert(f51(0) == 10051)

        @On(f52(_)).returns(10052)
        @Assert(f52(0) == 10052)

        @On(f53(_)).returns(10053)
        @Assert(f53(0) == 10053)

        @On(f54(_)).returns(10054)
        @Assert(f54(0) == 10054)

        @On(f55(_)).returns(10055)
        @Assert(f55(0) == 10055)

        @On(f56(_)).returns(10056)
        @Assert(f56(0) == 10056)

        @On(f57(_)).returns(10057)
        @Assert(f57(0) == 10057)

        @On(f58(_)).returns(10058)
        @Assert(f58(0) == 10058)

        @On(f59(_)).returns(10059)
        @Assert(f59(0) == 10059)

        @On(f60(_)).returns(10060)
        @Assert(f60(0) == 10060)

        @On(f61(_)).returns(10061)
        @Assert(f61(0) == 10061)

        @On(f62(_)).returns(10062)
        @Assert(f62(0) == 10062)

        @On(f63(_)).returns(10063)
        @Assert(f63(0) == 10063)

        @On(f64(_)).returns(10064)
        @Assert(f64(0) == 10064)

        @On(f65(_)).returns(10065)
        @Assert(f65(0) == 10065)

        @On(f66(_)).returns(10066)
        @Assert(f66(0) == 10066)

        @On(f67(_)).returns(10067)
        @Assert(f67(0) == 10067)

        @On(f68(_)).returns(10068)
        @Assert(f68(0) == 10068)

        @On(f69(_)).returns(10069)
        @Assert(f69(0) == 10069)

        @On(f70(_)).returns(10070)
        @Assert(f70(0) == 10070)

        @On(f71(_)).returns(10071)
        @Assert(f71(0) == 10071)

        @On(f72(_)).returns(10072)
        @Assert(f72(0) == 10072)

        @On(f73(_)).returns(10073)
        @Assert(f73(0) == 10073)

        @On(f74(_)).returns(10074)
        @Assert(f74(0) == 10074)

        @On(f75(_)).returns(10075)
        @Assert(f75(0) == 10075)

        @On(f76(_)).returns(10076)
        @Assert(f76(0) == 10076)

        @On(f77(_)).returns(10077)
        @Assert(f77(0) == 10077)

        @On(f78(_)).returns(10078)
        @Assert(f78(0) == 10078)

        @On(f79(_)).returns(10079)
        @Assert(f79(0) == 10079)

        @On(f80(_)).returns(10080)
        @Assert(f80(0) == 10080)

        @On(f81(_)).returns(10081)
        @Assert(f81(0) == 10081)

        @On(f82(_)).returns(10082)
        @Assert(f82(0) == 10082)

        @On(f83(_)).returns(10083)
        @Assert(f83(0) == 10083)

        @On(f84(_)).returns(10084)
        @Assert(f84(0) == 10084)

        @On(f85(_)).returns(10085)
        @Assert(f85(0) == 10085)

        @On(f86(_)).returns(10086)
        @Assert(f86(0) == 10086)

        @On(f87(_)).returns(10087)
        @Assert(f87(0) == 10087)

        @On(f88(_)).returns(10088)
        @Assert(f88(0) == 10088)

        @On(f89(_)).returns(10089)
        @Assert(f89(0) == 10089)

        @On(f90(_)).returns(10090)
        @Assert(f90(0) == 10090)

        @On(f91(_)).returns(10091)
        @Assert(f91(0) == 10091)

        @On(f92(_)).returns(10092)
        @Assert(f92(0) == 10092)

        @On(f93(_)).returns(10093)
        @Assert(f93(0) == 10093)

        @On(f94(_)).returns(10094)
        @Assert(f94(0) == 10094)

        @On(f95(_)).returns(10095)
        @Assert(f95(0) == 10095)

        @On(f96(_)).returns(10096)
        @Assert(f96(0) == 10096)

        @On(f97(_)).returns(10097)
        @Assert(f97(0) == 10097)

        @On(f98(_)).returns(10098)
        @Assert(f98(0) == 10098)

        @On(f99(_)).returns(10099)
        @Assert(f99(0) == 10099)
    }
}
