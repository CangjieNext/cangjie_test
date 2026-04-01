/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and not Windows) EXEC: %run %run_opt %output %run_args

// ASSERT: scan Empty path detected
// ASSERT: scan Path traversal detected
// ASSERT: scan Tilde expansion detected
// ASSERT: scan Null byte injection detected
// ASSERT: scan Path too long detected
// ASSERT: scan Valid path accepted

import std.runtime.*
import std.fs.*
import std.env.*

func testDumpHeapEmptyPath(): Unit {
    try {
        dumpHeapData(Path(""))
        println("FAIL: should have thrown exception for empty path")
    } catch (e: Exception) {
        if (e.message.contains("invalid") || e.message.contains("forbidden")) {
            println("Empty path detected")
        } else {
            println("Exception: ${e.message}")
        }
    }
}

func testDumpHeapPathTraversal(): Unit {
    try {
        dumpHeapData(Path("../../../etc/passwd"))
        println("FAIL: should have thrown exception for path traversal")
    } catch (e: Exception) {
        if (e.message.contains("..")) {
            println("Path traversal detected")
        } else {
            println("Exception: ${e.message}")
        }
    }
}

func testDumpHeapTildeExpansion(): Unit {
    try {
        dumpHeapData(Path("~/secret.txt"))
        println("FAIL: should have thrown exception for tilde expansion")
    } catch (e: Exception) {
        if (e.message.contains("~")) {
            println("Tilde expansion detected")
        } else {
            println("Exception: ${e.message}")
        }
    }
}

func testDumpHeapNullByteInjection(): Unit {
    try {
        let maliciousPath = Path("/tmp/test\0.txt")
        dumpHeapData(maliciousPath)
        println("FAIL: should have thrown exception for null byte injection")
    } catch (e: Exception) {
        if (e.message.contains("invalid") || e.message.contains("forbidden")) {
            println("Null byte injection detected")
        } else {
            println("Exception: ${e.message}")
        }
    }
}

func testDumpHeapPathTooLong(): Unit {
    try {
        let longPath = Path("/tmp/" + "a" * 5000 + ".bin")
        dumpHeapData(longPath)
        println("FAIL: should have thrown exception for path too long")
    } catch (e: Exception) {
        if (e.message.contains("invalid") || e.message.contains("forbidden")) {
            println("Path too long detected")
        } else {
            println("Exception: ${e.message}")
        }
    }
}

func testDumpHeapValidPath(): Unit {
    try {
        let tmpPath = Path("/tmp/heap_dump_test_${getProcessId()}.bin")
        dumpHeapData(tmpPath)
        println("Valid path accepted")
    } catch (e: Exception) {
        println("Exception: ${e.message}")
    }
}

main() {
    testDumpHeapEmptyPath()
    testDumpHeapPathTraversal()
    testDumpHeapTildeExpansion()
    testDumpHeapNullByteInjection()
    testDumpHeapPathTooLong()
    testDumpHeapValidPath()
}
