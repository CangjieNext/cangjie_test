/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.File
import stdx.encoding.json.*

main(args: Array<String>): Int64 {
    let testResult = String.fromUtf8(File.readFrom(args[0i64]))
    assertDiagnosis(testResult, at: 0i64, kind: "sema_invalid_binary_expr",
        message: "invalid binary operator '**' on type 'Int16' and 'Float32'",
        note: "you may want to implement 'operator func **(right: Float32)' for type 'Int16'")
    return 0i64
}
