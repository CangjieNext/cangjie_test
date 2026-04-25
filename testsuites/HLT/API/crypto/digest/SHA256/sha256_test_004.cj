/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var str: String = """
            $$Weclome###MD5__toCangjie%%%$$$$Weclome###MD5__toCangjie%%%$$
            $$Weclome###MD5__toCangjie%%%$$$$Weclome###MD5__toCangjie%%%$$
        """
    var sha256Instance = SHA256()
    var sh: Array<Byte> = digest(sha256Instance, str)
    var result: String = toHexString(sh)
    if (result != "cd3d99e5453be77b55b20d4b389bc12132231a25bc969173cb626c45aebbd85d") {
        return 1
    }
    return 0
}
