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

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Url_Parse { 
    var url = URL.parse("")
    var str = "http://www.cangjie.com"

    public override func beforeAll(): Unit {
        for (i in 0..100) {
            str += "/abc"
        }
        str += "?nums"
        for (i in 0..100) {
            str += "&num${i}=1"
        }
    }

    @Bench
    func BenchmarkParse_N0(): Unit {
        url = URL.parse("http://www.cangjie.com")
    }

    @Bench
    func BenchmarkParse_N1(): Unit {
        url = URL.parse("http://1.2.3.4:8888/a")
    }

    @Bench
    func BenchmarkParse_Path_N1(): Unit {
        url = URL.parse("http://www.cangjie.com/a")
    }

    @Bench
    func BenchmarkParse_Path_N10(): Unit {
        url = URL.parse("http://www.cangjie.com/a/b/c/d/e/f/g/h/i/j")
    }

    @Bench
    func BenchmarkParse_Protocol_Https(): Unit {
        url = URL.parse("https://www.cangjie.com")
    }

    @Bench
    func BenchmarkParse_Protocol_File(): Unit {
        url = URL.parse("file:///home/cangjie/rabbits")
    }

    @Bench
    func BenchmarkParse_Protocol_Ftp(): Unit {
        url = URL.parse("ftp://webmaster@www.cangjie.com/")
    }

    @Bench
    func BenchmarkParse_Query_N1(): Unit {
        url = URL.parse("http://www.cangjie.com/search?q=apple")
    }

    @Bench
    func BenchmarkParse_Query_N5(): Unit {
        url = URL.parse("http://www.cangjie.com/products?color=red&size=L&brand=nike&type=sneakers&price=50-100")
    }

    @Bench
    func BenchmarkParse_HostName_N5(): Unit {
        url = URL.parse("http://www.cangjie.a.b.c.d.com")
    }

    @Bench
    func BenchmarkParse_Chinese_N1(): Unit {
        url = URL.parse("http://www.仓颉.一.二.三.四.com")
    }

    @Bench
    func BenchmarkParse_Chinese_N2(): Unit {
        url = URL.parse("http://www.cangjie.com/仓颉/一/二/三/四/五/六/七/八/九")
    }

    @Bench
    func BenchmarkParse_Chinese_N3(): Unit {
        url = URL.parse("http://www.cangjie.com/产品?颜色=red&大小=L&品牌=nike&类型=sneakers&价格=50-100e")
    }

    @Bench
    func BenchmarkParse_Character_N1(): Unit {
        url = URL.parse("http://www.%e4%b8%96%e7%95%8c.com")
    }

    @Bench
    func BenchmarkParse_Long(): Unit {
        url = URL.parse(str)
    }
}