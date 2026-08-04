/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: air-blob.cj babylon-blob.cj babylon.cj basic-blob.cj global_type.cj identifier.cj inspector-blob.cj location.cj options.cj parser.cj parserComments.cj whitespace.cj 
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg *.cj -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms


main(){
    BenchMark().run()
}
