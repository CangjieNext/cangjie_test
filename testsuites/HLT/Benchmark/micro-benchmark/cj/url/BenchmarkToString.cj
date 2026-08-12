/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color


import std.time.*
import stdx.encoding.url.*

var str = ""

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Url_ToString { 
    var url_1 = URL.parse("http://www.cangjie.com")
    var url_2 = URL.parse("http://1.2.3.4:8888/a")
    var url_3 = URL.parse("http://www.cangjie.com/a")
    var url_4 = URL.parse("http://www.cangjie.com/a/b/c/d/e/f/g/h/i/j")
    var url_5 = URL.parse("https://www.cangjie.com")
    var url_6 = URL.parse("file:///home/cangjie/rabbits")
    var url_7 = URL.parse("ftp://webmaster@www.cangjie.com/")
    var url_8 = URL.parse("http://www.cangjie.com/search?q=apple")
    var url_9 = URL.parse("http://www.cangjie.com/products?color=red&size=L&brand=nike&type=sneakers&price=50-100")
    var url_10 = URL.parse("http://www.cangjie.a.b.c.d.com")
    var url_11 = URL.parse("http://www.仓颉.一.二.三.四.com")
    var url_12 = URL.parse("http://www.cangjie.com/仓颉/一/二/三/四/五/六/七/八/九")
    var url_13 = URL.parse("http://www.cangjie.com/产品?颜色=red&大小=L&品牌=nike&类型=sneakers&价格=50-100e")
    var url_14 = URL.parse("http://www.%e4%b8%96%e7%95%8c.com")
    var url_15 = URL.parse("")

    var long = "http://www.cangjie.com"

    public override func beforeAll(): Unit {
        for (i in 0..100) {
            long += "/abc"
        }
        long += "?nums"
        for (i in 0..100) {
            long += "&num${i}=1"
        }
        url_15 = URL.parse(long)
    }

    @Bench
    func BenchmarkToString_N0(): Unit {
        str = url_1.toString()
    }

    @Bench
    func BenchmarkToString_N1(): Unit {
        str = url_2.toString()
    }

    @Bench
    func BenchmarkToString_Path_N1(): Unit {
        str = url_3.toString()
    }

    @Bench
    func BenchmarkToString_Path_N10(): Unit {
        str = url_4.toString()
    }

    @Bench
    func BenchmarkToString_Protocol_Https(): Unit {
        str = url_5.toString()
    }

    @Bench
    func BenchmarkToString_Protocol_File(): Unit {
        str = url_6.toString()
    }

    @Bench
    func BenchmarkToString_Protocol_Ftp(): Unit {
        str = url_7.toString()
    }

    @Bench
    func BenchmarkToString_Query_N1(): Unit {
        str = url_8.toString()
    }

    @Bench
    func BenchmarkToString_Query_N5(): Unit {
        str = url_9.toString()
    }

    @Bench
    func BenchmarkToString_HostName_N5(): Unit {
        str = url_10.toString()
    }

    @Bench
    func BenchmarkToString_Chinese_N1(): Unit {
        str = url_11.toString()
    }

    @Bench
    func BenchmarkToString_Chinese_N2(): Unit {
        str = url_12.toString()
    }

    @Bench
    func BenchmarkToString_Chinese_N3(): Unit {
        str = url_13.toString()
    }

    @Bench
    func BenchmarkToString_Character_N1(): Unit {
        str = url_14.toString()
    }

    @Bench
    func BenchmarkToString_Long(): Unit {
        str = url_15.toString()
    }
}