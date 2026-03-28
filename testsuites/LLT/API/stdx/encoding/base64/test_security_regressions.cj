/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import std.unittest.*
import stdx.encoding.base64.*

func matchResult<T>(x: Option<T>, default: T): T {
    return match (x) {
        case Some(v) => v
        case None => default
    }
}

@Test
public class Base64SecurityRegressionTest {
    @TestCase
    func rejectDoublePaddingPhantomBits(): Unit {
        let res = fromBase64String("AB==")
        let arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Expect(arr.size, 0)
    }

    @TestCase
    func rejectSinglePaddingPhantomBits(): Unit {
        let res = fromBase64String("AAF=")
        let arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Expect(arr.size, 0)
    }

    @TestCase
    func keepCanonicalPaddingAccepted(): Unit {
        let res = fromBase64String("AA==")
        let arr = matchResult<Array<UInt8>>(res, Array<UInt8>())
        @Expect(arr.size, 1)
        @Expect(arr[0], 0)
    }
}
