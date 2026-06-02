// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: A
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt A/A.cj -o A.%middle
// (DEBUG_OPTION)EXEC-PIPE:%frontendCompiler %cmp_opt A.%middle %f -o %output --dump-ir 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan _CN1A8sumFloatIG_HRNat5ArrayIG_E
// (not CJNATIVE and DEBUG_OPTION)  ASSERT: scan _ZN1A8sumFloatIC_ZN7default3F64EES_C_ZN7default3F64EE
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan @_CN1A6sumIntIG_HRNat5ArrayIG_E
// (not CJNATIVE and DEBUG_OPTION)  ASSERT: scan _ZN1A6sumIntIC_ZN7default3I64EES_C_ZN7default3I64EE
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan _CN1A10sumNumericIG_HRNat5ArrayIG_E
// (not CJNATIVE and DEBUG_OPTION)  ASSERT: scan _ZN1A10sumNumericIC_ZN7default4M128EES_C_ZN7default4M128EE
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt A.%middle %f -o %output
// (DEBUG_OPTION)EXEC-PIPE: %run %run_opt %output
internal import A.*

// Mangle generic function with different constraints
class I64 <: Integer<I64> {}

class F64 <: Float<F64> {}

class M128 <: Integer<M128> & Float<M128> {}

main() {
    sumInt([I64()])
    sumFloat([F64()])
    sumNumeric([M128()])
    return 0
}
