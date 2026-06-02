/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC and not Windows) EXEC: %compiler %cmp_opt --pgo-instr-gen %f -o %output
// (not Windows and not MAC) RUN-EXEC: %run %run_opt LLVM_PROFILE_FILE=default.profraw && %output %run_args
// (not MAC and not Windows) EXEC: llvm-profdata merge *.profraw -o default.profdata
// (not MAC and not Windows) EXEC: %compiler %cmp_opt --pgo-instr-use=default.profdata --pgo-instr-use=default.profdata %f -o %output
// (not MAC and not Windows) RUN-EXEC: %run %run_opt %output %run_args

main() {
    return 0
}
