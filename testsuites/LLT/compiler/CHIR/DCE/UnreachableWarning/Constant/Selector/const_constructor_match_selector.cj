// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Known enum and Option constructors make non-matching cases unreachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum State {
    | Ready
    | Stopped
}

func enumSelector() {
    const state = State.Ready
    match (state) {
        case Stopped => println("unreachable stopped case")
        case _ => println("enum fallback")
    }
}

func optionSelector() {
    const option = Option<Int64>.Some(1)
    match (option) {
        case None => println("unreachable None case")
        case _ => println("Option fallback")
    }
}

main() {
    enumSelector()
    optionSelector()
}

/* SCAN-IN
warning: unreachable pattern
  ==> const_constructor_match_selector.cj:18:14:
   | 
18 |         case Stopped => println("unreachable stopped case")
   |              ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable pattern
  ==> const_constructor_match_selector.cj:26:14:
   | 
26 |         case None => println("unreachable None case")
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
