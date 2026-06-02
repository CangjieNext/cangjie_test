// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan AAA()()()()

struct SSSS<T> <: ToString where T <: ToString {
    SSSS(let xxxx: T) {}

    public func toString() {
        return xxxx.toString()
    }
}

enum EXHAUSTIVE_ZERO_SIZE {
    A(Unit, (Unit, Unit), SSSS<Unit>)
}

func foo(e: EXHAUSTIVE_ZERO_SIZE) {
    match (e) {
        case A(u, tuple, ssss) =>
            print("AAA");
            print(u);
            print(tuple[0]);
            print(tuple[1]);
            println(ssss)
    }
}

main() {
    foo(EXHAUSTIVE_ZERO_SIZE.A((), ((), ()), SSSS<Unit>(())))
    return 0
}
