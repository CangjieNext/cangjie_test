/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan operation 'Int8(-128) * Int8(-1)' would overflow
// (CJNATIVE) ASSERT: scan operation 'Int16(-32768) * Int16(-1)' would overflow
// (CJNATIVE) ASSERT: scan operation 'Int32(-2147483648) * Int32(-1)' would overflow
// ASSERT: scan operation 'Int64(-9223372036854775808) * Int64(-1)' would overflow
// (CJNATIVE) ASSERT: scan operation 'Int8(-1) * Int8(-128)' would overflow
// (CJNATIVE) ASSERT: scan operation 'Int16(-1) * Int16(-32768)' would overflow
// (CJNATIVE) ASSERT: scan operation 'Int32(-1) * Int32(-2147483648)' would overflow
// ASSERT: scan operation 'Int64(-1) * Int64(-9223372036854775808)' would overflow

var result = 0

func check<T>(action: () -> T) where T <: ToString {
    try {
        let res = action()
        result++
    } catch (e: OverflowException) {
    }
}

main() {
    let MIN_INT64: Int64 = -0x8000_0000_0000_0000
    let MIN_INT32: Int32 = -0x8000_0000
    let MIN_INT16: Int16 = -0x8000
    let MIN_INT8: Int8 = -0x80
    check<Int8>({=> MIN_INT8 * Int8(-1)})
    check<Int16>({=> MIN_INT16 * Int16(-1)})
    check<Int32>({=> MIN_INT32 * Int32(-1)})
    check<Int64>({=> MIN_INT64 * Int64(-1)})

    check<Int8>({=> Int8(-1) * MIN_INT8})
    check<Int16>({=> Int16(-1) * MIN_INT16})
    check<Int32>({=> Int32(-1) * MIN_INT32})
    check<Int64>({=> Int64(-1) * MIN_INT64})
    return result
}
