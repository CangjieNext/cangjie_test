// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@TestCase[data in testData.toArray()]
public func testFold(data: AddrFoldData): Unit {
    @Expect(data.expect, InternetAddress.toStringStatic(data.orig, 0))
}

main(){}