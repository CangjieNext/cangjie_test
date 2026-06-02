/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: getpath.sh path.txt
// (not Windows) EXEC-PIPE: %compiler %cmp_opt %f -o %output
// (not OHOS and not Windows)RUN-EXEC-PIPE: bash getpath.sh && %run %run_opt %output %run_args | compare %f
// (OHOS)RUN-EXEC-PIPE: sh getpath.sh && %run %run_opt %output %run_args | compare %f
// (not Windows) ASSERT: scan-not Exception

import std.posix.*

foreign func free(cp: CPointer<Int32>): Unit

func readtxt(): String {
    var arr: Array<Rune> = Array<Rune>(100, {i => r'\0'})
    var str: String = String(arr)
    var buf = unsafe { LibC.mallocCString(str) }
    var fd = `open`("path.txt", O_RDONLY)
    var readNum = unsafe { read(fd, buf.getChars(), UIntNative(1024)) }
    close(fd)
    var res = buf.toString()
    unsafe { LibC.free(buf) }
    return res
}

main() {
    var fd = `open`(readtxt(), O_RDONLY)
    ttyname(fd)
    close(fd)

    return 0
}
