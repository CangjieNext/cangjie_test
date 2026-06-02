/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and not Windows) EXEC: %run %run_opt %output %run_args

// ASSERT: scan Path traversal detected
// ASSERT: scan Tilde expansion detected

import std.runtime.*
import std.fs.*
import std.env.*

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
    testDumpHeapPathTraversal()
    testDumpHeapTildeExpansion()
    testDumpHeapValidPath()
}
