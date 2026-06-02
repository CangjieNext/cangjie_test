// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mangle14
// EXEC: %compiler %cmp_opt %compile_lib_opt mangle14/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt a.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %cmp_opt a.%middle %f -o %output --dump-ir 2>&1 | compare %f
// (not CJNATIVE)  ASSERT: scan %record._CN7default9FooStructE = type { i64 }
// (not CJNATIVE)  ASSERT: scan %record._CN1a9FooStructE = type { i64 }

// (CJNATIVE) ASSERT: scan void @_CN7default3gooHRNY_9FooStructE
// (not CJNATIVE)  ASSERT: scan void @_CN7default3gooERN7default9FooStructE(

// (CJNATIVE) ASSERT: scan _CN1a9FooStruct5getIDHv
// (not CJNATIVE)  ASSERT: scan _CN1a9FooStruct5getIDEv
// (CJNATIVE) ASSERT: scan _CN7default9FooStruct3barHv
// (not CJNATIVE) ASSERT: scan _CN7default9FooStruct3barEv

// (CJNATIVE) ASSERT: scan _CN7default4testHRNY_9FooStructE
// (CJNATIVE) ASSERT: scan _CN7default4testHRN1a9FooStructE
// (not CJNATIVE)  ASSERT: scan _CN7default4testERrecord.N7default9FooStructE
// (not CJNATIVE)  ASSERT: scan _CN7default4testERrecord.N1a9FooStructE

import a.*
import a

// test @C struct mangling and import

@C
struct FooStruct {
    let id = 2
    func bar() {
        println("id = ${id}")
    }
}

func test(v: a.FooStruct) {
    println(v.getID())
}

func test(v: FooStruct) {
    println(v.id)
}

@C
func goo(a: FooStruct) {
    a.bar()
}

main() {
    test(a.FooStruct())
    test(FooStruct())
    unsafe { goo(FooStruct()) }
}
