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
    var sha384Instance = SHA384()
    var sh: Array<Byte> = digest(sha384Instance, str)
    var result: String = toHexString(sh)
    if (result != "fbb7a821fb4e6da9771b9b3b5dafd858aefb9e91a1c57344173f6026b8e3d2fe797bbff5c04dc33fe2b1bc3b65c52ce9") {
        return 1
    }
    return 0
}
