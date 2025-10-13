/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=off 2>&1 | compare %f

public func a(): String {
    "original value"
}

public func test123(): String {
    "original value"
}

var __ = @EnsurePreparedToMock {
    => return a();
}

main() {
    0
}

/* SCAN-IN
error: mocking features are disabled, you can enable them by passing --mock=on compilation option explicitly, or using default mode
  ==> withTestWithoutMock.cj:18:32:
   | 
18 |   var __ = @EnsurePreparedToMock {
   |  ________________________________^
19 | |     => return a();
20 | | }
   | |_^
   | 

*/
