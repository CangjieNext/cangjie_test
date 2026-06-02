// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
internal import b.depPackage.*
internal import d.depModule.*

class MainClass {
    public let x = 1

    func foo(): Bool {
        true
    }
}

@Test
class PackageFormat_Decl_Extend_Test {
    @TestCase
    func testMain(): Unit {
        let m = mock<MainClass>()
        @On(m.foo()).returns(false)

        @Expect(m.foo(), false)
    }

    @TestCase
    func testPackage(): Unit {
        let m = mock<DepPackageClass>()
        @On(m.foo()).returns(false)

        @Expect(m.foo(), false)
    }

    @TestCase
    func testModule(): Unit {
        let m = mock<DepModuleClass>()
        @On(m.foo()).returns(false)

        @Expect(m.foo(), false)
    }
}
