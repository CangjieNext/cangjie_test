/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: other.cj
// EXEC-0: %compiler %cmp_opt %compile_lib_opt --mock=on -Woff=all other.cj -o libother.%middle
package other

public interface I {
    func foo<T>(): ?T;

    func fooDef<T>(): T {
        foo<T>().getOrThrow()
    }
}

// SEPARATE-FILE: otherOther.cj
// EXEC-0: %compiler %cmp_opt %compile_lib_opt --mock=on -Woff=all libother.%middle otherOther.cj -o libotherOther.%middle
package otherOther

import other.*

public class A <: I {
    public func foo<T>(): ?T {
        return None 
    }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %cmp_opt -Woff=all main.cj libotherOther.%middle libother.%middle -o %output 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import otherOther.*

main() {
    println("Ok")
}

/* SCAN-IN
Ok
*/
