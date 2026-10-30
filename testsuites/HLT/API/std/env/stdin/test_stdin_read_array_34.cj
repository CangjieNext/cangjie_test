/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: check_stdin_partial_read.py
// EXEC: %compiler %cmp_opt -o %output %f
// (not OHOS and not iOS) RUN-EXEC: %run %python check_stdin_partial_read.py -- %run_opt ./%output %run_args
// ASSERT: scan PASS

import std.env.getStdIn
import std.env.getVariable
import std.io.InputStream
import std.console.Console

func checkLegacyReaders(): Unit {
    let input = getStdIn()
    if (input.read() != Some(r'仓') || input.readUntil({ ch => ch == r';' }) != Some("颉;") ||
        input.readln() != Some("line") || input.readToEnd() != Some("tail")) {
        throw Exception("legacy reader lost or changed input")
    }
    if (input.read().isSome() || input.readln().isSome() ||
        input.readUntil(r';').isSome() || input.readToEnd().isSome()) {
        throw Exception("legacy reader returned data after EOF")
    }
    println("PASS legacy readers")
}

func checkDeprecatedReaders(): Unit {
    let input = Console.stdIn
    if (input.read() != Some(r'仓') || input.readUntil({ ch => ch == r';' }) != Some("颉;")) {
        throw Exception("deprecated reader lost or changed input")
    }
    let buffer = Array<Byte>(2, repeat: 0)
    if (input.read(buffer) != 2 || buffer != "li".toArray() ||
        input.readln() != Some("ne") || input.readToEnd() != Some("tail")) {
        throw Exception("deprecated reader lost or changed input")
    }
    if (input.read().isSome() || input.readln().isSome() ||
        input.readUntil(r';').isSome() || input.readToEnd().isSome() || input.read(buffer) != 0) {
        throw Exception("deprecated reader returned data after EOF")
    }
    println("PASS deprecated readers")
}

func checkCoreEof(): Unit {
    var reachedEof = false
    try {
        let _ = readln()
    } catch (error: IllegalStateException) {
        reachedEof = true
    }
    if (!reachedEof) {
        throw Exception("core readln did not report EOF")
    }
    println("PASS core EOF")
}

func printRead(bufferSize: Int64): Unit {
    let buffer = Array<Byte>(bufferSize, repeat: 0)
    let count = getStdIn().readSome(buffer)
    println("${count}:${buffer[..count]}")
}

func printLegacyRead(bufferSize: Int64): Unit {
    // Interface dispatch must retain the original ConsoleReader.read behavior.
    let input: InputStream = getStdIn()
    let buffer = Array<Byte>(bufferSize, repeat: 0)
    let count = input.read(buffer)
    print("${count}:${buffer[..count]}\n", flush: true)
}

func printSliceRead(): Unit {
    let storage = Array<Byte>(10, repeat: 255)
    let count = getStdIn().readSome(storage.slice(1, 8))
    if (count < 0 || count > 8 || storage[0] != 255 || storage[9] != 255) {
        throw Exception("readSome wrote outside the destination slice")
    }
    if (storage.slice(count + 1, 9 - count) != Array<Byte>(9 - count, repeat: 255)) {
        throw Exception("readSome modified the unread suffix")
    }
    println("${count}:${storage.slice(1, count)}")
}

func printAccumulatedReads(): Unit {
    let storage = Array<Byte>(12, repeat: 255)
    let chunk = Array<Byte>(4, repeat: 0)
    var total: Int64 = 0
    while (true) {
        let count = getStdIn().readSome(chunk)
        if (count == 0) {
            break
        }
        if (count < 0 || count > chunk.size || count > storage.size - total) {
            throw Exception("unexpected readSome byte count")
        }
        chunk.copyTo(storage, 0, total, count)
        total += count
    }
    if (storage.slice(total, storage.size - total) != Array<Byte>(storage.size - total, repeat: 255)) {
        throw Exception("accumulated reads modified the unread suffix")
    }
    println("${total}:${storage[..total]}")
}

