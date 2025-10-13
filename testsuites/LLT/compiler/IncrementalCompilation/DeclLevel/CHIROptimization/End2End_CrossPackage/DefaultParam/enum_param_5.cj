// DEPENDENCE: enum_param_4.old.cj enum_param_4.new.cj
// EXEC: %cpfile enum_param_4.new.cj lib.cj
// EXEC: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %f A.%lib_extension -o %output
// EXEC: %cpfile enum_param_4.old.cj lib.cj
// EXEC: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %compile_lib_opt lib.cj -o A.%lib_extension
// EXEC-PIPE-0: %compiler -Woff all %optimization_level_2 %noStackInfo %incrementalCompile %cmp_opt %f A.%lib_extension -o %output 2>&1 | compare %f
// RUN-EXEC-0: %run %run_opt %output %run_args >%redirectNull

internal import inc.*

main() {
    return E.foo()
}
// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan E 3inc1EU lib.cj 3: body 
// ASSERT: scan     changed members 1:
// ASSERT: scan          3inc1EU3fooFl!5param=$$Int64: body 

// ASSERT: scan closure convert out func recompile, roll back to full compilation
// ASSERT: scan incremental compile result kind: rollback

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
