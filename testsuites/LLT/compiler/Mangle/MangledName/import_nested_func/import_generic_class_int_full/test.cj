// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mymod
// (CJNATIVE) EXEC: %compiler %cmp_opt ./mymod/mod1/mod1.cj %output_dir_opt ./mymod --output-type=dylib --save-temps .
// (CJNATIVE) EXEC: %compiler %cmp_opt -lmymod.mod1 --import-path=mymod -Lmymod -p . -o %output
// (CJNATIVE and Linux) EXEC-PIPE: LD_LIBRARY_PATH=./mymod:$LD_LIBRARY_PATH %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Windows) EXEC-PIPE: set PATH=./mymod;%PATH%&& %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Darwin) EXEC-PIPE: DYLD_LIBRARY_PATH=./mymod:$DYLD_LIBRARY_PATH %run %run_opt %output %run_args | compare %f
// (CJNATIVE) ASSERT: scan b = 100
// (CJNATIVE) ASSERT: scan d = 200
// (CJNATIVE) ASSERT: scan b2 = 100
// (CJNATIVE) ASSERT: scan d2 = 200

import mymod.mod1
import std.collection.*

public open class MyClassA<K> {
    public func foo(): () -> Int64 {
        func koo(): Int64 {
            return 100
        }

        koo
    }
    public func foo(c: String): () -> Int64 {
        func koo(): Int64 {
            return 200
        }

        koo
    }
}

main() {
    let node = mod1.MyClassA<Int64>();
    let b = node.foo()
    println("b = ${b()}")
    let d = node.foo("hahahaha")
    println("d = ${d()}")

    let node2 = MyClassA<Int64>()
    let b2 = node2.foo()
    println("b2 = ${b2()}")
    let d2 = node2.foo("ahahaha")
    println("d2 = ${d2()}")
    return 0
}
