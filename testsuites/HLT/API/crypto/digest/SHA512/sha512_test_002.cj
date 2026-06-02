/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output 2>&1 | compare %f

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var chr: Rune = 'c'
    var sha512Instance = SHA512()
    var sh: Array<Byte> = digest(sha512Instance, chr)

    return 0
}
// ASSERT: scan sema_unable_to_infer_generic_func
