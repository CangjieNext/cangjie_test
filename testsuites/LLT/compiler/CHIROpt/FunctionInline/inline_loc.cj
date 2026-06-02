// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %import-cangjie-stdx %enableO2 %f -o %n.%suffix
// ERRCHECK: %set_stdx_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex inline_loc\.cj:29

import stdx.encoding.json.stream.*
import std.io.*

class abc {
    var d = [1, 2, 3, 4, 5]
}

extend abc <: JsonSerializable {
    public func toJson(w: JsonWriter): Unit {
        w.writeValue<Array<Int64>>(d[0..100])
    }
}

main() {
    let buffer = ByteBuffer()
    let w = JsonWriter(buffer)
    let t = abc()
    w.writeValue(t)
    w.flush()
    println(String.fromUtf8(buffer.bytes()))
}
