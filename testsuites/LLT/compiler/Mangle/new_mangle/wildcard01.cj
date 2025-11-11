// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$0_Hv
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$00_Hv
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$01_Hv
// (CJNATIVE) ASSERT: scan _CGV7default1aHv
// (CJNATIVE) ASSERT: scan _CGV7default1bHv
// (CJNATIVE) ASSERT: scan _CGV7default1cHv
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$02_Hv
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$03_Hv
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$04_Hv
// (CJNATIVE) ASSERT: scan _CGV7defaultUwildcard01$05_Hv

let (_, _) = (1, {=> 2}) // _CGV7defaultU0_0_Hv

let (_, (_, _)) = (1, (2, 3)) // _CGV7defaultU0_00_Hv

let (_, ((_, _, _), _)) = (1, ((2, 3, 4), 3)) // _CGV7defaultU0_01_Hv

let (_, a) = (1, {=> 2}) // _CGV7default1aHv

let (_, (b, _)) = (1, (2, 3)) // _CGV7default1bHv

let (_, ((_, c, _), _)) = (1, ((2, 3, 4), 3)) // _CGV7default1cHv

enum EEE {
    | AAA
}

enum DDD {
    | BBB(FFF)
}

enum FFF {
    | BBB(Int64)
}

enum GGG {
    | CCC(Int64)
}

let AAA = AAA // don't count

let BBB(BBB(_)) = BBB(BBB(1)) // _CGV7defaultU0_02_Hv

let (_, CCC(_)) = (1, CCC(1)) // _CGV7defaultU0_03_Hv

let (_, (CCC(_), _)) = (1, (CCC(1), 3)) // _CGV7defaultU0_04_Hv

let (_, ((_, CCC(_), _), _)) = (1, ((2, CCC(1), 4), 3)) // _CGV7defaultU0_05_Hv

main() {
}
