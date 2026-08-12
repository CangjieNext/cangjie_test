/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (host_win) EXEC: if not exist %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix
// (!host_win) EXEC: [ ! -f %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix ] && %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix || true
// EXEC: %compiler %cmp_opt -o %output %f -L %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType --import-path %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType -lMyType.myType %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.get("MyType.myType.I0").toString(), "MyType.myType.I0")
        @Expect(TypeInfo.get("MyType.myType.I1").toString(), "MyType.myType.I1")
        @Expect(TypeInfo.get("MyType.myType.I2").toString(), "MyType.myType.I2")
        @Expect(TypeInfo.get("MyType.myType.I3").toString(), "MyType.myType.I3")
        @Expect(TypeInfo.get("MyType.myType.I4").toString(), "MyType.myType.I4")
        @Expect(TypeInfo.get("MyType.myType.I5").toString(), "MyType.myType.I5")
        @Expect(TypeInfo.get("MyType.myType.I6").toString(), "MyType.myType.I6")
    }
}
