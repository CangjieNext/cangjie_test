// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime exception nested coverage pass

func testSimpleTryCatch(): Bool {
    var hitCatch: Bool = false
    try {
        throw Exception("test exception")
    } catch (e: Exception) {
        hitCatch = true
    }
    hitCatch
}

func testCatchNoThrow(): Bool {
    var result: Int64 = 0
    try {
        result = 42
    } catch (e: Exception) {
        result = -1
    }
    result == 42
}

func testNestedTryCatch(): Bool {
    var outer: Int64 = 0
    var inner: Int64 = 0
    try {
        try {
            throw Exception("inner")
        } catch (e: Exception) {
            inner = 1
        }
        outer = 2
    } catch (e: Exception) {
        outer = -1
    }
    inner == 1 && outer == 2
}

func testCatchAndRethrow(): Bool {
    var caught: Bool = false
    try {
        try {
            throw Exception("original")
        } catch (e: Exception) {
            caught = true
            throw e
        }
    } catch (e: Exception) {
        return caught
    }
    false
}

class CustomError <: Exception {
    let code: Int64
    init(code: Int64, msg: String) {
        super(msg)
        this.code = code
    }
}

func testCustomException(): Bool {
    var errorCode: Int64 = 0
    try {
        throw CustomError(404, "not found")
    } catch (e: CustomError) {
        errorCode = e.code
    } catch (e: Exception) {
        errorCode = -1
    }
    errorCode == 404
}

main(): Int64 {
    if (!testSimpleTryCatch()) {
        return 1
    }
    if (!testCatchNoThrow()) {
        return 2
    }
    if (!testNestedTryCatch()) {
        return 3
    }
    if (!testCatchAndRethrow()) {
        return 4
    }
    if (!testCustomException()) {
        return 5
    }
    println("runtime exception nested coverage pass")
    0
}
