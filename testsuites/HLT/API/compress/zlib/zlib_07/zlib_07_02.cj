/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Mac and not OHOS)DEPENDENCE: zlib_1M.txt ZlibDecompress.java Cj_Compress.cj
// (not Mac and not OHOS)EXEC: %compiler %import-cangjie-stdx %cmp_opt Cj_Compress.cj  %f -o %output
// (not Mac and not OHOS)RUN-EXEC: %run_stdx %output %run_args
// (not Mac and not OHOS)RUN-EXEC: javac ZlibDecompress.java && java ZlibDecompress zlib_1M_02_Cj_Compress
// (not Mac and not OHOS)RUN-EXEC: %diff zlib_1M.txt zlib_1M_02_Cj_Compress_javaDe.txt

import std.io.*
import stdx.compress.zlib.*

main() {
    compressCj("./zlib_1M.txt", "./zlib_1M_02_Cj_Compress", DeflateFormat, BestSpeed, 1)
    0
}
