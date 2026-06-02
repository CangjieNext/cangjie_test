// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: generate_result.py
// (CJNATIVE) EXEC: %python generate_result.py colorize %n
// (CJNATIVE) EXEC: %compiler %cmp_opt --pgo-instr-gen ./%f -o main
// (CJNATIVE) EXEC: LLVM_PROFILE_FILE="test.profraw" %run_opt main
// (CJNATIVE) EXEC: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CANGJIE_HOME/third_party/llvm/lib $CANGJIE_HOME/third_party/llvm/bin/llvm-profdata merge *.profraw -o test.profdata
//  EXEC-PIPE-0: %compiler %cmp_opt %n test.profdata %n test.profdata -o %output ./%f 2>&1 | compare ./%n.txt

main() {
    return 0
}
