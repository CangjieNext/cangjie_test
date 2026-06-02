/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// ( not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f

// ASSERT: scan result1 = 1\nresult2 = 1\nresult3 = 1\nresult4 = 1\nresult5 = 1\nresult6 = 1\nresult7 = 1\nresult8 = 1\nresult9 = 1.000002\nresult10 = 1.000000002\n
// ASSERT: scan-not Exception

main(): Int64 {
    var result1: Int8 = 0
    var result2: Int16 = 0
    var result3: Int32 = 0
    var result4: Int64 = 0
    var result5: UInt8 = 0
    var result6: UInt16 = 0
    var result7: UInt32 = 0
    var result8: UInt64 = 0
    var result9: Float32 = 0.0
    var result10: Float64 = 0.0

    let fut1: Future<Int8> = spawn {
        var a: Int8 = 0
        a = a + 1
        return a
    }

    let fut2: Future<Int16> = spawn {
        var a: Int16 = 0
        a = a + 1
        return a
    }

    let fut3: Future<Int32> = spawn {
        var a: Int32 = 0
        a = a + 1
        return a
    }

    let fut4: Future<Int64> = spawn {
        var a: Int64 = 0
        a = a + 1
        return a
    }

    let fut5: Future<UInt8> = spawn {
        var a: UInt8 = 0
        a = a + 1
        return a
    }

    let fut6: Future<UInt16> = spawn {
        var a: UInt16 = 0
        a = a + 1
        return a
    }

    let fut7: Future<UInt32> = spawn {
        var a: UInt32 = 0
        a = a + 1
        return a
    }

    let fut8: Future<UInt64> = spawn {
        var a: UInt64 = 0
        a = a + 1
        return a
    }

    let fut9: Future<Float32> = spawn {
        var a: Float32 = 0.0
        a = a + 1.000002
        return a
    }

    let fut10: Future<Float64> = spawn {
        var a: Float64 = 0.0
        a = a + 1.000000002
        return a
    }

    result1 = fut1.get()
    result2 = fut2.get()
    result3 = fut3.get()
    result4 = fut4.get()
    result5 = fut5.get()
    result6 = fut6.get()
    result7 = fut7.get()
    result8 = fut8.get()
    result9 = fut9.get()
    result10 = fut10.get()

    if (result1 != 1 || result2 != 1 || result3 != 1 || result4 != 1 || result5 != 1 || result6 != 1 || result7 != 1 ||
        result8 != 1 || result9 <= 1.000001 || result9 >= 1.000003 || result10 <= 1.0000000019 || result10 >=
        1.0000000021) {
        return 1
    }

    print("result1 = ${result1}\n")
    print("result2 = ${result2}\n")
    print("result3 = ${result3}\n")
    print("result4 = ${result4}\n")
    print("result5 = ${result5}\n")
    print("result6 = ${result6}\n")
    print("result7 = ${result7}\n")
    print("result8 = ${result8}\n")
    print("result9 = 1.000002\n")
    print("result10 = 1.000000002\n")
    return 0
}
