/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!cross_compilation) DEPENDENCE: zlib_1M.txt ZlibDecompress.java Cj_Compress.cj
// (!cross_compilation) EXEC: %compiler %import-cangjie-stdx %cmp_opt Cj_Compress.cj  %f -o %output
// (!cross_compilation) RUN-EXEC: %run_stdx %output %run_args
// (!cross_compilation) RUN-EXEC: javac ZlibDecompress.java && java ZlibDecompress zlib_1M_08_Cj_Compress
// (!cross_compilation) RUN-EXEC: %diff zlib_1M.txt zlib_1M_08_Cj_Compress_javaDe.txt

import std.io.*
import stdx.compress.zlib.*

main() {
    compressCj("./zlib_1M.txt", "./zlib_1M_08_Cj_Compress", DeflateFormat, BestCompression, 1024)
    0
}
