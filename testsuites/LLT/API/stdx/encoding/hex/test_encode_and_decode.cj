/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import stdx.encoding.hex.*
import std.unittest.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

@Test
class encodeAndDecodeTest {
    @TestCase
    func inputNullStringReturnNullArray(): Unit {
        var str = ""
        var result = 1
        var arr = fromHexString(str)
        match (arr) {
            case Some(x) => result = 0
            case None => result = 1
        }
        @Expect(result, 0)
    }

    @TestCase[str in [ "1234QW", "12345", "   \t\n" ] 
]
    func inputInvalidStringReturnNone(str: String): Unit {
        var res = fromHexString(str)
        var arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Expect(arr.size, 0)
    }

    @TestCase
    func inputStringReturnArray(): Unit {
        var str = "10\t2\n0  30"
        var res = fromHexString(str)
        var arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        var tmp: Array<UInt8> = [16, 32, 48]
        @Assert(arr.size, tmp.size)
        for (i in 0..arr.size) {
            @Assert(arr[i], tmp[i])
        }
    }

    @TestCase
    func inputNullArrayReturnNullString(): Unit {
        var arr = Array<UInt8>()
        var str = toHexString(arr)
        @Expect(str, "")
    }

    @TestCase
    func inputArrayReturnString(): Unit {
        var arr: Array<UInt8> = [16, 32, 48]
        var str = toHexString(arr)
        @Expect(str, "102030")
    }

    @TestCase
    func encodeAndDecode(): Unit {
        var input: Array<UInt8> = [126, 149, 21, 37, 48, 214, 94, 4, 90, 102, 75, 174, 24, 197, 216, 31, 53, 193, 17,
            159, 246, 48, 6, 64, 150, 233, 139, 188, 150, 155, 201, 69, 236, 2, 5, 130, 229, 198, 54, 218, 237, 71, 202,
            98, 232, 124, 29, 145, 180, 166, 132, 158, 5, 66, 49, 248, 158, 48, 223, 202, 21, 178, 1, 222, 243, 201, 77,
            147, 163, 43, 104, 53, 204, 8, 17, 136, 36, 214, 84, 114, 9, 36, 8, 233, 76, 12, 73, 87, 237, 130, 124, 42,
            63, 94, 190, 233, 133, 96, 117, 140, 28, 213, 249, 251, 48, 223, 204, 152, 49, 17, 137, 50, 116, 192, 9, 115,
            73, 107, 215, 123, 210, 204, 212, 252, 176, 114, 144, 10, 98, 59, 69, 98, 214, 119, 204, 162, 217, 254, 248,
            111, 21, 84, 4, 143, 34, 64, 44, 10, 190, 225, 187, 232, 170, 22, 110, 164, 90, 33, 232, 243, 118, 216, 179,
            241, 31, 145, 155, 80, 100, 94, 199, 65, 158]
        var str = toHexString(input)
        var res = fromHexString(str)
        var arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Assert(input.size, arr.size)
        for (i in 0..input.size) {
            @Assert(input[i], arr[i])
        }
    }
}
