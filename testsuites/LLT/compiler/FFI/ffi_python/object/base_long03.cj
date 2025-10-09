// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not false
internal import ffi_python.*

func getPyLong(str: String): PyLong {
    return match (Python.Eval(str)) {
        case val: PyLong => return val
        case _ => throw Exception()
    }
}

main(): Int64 {
    Python.load()

    // Int
    print("${getPyLong("0").toCjObj() == 0}\n")
    print("${getPyLong("-1").toCjObj() == -1}\n")
    print("${getPyLong("1").toCjObj() == 1}\n")
    print("${getPyLong("2147483647").toCjObj() == 2147483647}\n")
    print("${getPyLong("-2147483648").toCjObj() == -2147483648}\n")
    print("${getPyLong("9223372036854775807").toCjObj() == 9223372036854775807}\n")
    print("${getPyLong("-9223372036854775808").toCjObj() == -9223372036854775808}\n")

    // UInt
    print("${getPyLong("0").toUInt64() == 0}\n")
    print("${getPyLong("1").toUInt64() == 1}\n")
    print("${getPyLong("-1").toUInt64() == 18446744073709551615}\n")
    print("${getPyLong("2147483647").toUInt64() == 2147483647}\n")
    print("${getPyLong("-2147483648").toUInt64() == 18446744073709551615}\n")
    print("${getPyLong("9223372036854775807").toUInt64() == 9223372036854775807}\n")
    print("${getPyLong("-9223372036854775808").toUInt64() == 18446744073709551615}\n")
    print("${getPyLong("18446744073709551615").toUInt64() == 18446744073709551615}\n")

    Python.unload()
    return 0
}
