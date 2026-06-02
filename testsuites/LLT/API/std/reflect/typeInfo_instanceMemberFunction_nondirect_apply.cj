/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt -g %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether non direct call by reflect is correct.
 * Test API:
 *      public func apply(args: Array<Any>): Bool
 */

import std.reflect.*

@Test
class TypeInfoInstanceMemberFunctionNondirect {
    @TestCase
    @Skip
    func testApply(): Unit {
        let virtToString = TypeInfo.of<Bar>().instanceFunctions.toArray()[0]
        let interfToString = TypeInfo.of<MyToString>().instanceFunctions.toArray()[0]
        let bar = Bar("msg1")
        let baz = Baz("msg2")
        @Expect((virtToString.apply(bar, []) as String).getOrThrow(), "msg1")
        @Expect((virtToString.apply(baz, []) as String).getOrThrow(), "Baz")
        @Expect((interfToString.apply(bar, []) as String).getOrThrow(), "msg1")
        @Expect((interfToString.apply(baz, []) as String).getOrThrow(), "Baz")
    }
}

public interface MyToString <: ToString {
    open func toString(): String
}

public open class Bar <: MyToString {
    let message: String

    init(message: String) {
        this.message = message
    }

    public open func toString(): String {
        message
    }
}

class Baz <: Bar {
    init(message: String) {
        super(message)
    }

    public override func toString(): String {
        "Baz"
    }
}
