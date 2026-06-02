/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.encoding.json.*

@Test
public class JsonNumberTest {
    @TestCase
    func jsonnumberIntBinary(): Unit {
        let jsonStr = ##"0b11"##
        @Expect(JsonValue.fromStr(jsonStr).toString(), "3")
    }

    @TestCase
    func jsonnumberIntBinary2(): Unit {
        let jsonStr = ##"-0B11"##
        @Expect(JsonValue.fromStr(jsonStr).toString(), "-3")
    }

    @TestCase
    func jsonnumberIntBinaryError(): Unit {
        let jsonStr = ##"0b12"##
        try {
            JsonValue.fromStr(jsonStr)
            @Expect(false)
        } catch (e: JsonException) {
            @Expect(e.message, ##"The json data is Non-standard, please check:
Parse Error: [Line]: 1, [Pos]: 4, [Error]: Unexpected character: '2'."##)
        }
    }

    @TestCase
    func jsonnumberIntOctal(): Unit {
        let jsonStr = ##"0o17"##
        @Expect(JsonValue.fromStr(jsonStr).toString(), "15")
    }

    @TestCase
    func jsonnumberIntOctal2(): Unit {
        let jsonStr = ##"-0O17"##
        @Expect(JsonValue.fromStr(jsonStr).toString(), "-15")
    }

    @TestCase
    func jsonnumberIntOctalError(): Unit {
        let jsonStr = ##"0o18"##
        try {
            JsonValue.fromStr(jsonStr)
            @Expect(false)
        } catch (e: JsonException) {
            @Expect(e.message, ##"The json data is Non-standard, please check:
Parse Error: [Line]: 1, [Pos]: 4, [Error]: Unexpected character: '8'."##)
        }
    }

    @TestCase
    func jsonnumberIntHex(): Unit {
        let jsonStr = ##"0x1f"##
        @Expect(JsonValue.fromStr(jsonStr).toString(), "31")
    }

    @TestCase
    func jsonnumberIntHex2(): Unit {
        let jsonStr = ##"-0X1f"##
        @Expect(JsonValue.fromStr(jsonStr).toString(), "-31")
    }

    @TestCase
    func jsonnumberIntHexError(): Unit {
        let jsonStr = ##"0x1g"##
        try {
            JsonValue.fromStr(jsonStr)
            @Expect(false)
        } catch (e: JsonException) {
            @Expect(e.message, ##"The json data is Non-standard, please check:
Parse Error: [Line]: 1, [Pos]: 4, [Error]: Unexpected character: 'g'."##)
        }
    }
}
