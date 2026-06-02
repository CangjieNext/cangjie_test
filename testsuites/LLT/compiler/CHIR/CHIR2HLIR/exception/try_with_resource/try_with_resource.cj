// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan Try
// ASSERT: scan With
// ASSERT: scan Resource

class IOException <: Exception {
    public init() {
        super("IOException")
    }
    public init(message: String) {
        super("IOException" + message)
    }
}

class FileInputStream {
    public FileInputStream(var a: String) {}
}

class FileOutStream {
    public FileOutStream(var a: String) {}
}

extend FileInputStream <: Resource {
    public func isClosed(): Bool {
        return false
    }
    public func close(): Unit {
        print("Try\n")
    }
}

extend FileOutStream <: Resource {
    public func isClosed(): Bool {
        return false
    }
    public func close(): Unit {
        print("With\n")
    }
}

main(): Int64 {
    try (input = FileInputStream("test"), output = FileOutStream("out")) {
        var a = 1
    } catch (e: IOException) {
        print("IOException happened when executing the try-with-resources expression")
    } finally {
        print("Resource\n")
    }
    return 0
}
