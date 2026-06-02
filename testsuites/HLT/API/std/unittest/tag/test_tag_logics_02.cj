/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench --exclude-tags=Function_Simple_Blank,Function_Simple_Paramized_Blank | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple
// ASSERT: scan func_simple_case_tag_Function_Simple_paramized
// ASSERT: scan-not func_n_simple_case_tag_Function_Simple_Blank
// ASSERT: scan-not func_n_simple_case_tag_Function_Simple_Paramized_Blank

import std.time.*
import std.sync.*

@Test
class Test_Tag_logic {
    @Tag[Function_Simple]
    @Bench
    func func_simple_case_tag_Function_Simple() {
        sleep(Duration.second * 0.1)
    }

    @Tag[Function_Simple_paramized]
    @Configure[minDuration: Duration.second * 2]
    @Bench[str in [ "a", 'b' ] 
]
    func func_simple_case_tag_Function_Simple_paramized(str: String) {
        sleep(Duration.second * 0.1)
    }

    @Tag[Function_Simple_Blank]
    @Bench
    func func_n_simple_case_tag_Function_Simple_Blank() {
        sleep(Duration.second * 0.1)
    }

    @Tag[Function_Simple_Paramized_Blank]
    @Bench[str in [ "a", 'b' ] 
]
    func func_n_simple_case_tag_Function_Simple_Paramized_Blank(str: String) {
        sleep(Duration.second * 0.1)
    }
}
