// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

sealed abstract class A {}

sealed interface I {}

sealed interface IChild <: I {}

class B <: A & IChild {}

sealed abstract class C {}

sealed interface J {}

class D <: J {}

sealed abstract class Root {}

sealed interface Marker {}

sealed abstract class EmptyIntersection <: Root & Marker {}

class RootOnly <: Root {}

class MarkerOnly <: Marker {}

func matchCommonSubtype(x: I): Int64 {
    match (x) {
        case _: A => 1
        case _ => 2
    }
}

func matchDisjointType(x: J): Int64 {
    match (x) {
        case _: C => 1 // unreachable
        case _ => 2
    }
}

func matchEmptyAbstractIntersection(x: Marker): Int64 {
    match (x) {
        case _: Root => 1 // unreachable
        case _ => 2
    }
}

main() {
    if (matchCommonSubtype(B()) != 1 || matchDisjointType(D()) != 2 ||
        matchEmptyAbstractIntersection(MarkerOnly()) != 2) {
        throw Exception("unexpected match result")
    }
}

// ASSERT: scan-2 warning: unreachable pattern
// ASSERT: scan sealed_common_subtype.cj:43:14:
// ASSERT: scan sealed_common_subtype.cj:50:14:
// ASSERT: scan-not case _: A => 1
// ASSERT: scan 2 warnings generated, 2 warnings printed.
