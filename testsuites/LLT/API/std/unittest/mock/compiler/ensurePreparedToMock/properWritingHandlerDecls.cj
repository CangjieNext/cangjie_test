/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

// This test triggers compiler's crash in case of writing generated handler global variable directly to file decls while walking

public func a(): String {
    "original value"
}

public func test123(): String {
    "original value"
}

var __ = @EnsurePreparedToMock {
    => return a();
}
