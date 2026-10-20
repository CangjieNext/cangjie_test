// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.fs.*

func read(path: String): String {
    String.fromUtf8(File.readFrom(path)).trimAscii()
}

func registryEntry(name: String, artifact: String, dependencies: String): String {
    let checksum = read("${artifact}.sha256")
    return "[requires.\"${name}\"]\n" +
        "version = \"1.0.0\"\n" +
        "source = \"registry+https://127.0.0.1:1\"\n" +
        "checksum = \"sha256:${checksum}\"\n" +
        "dependencies = ${dependencies}\n\n"
}

main(args: Array<String>): Int64 {
    try {
        let mode = args[0]
        let normal = mode == "normal"
        let commitOnly = mode == "commit"
        let remote = read("remote.url")
        let commit = read("locked.commit")
        let selector = if (commitOnly) { "" } else { "?branch=main" }
        var expected = "version = 1\n\n"
        expected += registryEntry("adapter", "adapter",
            if (normal) { "[\"org::core\"]" } else { "[\"mock\", \"org::core\"]" })
        if (!normal) {
            expected += registryEntry("mock", "mock", "[]")
        }
        expected += registryEntry("org::core", "core", "[]")
        expected += "[requires.\"remote\"]\n" +
            "version = \"1.0.0\"\n" +
            "source = \"git+${remote}${selector}#${commit}\"\n" +
            "dependencies = []"
        let actual = read("project/cjpm.lock").replace("\r\n", "\n")
        if (actual != expected) {
            eprintln("Unexpected v1 lock content:\n${actual}\nExpected:\n${expected}")
            return 1
        }
        println("lock-v1 ${mode}: passed")
        return 0
    } catch (e: Exception) {
        eprintln(e.message)
        return 1
    }
}
