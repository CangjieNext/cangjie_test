/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: ../../script/data/io/
// EXEC: cp io/*  ./
// EXEC: %compiler %cmp_opt -O2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.fs.File
import std.io.ByteBuffer
import std.io.InputStream
import std.io.OutputStream
import std.io.StringReader
import std.io.SeekPosition
import std.time.DateTime
import std.convert.*
import std.runtime.*

@Test
@Configure[minDuration: Duration.second * 3]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_UTF8_Read_Mode {

    @Strategy[name in ["galsworthy", "guanzhongluo", "tolstoy"]]
    func fileData(name: String): ByteBuffer {
        let arr = File.readFrom(name + ".txt")
        let inputStream = ByteBuffer()
        inputStream.write(arr)
        inputStream
    }

    @Bench[data in fileData]
    func BenchmarkReadUTF8_count_by_1(data: ByteBuffer): Unit {
        data.seek(Begin(0))
        let input = StringReader(data)
        var count = 0
        while (input.read().isSome()) {
            count++
        }
        blackBox(count)
    }

    @Bench[data in fileData]
    func BenchmarkReadUTF8_count_all(data: ByteBuffer): Unit {
        data.seek(Begin(0))
        let input = StringReader(data)
        let content = input.readToEnd()
        blackBox(content.size)
    }

    @Bench[data in fileData]
    func BenchmarkReadUTF8_count_lines(data: ByteBuffer): Unit {
        data.seek(Begin(0))
        let input = StringReader(data)
        var count = 0
        while (true) {
            match (input.readln()) {
                case None => break
                case Some(s) => count += s.size
            }
        }
        blackBox(count)
    }
}