main() {
    let mode = getVariable("CJ_STDIN_PARTIAL_READ_MODE")
    if (mode == Some("legacy_readers")) {
        checkLegacyReaders()
    } else if (mode == Some("deprecated_readers")) {
        checkDeprecatedReaders()
    } else if (mode == Some("legacy_readers_empty")) {
        let input = getStdIn()
        if (input.read().isSome() || input.readln().isSome() ||
            input.readUntil({_ => true}).isSome() || input.readToEnd().isSome()) {
            throw Exception("empty input returned data")
        }
        println("PASS empty readers")
    } else if (mode == Some("core_lines")) {
        println(readln().toArray())
        println(readln().toArray())
        checkCoreEof()
    } else if (mode == Some("core_empty")) {
        checkCoreEof()
    } else if (mode == Some("prompt_core")) {
        print("PROMPT>", flush: false)
        if (readln() != "answer") { throw Exception("unexpected terminal input") }
        print("ACK\n", flush: true)
    } else if (mode == Some("prompt_env")) {
        print("PROMPT>", flush: false)
        if (getStdIn().readln() != Some("answer")) { throw Exception("unexpected terminal input") }
        print("ACK\n", flush: true)
    } else if (mode == Some("prompt_deprecated")) {
        print("PROMPT>", flush: false)
        if (Console.stdIn.readln() != Some("answer")) { throw Exception("unexpected terminal input") }
        print("ACK\n", flush: true)
    } else if (mode == Some("prompt_some")) {
        print("PROMPT>", flush: false)
        let buffer = Array<Byte>(16, repeat: 0)
        let count = getStdIn().readSome(buffer)
        if (buffer[..count] != "answer\n".toArray()) { throw Exception("unexpected terminal input") }
        print("ACK\n", flush: true)
    } else if (mode == Some("empty")) {
        printRead(0)
    } else if (mode == Some("delayed")) {
        print("READY\n", flush: true)
        printRead(4096)
    } else if (mode == Some("small")) {
        printRead(4)
        printRead(4)
    } else if (mode == Some("message_chunks")) {
        printRead(3)
        printRead(3)
        printRead(3)
    } else if (mode == Some("binary")) {
        printRead(4)
    } else if (mode == Some("buffered")) {
        println(getStdIn().readUntil(r'a'))
        printRead(4096)
    } else if (mode == Some("mixed")) {
        println(getStdIn().readln())
        printRead(4096)
    } else if (mode == Some("reverse_mixed")) {
        printRead(2)
        println(getStdIn().readln())
        printRead(4096)
    } else if (mode == Some("core_mixed")) {
        printRead(2)
        println(readln())
        printRead(4096)
    } else if (mode == Some("legacy_wait")) {
        print("READY\n", flush: true)
        printLegacyRead(8)
    } else if (mode == Some("legacy_line_wait")) {
        print("READY\n", flush: true)
        printLegacyRead(4)
        printRead(4096)
        printRead(4096)
    } else if (mode == Some("legacy_empty")) {
        printLegacyRead(0)
    } else if (mode == Some("legacy_eof")) {
        printLegacyRead(8)
        printLegacyRead(8)
    } else if (mode == Some("legacy_text")) {
        printLegacyRead(2048)
        printLegacyRead(2048)
    } else if (mode == Some("legacy_text_mixed")) {
        printLegacyRead(1)
        printRead(4096)
        printRead(4096)
    } else if (mode == Some("legacy_mixed")) {
        printLegacyRead(2)
        printRead(4096)
        printLegacyRead(2)
        printRead(4096)
    } else if (mode == Some("reverse_legacy_mixed")) {
        printRead(2)
        printLegacyRead(3)
        printRead(4096)
        println(getStdIn().readln())
    } else if (mode == Some("reverse_until_mixed")) {
        printRead(2)
        println(getStdIn().readUntil(r'e'))
        printRead(4096)
        println(getStdIn().readln())
    } else if (mode == Some("slice")) {
        printSliceRead()
    } else if (mode == Some("accumulate")) {
        printAccumulatedReads()
    } else if (mode == Some("eof")) {
        printRead(4096)
        printRead(4096)
    } else {
        printRead(4096)
    }
}
