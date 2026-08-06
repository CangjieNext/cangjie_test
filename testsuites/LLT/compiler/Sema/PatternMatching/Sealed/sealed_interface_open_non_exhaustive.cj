// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An unsealed interface child can have descendants outside the sealed root package.
// ERRCHECK: %compiler %cmp_opt %f -o %output

sealed interface InterfaceRoot {}

interface OpenInterfaceBranch <: InterfaceRoot {}

class KnownInterfaceChild <: OpenInterfaceBranch {}

func classifyInterface(value: InterfaceRoot): Int64 {
    match (value) {
        case _: KnownInterfaceChild => 0
    }
}

main() {
    classifyInterface(KnownInterfaceChild())
}

/* SCAN
error: non-exhaustive patterns
  ==> sealed_interface_open_non_exhaustive.cj:17:12:
   | 
17 |     match (value) {
   |            ^^^^^ the selector is of type 'Interface-InterfaceRoot'
   | 
   # note: _ is not covered

1 error generated, 1 error printed.
*/
