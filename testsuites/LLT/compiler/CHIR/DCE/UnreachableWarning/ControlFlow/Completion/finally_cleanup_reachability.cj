// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ASSERT: scan-not warning: unreachable

// Finally bodies execute after direct and conditional returns.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class CleanupResource <: Resource {
    public func isClosed(): Bool { false }
    public func close() {}
}

func cleanupAfterReturn(): Int64 {
    try {
        return 1
    } finally {
        println("cleanup after return")
    }
}

func cleanupAfterUnsafeReturn(): Int64 {
    try {
        return 1
    } finally {
        unsafe { println("unsafe cleanup after return") }
    }
}

func cleanupAfterConditionalReturn(value: Bool): Int64 {
    if (value) {
        return 1
    }
    try {
        return 2
    } finally {
        println("cleanup after conditional return")
    }
}

func finalAllReturnIf(value: Bool): Int64 {
    if (value) {
        return 1
    } else {
        return 2
    }
}

func finalAllReturnMatch(value: Bool): Int64 {
    match (value) {
        case true => return 1
        case false => return 2
    }
}

func outerReturnAllReturnMatch(value: Bool): Int64 {
    return match (value) {
        case true => return 1
        case false => return 2
    }
}

func cleanupAfterConditionalReturnInTry(value: Bool): Int64 {
    try {
        if (value) {
            return 1
        }
        return 2
    } finally {
        println("cleanup after return in try")
    }
}

func cleanupInsideResource(): Unit {
    try (resource = CleanupResource()) {
        try {
            throw Exception()
        } finally {
            unsafe { println("cleanup inside resource") }
        }
    }
}

func allReturnTryFinally(value: Int64): Int64 {
    try {
        if (value == 0) {
            throw Exception()
        } else if (value == 1) {
            throw Exception()
        } else {
            return value
        }
    } finally {
        unsafe { println("cleanup after all-return try") }
    }
}

main() {
    cleanupAfterReturn()
    cleanupAfterUnsafeReturn()
    cleanupAfterConditionalReturn(true)
    cleanupAfterConditionalReturn(false)
    finalAllReturnIf(true)
    finalAllReturnMatch(false)
    outerReturnAllReturnMatch(false)
    cleanupAfterConditionalReturnInTry(true)
    cleanupAfterConditionalReturnInTry(false)
    cleanupInsideResource()
    allReturnTryFinally(2)
}
