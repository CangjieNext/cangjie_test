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

class sha1 <: SHA1 {}

main() {
    var str: String = "Weclome#SHA1$to_Cangjie"
    var sha1Instance = SHA1()
    var sh: Array<Byte> = digest(sha1Instance, str)

    return 0
}
// ASSERT: scan sema_non_inheritable_super_class
