// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [C7_enum_selector] const enum tag selector
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.2 C7
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


enum State {
    | Ready
    | Stopped
}

main() {
    const state = State.Ready
    match (state) {
        case Ready => println("ready")
        case Stopped => println("stopped")
    }
}

/* SCAN-IN
warning: unreachable pattern
  ==> C7_enum_selector.cj:22:14:
   | 
22 |         case Stopped => println("stopped")
   |              ^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
