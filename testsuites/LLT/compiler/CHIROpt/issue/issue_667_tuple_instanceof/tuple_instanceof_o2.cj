// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// Regression test for issue #667: the answer of a runtime type test must not depend on
// the optimization level. `FixCastProblemAfterInst` used to replace every `instanceof`
// whose source type was not a sub type of the target type by `false`, so the tuple test
// below was constant-folded at -O2/-Os although the runtime value satisfies it.

open class A1 {}
open class A2 <: A1 {}
open class A3 <: A2 {}
open class B {}

/**
 * The `is` test between a tuple and a tuple is decided element by element at runtime.
 * `(A3, A3)` satisfies `(A2, A3)`, even though `(A2, A2)` is not a sub type of `(A2, A3)`.
 */
func tupleRuntimeDependent(x: (A2, A2)): Bool {
    return x is (A2, A3)
}

func tupleSameShape(x: (A2, A2)): Bool {
    return x is (A3, A3)
}

func tupleNested(x: ((A2, A2), A2)): Bool {
    return x is ((A2, A3), A3)
}

/** Statically disjoint: must keep being folded to false by the optimizer. */
func tupleDisjoint(x: (Int64, Int64)): Bool {
    return x is (Bool, Bool)
}

/** Scalar counterpart of the same defect: a super type value may hold the target sub type. */
func supertypeOfTarget(x: A2): Bool {
    return x is A3
}

func subtypeOfTarget(x: A3): Bool {
    return x is A2
}

func unrelatedClass(x: A3): Bool {
    return x is B
}

main(): Int64 {
    if (!tupleRuntimeDependent((A3(), A3()))) {
        return 1
    }
    if (!tupleSameShape((A3(), A3()))) {
        return 2
    }
    if (!tupleNested(((A3(), A3()), A3()))) {
        return 3
    }
    if (tupleDisjoint((1, 2))) {
        return 4
    }
    if (unrelatedClass(A3())) {
        return 5
    }
    if (!supertypeOfTarget(A3())) {
        return 6
    }
    if (!subtypeOfTarget(A3())) {
        return 7
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
