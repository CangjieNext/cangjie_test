/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=20gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color


import std.time.*

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_StringBuilder_Append { 
    var stringbuilder = StringBuilder()
    var stringbuilder_1k = StringBuilder(1024)
    var stringbuilder_1m = StringBuilder(1024 * 1024)

    var string_32 = String(Array<Rune>(32, repeat: r'A'))
    var string_1k = String(Array<Rune>(1024, repeat: r'A'))
    var string_1m = String(Array<Rune>(1024 * 1024, repeat: r'A'))

    var array_32 = Array<Rune>(32, repeat: r'A')
    var array_1k = Array<Rune>(1024, repeat: r'A')
    var array_1m = Array<Rune>(1024 * 1024, repeat: r'A')

    var sb_32 = StringBuilder(r'A', 32)
    var sb_1k = StringBuilder(r'A', 1024)
    var sb_1m = StringBuilder(r'A', 1024 * 1024)

    var bytes_32 = Array<UInt8>(32, repeat: 65)
    var bytes_1k = Array<UInt8>(1024, repeat: 65)
    var bytes_1m = Array<UInt8>(1024 * 1024, repeat: 65)

    // 当前此接口仅在每个@Bench运行前运行，而非每次调用前运行
    public override func beforeEach(): Unit{
        stringbuilder = StringBuilder()
        stringbuilder_1k = StringBuilder(1024)
        stringbuilder_1m = StringBuilder(1024 * 1024)
    }

    @Bench
    func BenchmarkStringBuilderAppend_Bool(): Unit {
        stringbuilder.append(true)
    }

    @Bench
    func BenchmarkStringBuilderAppend_Int64(): Unit {
        stringbuilder.append(-9223372036854775808)
    }

    @Bench
    func BenchmarkStringBuilderAppend_Int32(): Unit {
        stringbuilder.append(Int32(-2147483648))
    }

    @Bench
    func BenchmarkStringBuilderAppend_Int16(): Unit {
        stringbuilder.append(Int16(-32768))
    }

    @Bench
    func BenchmarkStringBuilderAppend_Int8(): Unit {
        stringbuilder.append(Int8(-128))
    }

    @Bench
    func BenchmarkStringBuilderAppend_Float64(): Unit {
        stringbuilder.append(2e3f64)
    }

    @Bench
    func BenchmarkStringBuilderAppend_Float32(): Unit {
        stringbuilder.append(2e3f32)
    }

    @Bench
    func BenchmarkStringBuilderAppend_Rune(): Unit {
        stringbuilder.append(r'A')
    }

    @Bench
    func BenchmarkStringBuilderAppend_String_N32(): Unit {
        stringbuilder.append(string_32)
    }

    @Bench
    func BenchmarkStringBuilderAppend_String_N1k(): Unit {
        stringbuilder_1k.append(string_1k)
    }

    @Bench
    func BenchmarkStringBuilderAppend_String_N1m(): Unit {
        stringbuilder_1m.append(string_1m)
    }

    @Bench
    func BenchmarkStringBuilderAppend_RuneArray_N32(): Unit {
        stringbuilder.append(array_32)
    }

    @Bench
    func BenchmarkStringBuilderAppend_RuneArray_N1k(): Unit {
        stringbuilder_1k.append(array_1k)
    }

    @Bench
    func BenchmarkStringBuilderAppend_RuneArray_N1m(): Unit {
        stringbuilder_1m.append(array_1m)
    }

    @Bench
    func BenchmarkStringBuilderAppend_StringBuilder_N32(): Unit {
        stringbuilder.append(sb_32)
    }

    @Bench
    func BenchmarkStringBuilderAppend_StringBuilder_N1k(): Unit {
        stringbuilder_1k.append(sb_1k)
    }

    @Bench
    func BenchmarkStringBuilderAppend_StringBuilder_N1m(): Unit {
        stringbuilder_1m.append(sb_1m)
    }

    @Bench
    func BenchmarkStringBuilderAppendFromUtf8_N32(): Unit {
        stringbuilder.appendFromUtf8(bytes_32)
    }

    @Bench
    func BenchmarkStringBuilderAppendFromUtf8_N1k(): Unit {
        stringbuilder_1k.appendFromUtf8(bytes_1k)
    }

    @Bench
    func BenchmarkStringBuilderAppendFromUtf8_N1m(): Unit {
        stringbuilder_1m.appendFromUtf8(bytes_1m)
    }
}