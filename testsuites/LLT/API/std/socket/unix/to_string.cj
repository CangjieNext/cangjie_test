/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.net.*
internal import std.fs.*
internal import std.random.*
internal import std.posix.*
internal import std.process.*
internal import std.collection.ArrayList

@When[os == "Windows"]
foreign func _unlink(filename: CPointer<Byte>): Int32

@When[os == "Windows"]
func unlink(filename: String): Int32 {
    unsafe {
        let cph = acquireArrayRawData(filename.rawData())
        let ret = _unlink(cph.pointer)
        releaseArrayRawData(cph)
        return ret
    }
}

let files = ArrayList<String>()

func test(): Int64 {
    let file = createTempFile()

    try (server = UnixServerSocket(bindAt: file)) {
        println(server)
        if (server.toString() != "UnixServerSocket(unconnected, unbound)") {
            return 8
        }

        server.bind()
        println(server)
        let serverAddr = server.localAddress

        if (server.toString() != "UnixServerSocket(bound at ${serverAddr})") {
            return 9
        }

        try (client = UnixSocket(serverAddr)) {
            println(client)
            if (client.toString() != "UnixSocket(unconnected, unbound)") {
                return 10
            }

            client.connect()
            println(client)
            if (client.toString() != "UnixSocket(${client.localAddress} -> ${serverAddr})") {
                return 11
            }
        }
    }

    try (unixDt = UnixDatagramSocket(bindAt: createTempFile())) {
        println(unixDt)
        if (unixDt.toString() != "UnixDatagramSocket(unconnected, unbound)") {
            return 12
        }

        unixDt.bind()
        println(unixDt)
        if (unixDt.toString() != "UnixDatagramSocket(bound at ${unixDt.localAddress})") {
            return 13
        }

        try (another = UnixDatagramSocket(bindAt: createTempFile())) {
            another.bind()

            unixDt.connect(another.localAddress)
            println(unixDt)
            if (unixDt.toString() != "UnixDatagramSocket(${unixDt.localAddress} -> ${unixDt.remoteAddress.getOrThrow()})") {
                return 14
            }
        }
    }

    return 0
}

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    let file = tempDir.join("tmp${index}").toString()
    files.add(file)
    return file
}

func unlinkAll(): Unit {
    for (file in files) {
        unlink(file)
    }
}

main(): Int64 {
    try {
        test()
    } finally {
        unlinkAll()
    }
}
