// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func props_bool1(testData:(String, Bool, Bool)) {
    var p = Properties(props_to_test)
    @Expect(p.getBool(testData[0], testData[1]), testData[2])
}

main(){}