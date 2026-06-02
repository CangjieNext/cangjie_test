/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: test.cj
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import test.*

enum TimeUnit {
    | Year1(Float32)
    | Month(Float32, (Float32, Float32))
}

let oneYear = TimeUnit.Year1(1.0)

main(): Int64 {
    var result: Float32 = @M(
    match (oneYear) {
      case TimeUnit.Year1(_:Float32) | Month(_,(_: Int64,1.0)) => 1.0
      case _ => 0.0
    }
  )

    if (result == 1.0) {
        return 0
    } else {
        return 1
    }
}
