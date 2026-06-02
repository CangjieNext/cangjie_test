// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.io.*

@Test
public class TestStreams {
    /***
        public static func copy(inputStream:Option<InputStream>,outputStream:Option<OutputStream>,closeOutputStream:Bool,buffer:Array<UInt8>):Int64
        测试场景:inputStream,outputStream为Option.None,closeOutputStream为true,buffer为空
     ***/
    @TestCase
    func testStreamsCopy0101(): Unit {
        let inputStream = Option<InputStream>.None
        let outputStream = Option<OutputStream>.None
        var re_flag = 1
        try {
            copy(inputStream, outputStream, true, Array<UInt8>())
        } catch (e: NoneValueException) {
            re_flag = 0
        }
        @Assert(re_flag,0)
    }

    public func copy(inputStream: Option<InputStream>, outputStream: Option<OutputStream>, closeOutputStream: Bool,
        buffer: Array<UInt8>): Int64 {
        var output: Option<OutputStream> = outputStream
        var input: Option<InputStream> = inputStream
        try {
            var total = 0
            while (true) {
                let res = input.getOrThrow().read(buffer)
                if (res <= 0) { //原来-1 兼容其他流改<=0
                    break
                }
                if (res > 0) {
                    total += res
                    if (let Some(i) <- output) {
                        let bytesRes = buffer[..res]
                        i.write(bytesRes)
                    }
                }
            }
            return total
        } finally {
        }
    }
}
