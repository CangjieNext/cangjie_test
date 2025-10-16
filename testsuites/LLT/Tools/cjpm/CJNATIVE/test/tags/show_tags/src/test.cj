// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package show_tags

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Tag[tag0, tag1]
class TestsWithTags {
    @TestCase
    func noTags() {}

    @TestCase
    @Tag[failing]
    func failing() {
        @Assert(false)
    }
}

@Test
@Tag[tag1]
class TestsWithTag {
    @TestCase
    @Tag[tag2, tag3]
    func twoTags() {}

    @TestCase
    @Tag[tag4]
    func oneTag() {}

    @TestCase
    func noTags() {}
}

@Test
class TestsWithoutTag {
    @TestCase
    @Tag[tag5]
    func oneTag() {}

    @TestCase
    func noTags() {}
}

@Test
@Tag[tag6, tag7]
func topLevel() {}
