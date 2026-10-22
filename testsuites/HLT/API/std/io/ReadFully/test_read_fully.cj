/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan PASS

import std.io.*

class ChunkedInput <: InputStream {
    private let data: Array<Byte>
    private let chunkSize: Int64
    private var offset: Int64 = 0
    private var calls: Int64 = 0

    init(data: Array<Byte>, chunkSize: Int64) {
        this.data = data
        this.chunkSize = chunkSize
    }

    public func read(buffer: Array<Byte>): Int64 {
        calls++
        let count = min(min(chunkSize, buffer.size), data.size - offset)
        data.copyTo(buffer, offset, 0, count)
        offset += count
        return count
    }

    func callCount(): Int64 { calls }
}

class SourceReadException <: IOException {
    init() { super("source read failure") }
}

class FailingInput <: InputStream {
    private var first: Bool = true

    public func read(buffer: Array<Byte>): Int64 {
        if (first) {
            first = false
            buffer[0] = 97
            return 1
        }
        throw SourceReadException()
    }
}

class InvalidCountInput <: InputStream {
    private let count: Int64
    init(count: Int64) { this.count = count }
    public func read(buffer: Array<Byte>): Int64 {
        if (buffer.size == 0) {
            return 0
        }
        return count
    }
}

struct FixedInput <: InputStream {
    public func read(buffer: Array<Byte>): Int64 {
        for (index in 0..buffer.size) {
            buffer[index] = 97
        }
        return buffer.size
    }
}

func fillGeneric<T>(input: T, buffer: Array<Byte>): Unit where T <: InputStream {
    input.readFully(buffer)
}

func check(value: Bool, name: String): Unit {
    if (!value) {
        throw Exception("readFully regression failed: ${name}")
    }
}

func expectIncomplete(input: InputStream, buffer: Array<Byte>): Unit {
    var caught = false
    try {
        input.readFully(buffer)
    } catch (e: IOException) {
        caught = true
    }
    check(caught, "incomplete read must fail")
}

main() {
    let payload = "abcdefgh".toArray()
    for (chunkSize in 1..=3) {
        let input = ChunkedInput(payload, chunkSize)
        let buffer = Array<Byte>(8, repeat: 0)
        input.readFully(buffer)
        check(buffer == payload, "ordered short reads")
        check(input.callCount() > 1, "multiple underlying reads")
    }

    let exact = ChunkedInput(payload, 8)
    let exactBuffer = Array<Byte>(8, repeat: 0)
    exact.readFully(exactBuffer)
    check(exactBuffer == payload && exact.callCount() == 1, "no read after filling")

    let emptyInput = ChunkedInput(payload, 1)
    emptyInput.readFully(Array<Byte>(0, repeat: 0))
    check(emptyInput.callCount() == 0, "empty destination must not read")

    expectIncomplete(ChunkedInput(Array<Byte>(0, repeat: 0), 2), Array<Byte>(8, repeat: 0))
    let incomplete = Array<Byte>(8, repeat: 255)
    expectIncomplete(ChunkedInput("abc".toArray(), 2), incomplete)
    check(incomplete.slice(0, 3) == "abc".toArray(), "partial bytes retained")
    check(incomplete.slice(3, 5) == Array<Byte>(5, repeat: 255), "unread suffix retained")

    let source = ChunkedInput("abcdefghij".toArray(), 3)
    let prefix = Array<Byte>(8, repeat: 0)
    source.readFully(prefix)
    let tail = Array<Byte>(2, repeat: 0)
    source.readFully(tail)
    check(prefix == payload && tail == "ij".toArray(), "no input overread")

    let surrounding = Array<Byte>(10, repeat: 255)
    ChunkedInput(payload, 2).readFully(surrounding.slice(1, 8))
    check(surrounding[0] == 255 && surrounding[9] == 255, "slice bounds")
    check(surrounding.slice(1, 8) == payload, "slice writes reach original array")

    var sourceError = false
    let failed = Array<Byte>(8, repeat: 0)
    try {
        FailingInput().readFully(failed)
    } catch (e: SourceReadException) {
        sourceError = true
    }
    check(sourceError && failed[0] == 97, "source exception type is preserved")

    expectIncomplete(InvalidCountInput(-1), Array<Byte>(8, repeat: 0))
    expectIncomplete(InvalidCountInput(9), Array<Byte>(8, repeat: 0))

    let binary: Array<Byte> = [0, 255, 128, 10]
    let binaryBuffer = Array<Byte>(4, repeat: 0)
    ChunkedInput(binary, 1).readFully(binaryBuffer)
    check(binaryBuffer == binary, "binary data")

    let byteBuffer = Array<Byte>(8, repeat: 0)
    ByteBuffer(payload).readFully(byteBuffer)
    check(byteBuffer == payload, "ByteBuffer input")

    let interfaceInput: InputStream = ChunkedInput(payload, 2)
    let interfaceBuffer = Array<Byte>(8, repeat: 0)
    interfaceInput.readFully(interfaceBuffer)
    check(interfaceBuffer == payload, "interface-typed default method")

    let genericBuffer = Array<Byte>(8, repeat: 0)
    fillGeneric(ChunkedInput(payload, 3), genericBuffer)
    check(genericBuffer == payload, "generic default method")

    let buffered = BufferedInputStream(ChunkedInput(payload, 2), 3)
    let bufferedBytes = Array<Byte>(8, repeat: 0)
    buffered.readFully(bufferedBytes)
    check(bufferedBytes == payload, "buffered input inherits default method")

    let chained = ChainedInputStream([ByteBuffer("abc".toArray()), ByteBuffer("defgh".toArray())])
    let chainedBytes = Array<Byte>(8, repeat: 0)
    chained.readFully(chainedBytes)
    check(chainedBytes == payload, "chained input inherits default method")

    let structBuffer = Array<Byte>(3, repeat: 0)
    FixedInput().readFully(structBuffer)
    check(structBuffer == "aaa".toArray(), "struct inherits default method")
    println("PASS readFully contract")
}
