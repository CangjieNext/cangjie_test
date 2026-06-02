// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TextX {
    @TestCase
    func merge_options_correctly(): Unit {
        let config = defaultConfiguration()

        @Expect(config.get<String>(KeyTimeoutEach.timeoutEach), "4m")
        @Expect(config.get<String>(KeyFilter.filter), "TextX")
    }
}

main() {}
