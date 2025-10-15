// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt -j1 %f 2>&1 | compare %f

// ASSERT: regex-auto @"default:EA.ti" = internal
// ASSERT: regex-auto @"default:EA:0.ti" = private

// ASSERT: regex-auto @"default:EB.ti" = global
// ASSERT: regex-auto @"default:EB:0.ti" = global

// ASSERT: regex-auto @"default:EC.tt" = global
// ASSERT: regex-auto @"default:EC:0.tt" = global

// ASSERT: regex-auto @"default:ED.tt" = private
// ASSERT: regex-auto @"default:ED:0.tt" = private

// ASSERT: regex-auto @"default:EE.tt" = global
// ASSERT: regex-auto @"default:EE:0.tt" = global

private enum EA {
    Case1(Int64) | Case2(Bool, Object)
}

public enum EB {
    Case1(Int64) | Case2(Bool, Object)
}

enum EC<T> {
    Case1(T) | Case2(Bool, Object)
}

private enum ED<T> {
    Case1(Int64) | Case2(Bool, Object)
}

public enum EE<T> {
    Case1(Int64) | Case2(Bool, Object)
}

func ff<T>(x: T) {
    x
}

struct SA<T> {
    var a: T
    init(x: T) {
        a = x
    }
}

main() {
    EA.Case1(5)
    EC<Int64>.Case1(5)
    var f = Option<Int64>.Some(1)
    match (f) {
        case Some(x) => println(x)
        case Nonde => println(0)
    }
    ff(f)
    ff(SA<Int64>(5))
    0
}
