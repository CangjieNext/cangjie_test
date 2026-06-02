/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt ./p1/*.cj %compile_lib_opt -o libp1.%middle
// EXEC: %compiler %cmp_opt %f libp1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.*

main(): Int64 {
    var a = Stream()
    var b = MimeHeader().write(a)
    if (b != 2) {
        print("${b}")
        return 1
    }
    return 0
}

class MimeHeader {
    public func write(x: WriteStream): Int64 {
        x.write("a")
    }
}
