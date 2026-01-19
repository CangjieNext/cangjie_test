// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c
// EXEC: %clang %clang_shared_opt foo.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan PassInt8ToDataI8: -10
// ASSERT: scan PassInt16ToDataI8: -200
// ASSERT: scan PassInt32ToDataI8: -3000
// ASSERT: scan PassInt64ToDataI8: -40000
// ASSERT: scan PassUInt8ToDataI8: 10
// ASSERT: scan PassUInt16ToDataI8: 200
// ASSERT: scan PassUInt32ToDataI8: 3000
// ASSERT: scan PassUInt64ToDataI8: 40000
// ASSERT: scan PassFloat32ToDataI8: 12.340000
// ASSERT: scan PassFloat64ToDataI8: 56.780000
// ASSERT: scan PassBoolToDataI8: 1
// ASSERT: scan PassInt8ToDataI16: -10
// ASSERT: scan PassInt16ToDataI16: -200
// ASSERT: scan PassInt32ToDataI16: -3000
// ASSERT: scan PassInt64ToDataI16: -40000
// ASSERT: scan PassUInt8ToDataI16: 10
// ASSERT: scan PassUInt16ToDataI16: 200
// ASSERT: scan PassUInt32ToDataI16: 3000
// ASSERT: scan PassUInt64ToDataI16: 40000
// ASSERT: scan PassFloat32ToDataI16: 12.340000
// ASSERT: scan PassFloat64ToDataI16: 56.780000
// ASSERT: scan PassBoolToDataI16: 1
// ASSERT: scan PassInt8ToDataI32: -10
// ASSERT: scan PassInt16ToDataI32: -200
// ASSERT: scan PassInt32ToDataI32: -3000
// ASSERT: scan PassInt64ToDataI32: -40000
// ASSERT: scan PassUInt8ToDataI32: 10
// ASSERT: scan PassUInt16ToDataI32: 200
// ASSERT: scan PassUInt32ToDataI32: 3000
// ASSERT: scan PassUInt64ToDataI32: 40000
// ASSERT: scan PassFloat32ToDataI32: 12.340000
// ASSERT: scan PassFloat64ToDataI32: 56.780000
// ASSERT: scan PassBoolToDataI32: 1
// ASSERT: scan PassInt8ToDataI64: -10
// ASSERT: scan PassInt16ToDataI64: -200
// ASSERT: scan PassInt32ToDataI64: -3000
// ASSERT: scan PassInt64ToDataI64: -40000
// ASSERT: scan PassUInt8ToDataI64: 10
// ASSERT: scan PassUInt16ToDataI64: 200
// ASSERT: scan PassUInt32ToDataI64: 3000
// ASSERT: scan PassUInt64ToDataI64: 40000
// ASSERT: scan PassFloat32ToDataI64: 12.340000
// ASSERT: scan PassFloat64ToDataI64: 56.780000
// ASSERT: scan PassBoolToDataI64: 1
// ASSERT: scan PassInt8ToDataI8I8: -10
// ASSERT: scan PassInt16ToDataI8I8: -200
// ASSERT: scan PassInt32ToDataI8I8: -3000
// ASSERT: scan PassInt64ToDataI8I8: -40000
// ASSERT: scan PassUInt8ToDataI8I8: 10
// ASSERT: scan PassUInt16ToDataI8I8: 200
// ASSERT: scan PassUInt32ToDataI8I8: 3000
// ASSERT: scan PassUInt64ToDataI8I8: 40000
// ASSERT: scan PassFloat32ToDataI8I8: 12.340000
// ASSERT: scan PassFloat64ToDataI8I8: 56.780000
// ASSERT: scan PassBoolToDataI8I8: 1
// ASSERT: scan PassInt8ToDataI16I16: -10
// ASSERT: scan PassInt16ToDataI16I16: -200
// ASSERT: scan PassInt32ToDataI16I16: -3000
// ASSERT: scan PassInt64ToDataI16I16: -40000
// ASSERT: scan PassUInt8ToDataI16I16: 10
// ASSERT: scan PassUInt16ToDataI16I16: 200
// ASSERT: scan PassUInt32ToDataI16I16: 3000
// ASSERT: scan PassUInt64ToDataI16I16: 40000
// ASSERT: scan PassFloat32ToDataI16I16: 12.340000
// ASSERT: scan PassFloat64ToDataI16I16: 56.780000
// ASSERT: scan PassBoolToDataI16I16: 1
// ASSERT: scan PassInt8ToDataI32I32: -10
// ASSERT: scan PassInt16ToDataI32I32: -200
// ASSERT: scan PassInt32ToDataI32I32: -3000
// ASSERT: scan PassInt64ToDataI32I32: -40000
// ASSERT: scan PassUInt8ToDataI32I32: 10
// ASSERT: scan PassUInt16ToDataI32I32: 200
// ASSERT: scan PassUInt32ToDataI32I32: 3000
// ASSERT: scan PassUInt64ToDataI32I32: 40000
// ASSERT: scan PassFloat32ToDataI32I32: 12.340000
// ASSERT: scan PassFloat64ToDataI32I32: 56.780000
// ASSERT: scan PassBoolToDataI32I32: 1
// ASSERT: scan PassInt8ToDataI64I64: -10
// ASSERT: scan PassInt16ToDataI64I64: -200
// ASSERT: scan PassInt32ToDataI64I64: -3000
// ASSERT: scan PassInt64ToDataI64I64: -40000
// ASSERT: scan PassUInt8ToDataI64I64: 10
// ASSERT: scan PassUInt16ToDataI64I64: 200
// ASSERT: scan PassUInt32ToDataI64I64: 3000
// ASSERT: scan PassUInt64ToDataI64I64: 40000
// ASSERT: scan PassFloat32ToDataI64I64: 12.340000
// ASSERT: scan PassFloat64ToDataI64I64: 56.780000
// ASSERT: scan PassBoolToDataI64I64: 1
// ASSERT: scan PassInt8ToDataI8I16: -10
// ASSERT: scan PassInt16ToDataI8I16: -200
// ASSERT: scan PassInt32ToDataI8I16: -3000
// ASSERT: scan PassInt64ToDataI8I16: -40000
// ASSERT: scan PassUInt8ToDataI8I16: 10
// ASSERT: scan PassUInt16ToDataI8I16: 200
// ASSERT: scan PassUInt32ToDataI8I16: 3000
// ASSERT: scan PassUInt64ToDataI8I16: 40000
// ASSERT: scan PassFloat32ToDataI8I16: 12.340000
// ASSERT: scan PassFloat64ToDataI8I16: 56.780000
// ASSERT: scan PassBoolToDataI8I16: 1
// ASSERT: scan PassInt8ToDataI8I32: -10
// ASSERT: scan PassInt16ToDataI8I32: -200
// ASSERT: scan PassInt32ToDataI8I32: -3000
// ASSERT: scan PassInt64ToDataI8I32: -40000
// ASSERT: scan PassUInt8ToDataI8I32: 10
// ASSERT: scan PassUInt16ToDataI8I32: 200
// ASSERT: scan PassUInt32ToDataI8I32: 3000
// ASSERT: scan PassUInt64ToDataI8I32: 40000
// ASSERT: scan PassFloat32ToDataI8I32: 12.340000
// ASSERT: scan PassFloat64ToDataI8I32: 56.780000
// ASSERT: scan PassBoolToDataI8I32: 1
// ASSERT: scan PassInt8ToDataI8I64: -10
// ASSERT: scan PassInt16ToDataI8I64: -200
// ASSERT: scan PassInt32ToDataI8I64: -3000
// ASSERT: scan PassInt64ToDataI8I64: -40000
// ASSERT: scan PassUInt8ToDataI8I64: 10
// ASSERT: scan PassUInt16ToDataI8I64: 200
// ASSERT: scan PassUInt32ToDataI8I64: 3000
// ASSERT: scan PassUInt64ToDataI8I64: 40000
// ASSERT: scan PassFloat32ToDataI8I64: 12.340000
// ASSERT: scan PassFloat64ToDataI8I64: 56.780000
// ASSERT: scan PassBoolToDataI8I64: 1
// ASSERT: scan PassInt8ToDataI16I32: -10
// ASSERT: scan PassInt16ToDataI16I32: -200
// ASSERT: scan PassInt32ToDataI16I32: -3000
// ASSERT: scan PassInt64ToDataI16I32: -40000
// ASSERT: scan PassUInt8ToDataI16I32: 10
// ASSERT: scan PassUInt16ToDataI16I32: 200
// ASSERT: scan PassUInt32ToDataI16I32: 3000
// ASSERT: scan PassUInt64ToDataI16I32: 40000
// ASSERT: scan PassFloat32ToDataI16I32: 12.340000
// ASSERT: scan PassFloat64ToDataI16I32: 56.780000
// ASSERT: scan PassBoolToDataI16I32: 1
// ASSERT: scan PassInt8ToDataI16I64: -10
// ASSERT: scan PassInt16ToDataI16I64: -200
// ASSERT: scan PassInt32ToDataI16I64: -3000
// ASSERT: scan PassInt64ToDataI16I64: -40000
// ASSERT: scan PassUInt8ToDataI16I64: 10
// ASSERT: scan PassUInt16ToDataI16I64: 200
// ASSERT: scan PassUInt32ToDataI16I64: 3000
// ASSERT: scan PassUInt64ToDataI16I64: 40000
// ASSERT: scan PassFloat32ToDataI16I64: 12.340000
// ASSERT: scan PassFloat64ToDataI16I64: 56.780000
// ASSERT: scan PassBoolToDataI16I64: 1
// ASSERT: scan PassInt8ToDataI32I64: -10
// ASSERT: scan PassInt16ToDataI32I64: -200
// ASSERT: scan PassInt32ToDataI32I64: -3000
// ASSERT: scan PassInt64ToDataI32I64: -40000
// ASSERT: scan PassUInt8ToDataI32I64: 10
// ASSERT: scan PassUInt16ToDataI32I64: 200
// ASSERT: scan PassUInt32ToDataI32I64: 3000
// ASSERT: scan PassUInt64ToDataI32I64: 40000
// ASSERT: scan PassFloat32ToDataI32I64: 12.340000
// ASSERT: scan PassFloat64ToDataI32I64: 56.780000
// ASSERT: scan PassBoolToDataI32I64: 1
// ASSERT: scan PassInt8ToDataI8I8I8: -10
// ASSERT: scan PassInt16ToDataI8I8I8: -200
// ASSERT: scan PassInt32ToDataI8I8I8: -3000
// ASSERT: scan PassInt64ToDataI8I8I8: -40000
// ASSERT: scan PassUInt8ToDataI8I8I8: 10
// ASSERT: scan PassUInt16ToDataI8I8I8: 200
// ASSERT: scan PassUInt32ToDataI8I8I8: 3000
// ASSERT: scan PassUInt64ToDataI8I8I8: 40000
// ASSERT: scan PassFloat32ToDataI8I8I8: 12.340000
// ASSERT: scan PassFloat64ToDataI8I8I8: 56.780000
// ASSERT: scan PassBoolToDataI8I8I8: 1
// ASSERT: scan PassInt8ToDataI16I16I16: -10
// ASSERT: scan PassInt16ToDataI16I16I16: -200
// ASSERT: scan PassInt32ToDataI16I16I16: -3000
// ASSERT: scan PassInt64ToDataI16I16I16: -40000
// ASSERT: scan PassUInt8ToDataI16I16I16: 10
// ASSERT: scan PassUInt16ToDataI16I16I16: 200
// ASSERT: scan PassUInt32ToDataI16I16I16: 3000
// ASSERT: scan PassUInt64ToDataI16I16I16: 40000
// ASSERT: scan PassFloat32ToDataI16I16I16: 12.340000
// ASSERT: scan PassFloat64ToDataI16I16I16: 56.780000
// ASSERT: scan PassBoolToDataI16I16I16: 1
// ASSERT: scan PassInt8ToDataI32I32I32: -10
// ASSERT: scan PassInt16ToDataI32I32I32: -200
// ASSERT: scan PassInt32ToDataI32I32I32: -3000
// ASSERT: scan PassInt64ToDataI32I32I32: -40000
// ASSERT: scan PassUInt8ToDataI32I32I32: 10
// ASSERT: scan PassUInt16ToDataI32I32I32: 200
// ASSERT: scan PassUInt32ToDataI32I32I32: 3000
// ASSERT: scan PassUInt64ToDataI32I32I32: 40000
// ASSERT: scan PassFloat32ToDataI32I32I32: 12.340000
// ASSERT: scan PassFloat64ToDataI32I32I32: 56.780000
// ASSERT: scan PassBoolToDataI32I32I32: 1
// ASSERT: scan PassInt8ToDataI64I64I64: -10
// ASSERT: scan PassInt16ToDataI64I64I64: -200
// ASSERT: scan PassInt32ToDataI64I64I64: -3000
// ASSERT: scan PassInt64ToDataI64I64I64: -40000
// ASSERT: scan PassUInt8ToDataI64I64I64: 10
// ASSERT: scan PassUInt16ToDataI64I64I64: 200
// ASSERT: scan PassUInt32ToDataI64I64I64: 3000
// ASSERT: scan PassUInt64ToDataI64I64I64: 40000
// ASSERT: scan PassFloat32ToDataI64I64I64: 12.340000
// ASSERT: scan PassFloat64ToDataI64I64I64: 56.780000
// ASSERT: scan PassBoolToDataI64I64I64: 1
// ASSERT: scan PassInt8ToDataI8I8I8I8: -10
// ASSERT: scan PassInt16ToDataI8I8I8I8: -200
// ASSERT: scan PassInt32ToDataI8I8I8I8: -3000
// ASSERT: scan PassInt64ToDataI8I8I8I8: -40000
// ASSERT: scan PassUInt8ToDataI8I8I8I8: 10
// ASSERT: scan PassUInt16ToDataI8I8I8I8: 200
// ASSERT: scan PassUInt32ToDataI8I8I8I8: 3000
// ASSERT: scan PassUInt64ToDataI8I8I8I8: 40000
// ASSERT: scan PassFloat32ToDataI8I8I8I8: 12.340000
// ASSERT: scan PassFloat64ToDataI8I8I8I8: 56.780000
// ASSERT: scan PassBoolToDataI8I8I8I8: 1
// ASSERT: scan PassInt8ToDataI16I16I16I16: -10
// ASSERT: scan PassInt16ToDataI16I16I16I16: -200
// ASSERT: scan PassInt32ToDataI16I16I16I16: -3000
// ASSERT: scan PassInt64ToDataI16I16I16I16: -40000
// ASSERT: scan PassUInt8ToDataI16I16I16I16: 10
// ASSERT: scan PassUInt16ToDataI16I16I16I16: 200
// ASSERT: scan PassUInt32ToDataI16I16I16I16: 3000
// ASSERT: scan PassUInt64ToDataI16I16I16I16: 40000
// ASSERT: scan PassFloat32ToDataI16I16I16I16: 12.340000
// ASSERT: scan PassFloat64ToDataI16I16I16I16: 56.780000
// ASSERT: scan PassBoolToDataI16I16I16I16: 1
// ASSERT: scan PassInt8ToDataI32I32I32I32: -10
// ASSERT: scan PassInt16ToDataI32I32I32I32: -200
// ASSERT: scan PassInt32ToDataI32I32I32I32: -3000
// ASSERT: scan PassInt64ToDataI32I32I32I32: -40000
// ASSERT: scan PassUInt8ToDataI32I32I32I32: 10
// ASSERT: scan PassUInt16ToDataI32I32I32I32: 200
// ASSERT: scan PassUInt32ToDataI32I32I32I32: 3000
// ASSERT: scan PassUInt64ToDataI32I32I32I32: 40000
// ASSERT: scan PassFloat32ToDataI32I32I32I32: 12.340000
// ASSERT: scan PassFloat64ToDataI32I32I32I32: 56.780000
// ASSERT: scan PassBoolToDataI32I32I32I32: 1
// ASSERT: scan PassInt8ToDataI64I64I64I64: -10
// ASSERT: scan PassInt16ToDataI64I64I64I64: -200
// ASSERT: scan PassInt32ToDataI64I64I64I64: -3000
// ASSERT: scan PassInt64ToDataI64I64I64I64: -40000
// ASSERT: scan PassUInt8ToDataI64I64I64I64: 10
// ASSERT: scan PassUInt16ToDataI64I64I64I64: 200
// ASSERT: scan PassUInt32ToDataI64I64I64I64: 3000
// ASSERT: scan PassUInt64ToDataI64I64I64I64: 40000
// ASSERT: scan PassFloat32ToDataI64I64I64I64: 12.340000
// ASSERT: scan PassFloat64ToDataI64I64I64I64: 56.780000
// ASSERT: scan PassBoolToDataI64I64I64I64: 1
// ASSERT: scan PassInt8ToDataF32: -10
// ASSERT: scan PassInt16ToDataF32: -200
// ASSERT: scan PassInt32ToDataF32: -3000
// ASSERT: scan PassInt64ToDataF32: -40000
// ASSERT: scan PassUInt8ToDataF32: 10
// ASSERT: scan PassUInt16ToDataF32: 200
// ASSERT: scan PassUInt32ToDataF32: 3000
// ASSERT: scan PassUInt64ToDataF32: 40000
// ASSERT: scan PassFloat32ToDataF32: 12.340000
// ASSERT: scan PassFloat64ToDataF32: 56.780000
// ASSERT: scan PassBoolToDataF32: 1
// ASSERT: scan PassInt8ToDataF64: -10
// ASSERT: scan PassInt16ToDataF64: -200
// ASSERT: scan PassInt32ToDataF64: -3000
// ASSERT: scan PassInt64ToDataF64: -40000
// ASSERT: scan PassUInt8ToDataF64: 10
// ASSERT: scan PassUInt16ToDataF64: 200
// ASSERT: scan PassUInt32ToDataF64: 3000
// ASSERT: scan PassUInt64ToDataF64: 40000
// ASSERT: scan PassFloat32ToDataF64: 12.340000
// ASSERT: scan PassFloat64ToDataF64: 56.780000
// ASSERT: scan PassBoolToDataF64: 1
// ASSERT: scan PassInt8ToDataF32F32: -10
// ASSERT: scan PassInt16ToDataF32F32: -200
// ASSERT: scan PassInt32ToDataF32F32: -3000
// ASSERT: scan PassInt64ToDataF32F32: -40000
// ASSERT: scan PassUInt8ToDataF32F32: 10
// ASSERT: scan PassUInt16ToDataF32F32: 200
// ASSERT: scan PassUInt32ToDataF32F32: 3000
// ASSERT: scan PassUInt64ToDataF32F32: 40000
// ASSERT: scan PassFloat32ToDataF32F32: 12.340000
// ASSERT: scan PassFloat64ToDataF32F32: 56.780000
// ASSERT: scan PassBoolToDataF32F32: 1
// ASSERT: scan PassInt8ToDataF64F64: -10
// ASSERT: scan PassInt16ToDataF64F64: -200
// ASSERT: scan PassInt32ToDataF64F64: -3000
// ASSERT: scan PassInt64ToDataF64F64: -40000
// ASSERT: scan PassUInt8ToDataF64F64: 10
// ASSERT: scan PassUInt16ToDataF64F64: 200
// ASSERT: scan PassUInt32ToDataF64F64: 3000
// ASSERT: scan PassUInt64ToDataF64F64: 40000
// ASSERT: scan PassFloat32ToDataF64F64: 12.340000
// ASSERT: scan PassFloat64ToDataF64F64: 56.780000
// ASSERT: scan PassBoolToDataF64F64: 1
// ASSERT: scan PassInt8ToDataF32F32F32: -10
// ASSERT: scan PassInt16ToDataF32F32F32: -200
// ASSERT: scan PassInt32ToDataF32F32F32: -3000
// ASSERT: scan PassInt64ToDataF32F32F32: -40000
// ASSERT: scan PassUInt8ToDataF32F32F32: 10
// ASSERT: scan PassUInt16ToDataF32F32F32: 200
// ASSERT: scan PassUInt32ToDataF32F32F32: 3000
// ASSERT: scan PassUInt64ToDataF32F32F32: 40000
// ASSERT: scan PassFloat32ToDataF32F32F32: 12.340000
// ASSERT: scan PassFloat64ToDataF32F32F32: 56.780000
// ASSERT: scan PassBoolToDataF32F32F32: 1
// ASSERT: scan PassInt8ToDataF64F64F64: -10
// ASSERT: scan PassInt16ToDataF64F64F64: -200
// ASSERT: scan PassInt32ToDataF64F64F64: -3000
// ASSERT: scan PassInt64ToDataF64F64F64: -40000
// ASSERT: scan PassUInt8ToDataF64F64F64: 10
// ASSERT: scan PassUInt16ToDataF64F64F64: 200
// ASSERT: scan PassUInt32ToDataF64F64F64: 3000
// ASSERT: scan PassUInt64ToDataF64F64F64: 40000
// ASSERT: scan PassFloat32ToDataF64F64F64: 12.340000
// ASSERT: scan PassFloat64ToDataF64F64F64: 56.780000
// ASSERT: scan PassBoolToDataF64F64F64: 1
// ASSERT: scan PassInt8ToDataF32F32F32F32: -10
// ASSERT: scan PassInt16ToDataF32F32F32F32: -200
// ASSERT: scan PassInt32ToDataF32F32F32F32: -3000
// ASSERT: scan PassInt64ToDataF32F32F32F32: -40000
// ASSERT: scan PassUInt8ToDataF32F32F32F32: 10
// ASSERT: scan PassUInt16ToDataF32F32F32F32: 200
// ASSERT: scan PassUInt32ToDataF32F32F32F32: 3000
// ASSERT: scan PassUInt64ToDataF32F32F32F32: 40000
// ASSERT: scan PassFloat32ToDataF32F32F32F32: 12.340000
// ASSERT: scan PassFloat64ToDataF32F32F32F32: 56.780000
// ASSERT: scan PassBoolToDataF32F32F32F32: 1
// ASSERT: scan PassInt8ToDataF32F32F32F32F32: -10
// ASSERT: scan PassInt16ToDataF32F32F32F32F32: -200
// ASSERT: scan PassInt32ToDataF32F32F32F32F32: -3000
// ASSERT: scan PassInt64ToDataF32F32F32F32F32: -40000
// ASSERT: scan PassUInt8ToDataF32F32F32F32F32: 10
// ASSERT: scan PassUInt16ToDataF32F32F32F32F32: 200
// ASSERT: scan PassUInt32ToDataF32F32F32F32F32: 3000
// ASSERT: scan PassUInt64ToDataF32F32F32F32F32: 40000
// ASSERT: scan PassFloat32ToDataF32F32F32F32F32: 12.340000
// ASSERT: scan PassFloat64ToDataF32F32F32F32F32: 56.780000
// ASSERT: scan PassBoolToDataF32F32F32F32F32: 1
// ASSERT: scan PassInt8ToDataI8F32: -10
// ASSERT: scan PassInt16ToDataI8F32: -200
// ASSERT: scan PassInt32ToDataI8F32: -3000
// ASSERT: scan PassInt64ToDataI8F32: -40000
// ASSERT: scan PassUInt8ToDataI8F32: 10
// ASSERT: scan PassUInt16ToDataI8F32: 200
// ASSERT: scan PassUInt32ToDataI8F32: 3000
// ASSERT: scan PassUInt64ToDataI8F32: 40000
// ASSERT: scan PassFloat32ToDataI8F32: 12.340000
// ASSERT: scan PassFloat64ToDataI8F32: 56.780000
// ASSERT: scan PassBoolToDataI8F32: 1
// ASSERT: scan PassInt8ToDataI32F32: -10
// ASSERT: scan PassInt16ToDataI32F32: -200
// ASSERT: scan PassInt32ToDataI32F32: -3000
// ASSERT: scan PassInt64ToDataI32F32: -40000
// ASSERT: scan PassUInt8ToDataI32F32: 10
// ASSERT: scan PassUInt16ToDataI32F32: 200
// ASSERT: scan PassUInt32ToDataI32F32: 3000
// ASSERT: scan PassUInt64ToDataI32F32: 40000
// ASSERT: scan PassFloat32ToDataI32F32: 12.340000
// ASSERT: scan PassFloat64ToDataI32F32: 56.780000
// ASSERT: scan PassBoolToDataI32F32: 1
// ASSERT: scan PassInt8ToDataI8F64: -10
// ASSERT: scan PassInt16ToDataI8F64: -200
// ASSERT: scan PassInt32ToDataI8F64: -3000
// ASSERT: scan PassInt64ToDataI8F64: -40000
// ASSERT: scan PassUInt8ToDataI8F64: 10
// ASSERT: scan PassUInt16ToDataI8F64: 200
// ASSERT: scan PassUInt32ToDataI8F64: 3000
// ASSERT: scan PassUInt64ToDataI8F64: 40000
// ASSERT: scan PassFloat32ToDataI8F64: 12.340000
// ASSERT: scan PassFloat64ToDataI8F64: 56.780000
// ASSERT: scan PassBoolToDataI8F64: 1
// ASSERT: scan PassInt8ToDataI32F64: -10
// ASSERT: scan PassInt16ToDataI32F64: -200
// ASSERT: scan PassInt32ToDataI32F64: -3000
// ASSERT: scan PassInt64ToDataI32F64: -40000
// ASSERT: scan PassUInt8ToDataI32F64: 10
// ASSERT: scan PassUInt16ToDataI32F64: 200
// ASSERT: scan PassUInt32ToDataI32F64: 3000
// ASSERT: scan PassUInt64ToDataI32F64: 40000
// ASSERT: scan PassFloat32ToDataI32F64: 12.340000
// ASSERT: scan PassFloat64ToDataI32F64: 56.780000
// ASSERT: scan PassBoolToDataI32F64: 1
// ASSERT: scan PassInt8ToDataI8F32I8F32: -10
// ASSERT: scan PassInt16ToDataI8F32I8F32: -200
// ASSERT: scan PassInt32ToDataI8F32I8F32: -3000
// ASSERT: scan PassInt64ToDataI8F32I8F32: -40000
// ASSERT: scan PassUInt8ToDataI8F32I8F32: 10
// ASSERT: scan PassUInt16ToDataI8F32I8F32: 200
// ASSERT: scan PassUInt32ToDataI8F32I8F32: 3000
// ASSERT: scan PassUInt64ToDataI8F32I8F32: 40000
// ASSERT: scan PassFloat32ToDataI8F32I8F32: 12.340000
// ASSERT: scan PassFloat64ToDataI8F32I8F32: 56.780000
// ASSERT: scan PassBoolToDataI8F32I8F32: 1
// ASSERT: scan PassInt8ToDataI32F32I32F32: -10
// ASSERT: scan PassInt16ToDataI32F32I32F32: -200
// ASSERT: scan PassInt32ToDataI32F32I32F32: -3000
// ASSERT: scan PassInt64ToDataI32F32I32F32: -40000
// ASSERT: scan PassUInt8ToDataI32F32I32F32: 10
// ASSERT: scan PassUInt16ToDataI32F32I32F32: 200
// ASSERT: scan PassUInt32ToDataI32F32I32F32: 3000
// ASSERT: scan PassUInt64ToDataI32F32I32F32: 40000
// ASSERT: scan PassFloat32ToDataI32F32I32F32: 12.340000
// ASSERT: scan PassFloat64ToDataI32F32I32F32: 56.780000
// ASSERT: scan PassBoolToDataI32F32I32F32: 1
// ASSERT: scan PassInt8ToDataI8F64I8F64: -10
// ASSERT: scan PassInt16ToDataI8F64I8F64: -200
// ASSERT: scan PassInt32ToDataI8F64I8F64: -3000
// ASSERT: scan PassInt64ToDataI8F64I8F64: -40000
// ASSERT: scan PassUInt8ToDataI8F64I8F64: 10
// ASSERT: scan PassUInt16ToDataI8F64I8F64: 200
// ASSERT: scan PassUInt32ToDataI8F64I8F64: 3000
// ASSERT: scan PassUInt64ToDataI8F64I8F64: 40000
// ASSERT: scan PassFloat32ToDataI8F64I8F64: 12.340000
// ASSERT: scan PassFloat64ToDataI8F64I8F64: 56.780000
// ASSERT: scan PassBoolToDataI8F64I8F64: 1
// ASSERT: scan PassInt8ToDataI32F64I32F64: -10
// ASSERT: scan PassInt16ToDataI32F64I32F64: -200
// ASSERT: scan PassInt32ToDataI32F64I32F64: -3000
// ASSERT: scan PassInt64ToDataI32F64I32F64: -40000
// ASSERT: scan PassUInt8ToDataI32F64I32F64: 10
// ASSERT: scan PassUInt16ToDataI32F64I32F64: 200
// ASSERT: scan PassUInt32ToDataI32F64I32F64: 3000
// ASSERT: scan PassUInt64ToDataI32F64I32F64: 40000
// ASSERT: scan PassFloat32ToDataI32F64I32F64: 12.340000
// ASSERT: scan PassFloat64ToDataI32F64I32F64: 56.780000
// ASSERT: scan PassBoolToDataI32F64I32F64: 1

foreign func PassInt8ToDataI8(v: Int8): DataI8
foreign func PassInt16ToDataI8(v: Int16): DataI8
foreign func PassInt32ToDataI8(v: Int32): DataI8
foreign func PassInt64ToDataI8(v: Int64): DataI8
foreign func PassUInt8ToDataI8(v: UInt8): DataI8
foreign func PassUInt16ToDataI8(v: UInt16): DataI8
foreign func PassUInt32ToDataI8(v: UInt32): DataI8
foreign func PassUInt64ToDataI8(v: UInt64): DataI8
foreign func PassFloat32ToDataI8(v: Float32): DataI8
foreign func PassFloat64ToDataI8(v: Float64): DataI8
foreign func PassBoolToDataI8(v: Bool): DataI8
foreign func PassInt8ToDataI16(v: Int8): DataI16
foreign func PassInt16ToDataI16(v: Int16): DataI16
foreign func PassInt32ToDataI16(v: Int32): DataI16
foreign func PassInt64ToDataI16(v: Int64): DataI16
foreign func PassUInt8ToDataI16(v: UInt8): DataI16
foreign func PassUInt16ToDataI16(v: UInt16): DataI16
foreign func PassUInt32ToDataI16(v: UInt32): DataI16
foreign func PassUInt64ToDataI16(v: UInt64): DataI16
foreign func PassFloat32ToDataI16(v: Float32): DataI16
foreign func PassFloat64ToDataI16(v: Float64): DataI16
foreign func PassBoolToDataI16(v: Bool): DataI16
foreign func PassInt8ToDataI32(v: Int8): DataI32
foreign func PassInt16ToDataI32(v: Int16): DataI32
foreign func PassInt32ToDataI32(v: Int32): DataI32
foreign func PassInt64ToDataI32(v: Int64): DataI32
foreign func PassUInt8ToDataI32(v: UInt8): DataI32
foreign func PassUInt16ToDataI32(v: UInt16): DataI32
foreign func PassUInt32ToDataI32(v: UInt32): DataI32
foreign func PassUInt64ToDataI32(v: UInt64): DataI32
foreign func PassFloat32ToDataI32(v: Float32): DataI32
foreign func PassFloat64ToDataI32(v: Float64): DataI32
foreign func PassBoolToDataI32(v: Bool): DataI32
foreign func PassInt8ToDataI64(v: Int8): DataI64
foreign func PassInt16ToDataI64(v: Int16): DataI64
foreign func PassInt32ToDataI64(v: Int32): DataI64
foreign func PassInt64ToDataI64(v: Int64): DataI64
foreign func PassUInt8ToDataI64(v: UInt8): DataI64
foreign func PassUInt16ToDataI64(v: UInt16): DataI64
foreign func PassUInt32ToDataI64(v: UInt32): DataI64
foreign func PassUInt64ToDataI64(v: UInt64): DataI64
foreign func PassFloat32ToDataI64(v: Float32): DataI64
foreign func PassFloat64ToDataI64(v: Float64): DataI64
foreign func PassBoolToDataI64(v: Bool): DataI64
foreign func PassInt8ToDataI8I8(v: Int8): DataI8I8
foreign func PassInt16ToDataI8I8(v: Int16): DataI8I8
foreign func PassInt32ToDataI8I8(v: Int32): DataI8I8
foreign func PassInt64ToDataI8I8(v: Int64): DataI8I8
foreign func PassUInt8ToDataI8I8(v: UInt8): DataI8I8
foreign func PassUInt16ToDataI8I8(v: UInt16): DataI8I8
foreign func PassUInt32ToDataI8I8(v: UInt32): DataI8I8
foreign func PassUInt64ToDataI8I8(v: UInt64): DataI8I8
foreign func PassFloat32ToDataI8I8(v: Float32): DataI8I8
foreign func PassFloat64ToDataI8I8(v: Float64): DataI8I8
foreign func PassBoolToDataI8I8(v: Bool): DataI8I8
foreign func PassInt8ToDataI16I16(v: Int8): DataI16I16
foreign func PassInt16ToDataI16I16(v: Int16): DataI16I16
foreign func PassInt32ToDataI16I16(v: Int32): DataI16I16
foreign func PassInt64ToDataI16I16(v: Int64): DataI16I16
foreign func PassUInt8ToDataI16I16(v: UInt8): DataI16I16
foreign func PassUInt16ToDataI16I16(v: UInt16): DataI16I16
foreign func PassUInt32ToDataI16I16(v: UInt32): DataI16I16
foreign func PassUInt64ToDataI16I16(v: UInt64): DataI16I16
foreign func PassFloat32ToDataI16I16(v: Float32): DataI16I16
foreign func PassFloat64ToDataI16I16(v: Float64): DataI16I16
foreign func PassBoolToDataI16I16(v: Bool): DataI16I16
foreign func PassInt8ToDataI32I32(v: Int8): DataI32I32
foreign func PassInt16ToDataI32I32(v: Int16): DataI32I32
foreign func PassInt32ToDataI32I32(v: Int32): DataI32I32
foreign func PassInt64ToDataI32I32(v: Int64): DataI32I32
foreign func PassUInt8ToDataI32I32(v: UInt8): DataI32I32
foreign func PassUInt16ToDataI32I32(v: UInt16): DataI32I32
foreign func PassUInt32ToDataI32I32(v: UInt32): DataI32I32
foreign func PassUInt64ToDataI32I32(v: UInt64): DataI32I32
foreign func PassFloat32ToDataI32I32(v: Float32): DataI32I32
foreign func PassFloat64ToDataI32I32(v: Float64): DataI32I32
foreign func PassBoolToDataI32I32(v: Bool): DataI32I32
foreign func PassInt8ToDataI64I64(v: Int8): DataI64I64
foreign func PassInt16ToDataI64I64(v: Int16): DataI64I64
foreign func PassInt32ToDataI64I64(v: Int32): DataI64I64
foreign func PassInt64ToDataI64I64(v: Int64): DataI64I64
foreign func PassUInt8ToDataI64I64(v: UInt8): DataI64I64
foreign func PassUInt16ToDataI64I64(v: UInt16): DataI64I64
foreign func PassUInt32ToDataI64I64(v: UInt32): DataI64I64
foreign func PassUInt64ToDataI64I64(v: UInt64): DataI64I64
foreign func PassFloat32ToDataI64I64(v: Float32): DataI64I64
foreign func PassFloat64ToDataI64I64(v: Float64): DataI64I64
foreign func PassBoolToDataI64I64(v: Bool): DataI64I64
foreign func PassInt8ToDataI8I16(v: Int8): DataI8I16
foreign func PassInt16ToDataI8I16(v: Int16): DataI8I16
foreign func PassInt32ToDataI8I16(v: Int32): DataI8I16
foreign func PassInt64ToDataI8I16(v: Int64): DataI8I16
foreign func PassUInt8ToDataI8I16(v: UInt8): DataI8I16
foreign func PassUInt16ToDataI8I16(v: UInt16): DataI8I16
foreign func PassUInt32ToDataI8I16(v: UInt32): DataI8I16
foreign func PassUInt64ToDataI8I16(v: UInt64): DataI8I16
foreign func PassFloat32ToDataI8I16(v: Float32): DataI8I16
foreign func PassFloat64ToDataI8I16(v: Float64): DataI8I16
foreign func PassBoolToDataI8I16(v: Bool): DataI8I16
foreign func PassInt8ToDataI8I32(v: Int8): DataI8I32
foreign func PassInt16ToDataI8I32(v: Int16): DataI8I32
foreign func PassInt32ToDataI8I32(v: Int32): DataI8I32
foreign func PassInt64ToDataI8I32(v: Int64): DataI8I32
foreign func PassUInt8ToDataI8I32(v: UInt8): DataI8I32
foreign func PassUInt16ToDataI8I32(v: UInt16): DataI8I32
foreign func PassUInt32ToDataI8I32(v: UInt32): DataI8I32
foreign func PassUInt64ToDataI8I32(v: UInt64): DataI8I32
foreign func PassFloat32ToDataI8I32(v: Float32): DataI8I32
foreign func PassFloat64ToDataI8I32(v: Float64): DataI8I32
foreign func PassBoolToDataI8I32(v: Bool): DataI8I32
foreign func PassInt8ToDataI8I64(v: Int8): DataI8I64
foreign func PassInt16ToDataI8I64(v: Int16): DataI8I64
foreign func PassInt32ToDataI8I64(v: Int32): DataI8I64
foreign func PassInt64ToDataI8I64(v: Int64): DataI8I64
foreign func PassUInt8ToDataI8I64(v: UInt8): DataI8I64
foreign func PassUInt16ToDataI8I64(v: UInt16): DataI8I64
foreign func PassUInt32ToDataI8I64(v: UInt32): DataI8I64
foreign func PassUInt64ToDataI8I64(v: UInt64): DataI8I64
foreign func PassFloat32ToDataI8I64(v: Float32): DataI8I64
foreign func PassFloat64ToDataI8I64(v: Float64): DataI8I64
foreign func PassBoolToDataI8I64(v: Bool): DataI8I64
foreign func PassInt8ToDataI16I32(v: Int8): DataI16I32
foreign func PassInt16ToDataI16I32(v: Int16): DataI16I32
foreign func PassInt32ToDataI16I32(v: Int32): DataI16I32
foreign func PassInt64ToDataI16I32(v: Int64): DataI16I32
foreign func PassUInt8ToDataI16I32(v: UInt8): DataI16I32
foreign func PassUInt16ToDataI16I32(v: UInt16): DataI16I32
foreign func PassUInt32ToDataI16I32(v: UInt32): DataI16I32
foreign func PassUInt64ToDataI16I32(v: UInt64): DataI16I32
foreign func PassFloat32ToDataI16I32(v: Float32): DataI16I32
foreign func PassFloat64ToDataI16I32(v: Float64): DataI16I32
foreign func PassBoolToDataI16I32(v: Bool): DataI16I32
foreign func PassInt8ToDataI16I64(v: Int8): DataI16I64
foreign func PassInt16ToDataI16I64(v: Int16): DataI16I64
foreign func PassInt32ToDataI16I64(v: Int32): DataI16I64
foreign func PassInt64ToDataI16I64(v: Int64): DataI16I64
foreign func PassUInt8ToDataI16I64(v: UInt8): DataI16I64
foreign func PassUInt16ToDataI16I64(v: UInt16): DataI16I64
foreign func PassUInt32ToDataI16I64(v: UInt32): DataI16I64
foreign func PassUInt64ToDataI16I64(v: UInt64): DataI16I64
foreign func PassFloat32ToDataI16I64(v: Float32): DataI16I64
foreign func PassFloat64ToDataI16I64(v: Float64): DataI16I64
foreign func PassBoolToDataI16I64(v: Bool): DataI16I64
foreign func PassInt8ToDataI32I64(v: Int8): DataI32I64
foreign func PassInt16ToDataI32I64(v: Int16): DataI32I64
foreign func PassInt32ToDataI32I64(v: Int32): DataI32I64
foreign func PassInt64ToDataI32I64(v: Int64): DataI32I64
foreign func PassUInt8ToDataI32I64(v: UInt8): DataI32I64
foreign func PassUInt16ToDataI32I64(v: UInt16): DataI32I64
foreign func PassUInt32ToDataI32I64(v: UInt32): DataI32I64
foreign func PassUInt64ToDataI32I64(v: UInt64): DataI32I64
foreign func PassFloat32ToDataI32I64(v: Float32): DataI32I64
foreign func PassFloat64ToDataI32I64(v: Float64): DataI32I64
foreign func PassBoolToDataI32I64(v: Bool): DataI32I64
foreign func PassInt8ToDataI8I8I8(v: Int8): DataI8I8I8
foreign func PassInt16ToDataI8I8I8(v: Int16): DataI8I8I8
foreign func PassInt32ToDataI8I8I8(v: Int32): DataI8I8I8
foreign func PassInt64ToDataI8I8I8(v: Int64): DataI8I8I8
foreign func PassUInt8ToDataI8I8I8(v: UInt8): DataI8I8I8
foreign func PassUInt16ToDataI8I8I8(v: UInt16): DataI8I8I8
foreign func PassUInt32ToDataI8I8I8(v: UInt32): DataI8I8I8
foreign func PassUInt64ToDataI8I8I8(v: UInt64): DataI8I8I8
foreign func PassFloat32ToDataI8I8I8(v: Float32): DataI8I8I8
foreign func PassFloat64ToDataI8I8I8(v: Float64): DataI8I8I8
foreign func PassBoolToDataI8I8I8(v: Bool): DataI8I8I8
foreign func PassInt8ToDataI16I16I16(v: Int8): DataI16I16I16
foreign func PassInt16ToDataI16I16I16(v: Int16): DataI16I16I16
foreign func PassInt32ToDataI16I16I16(v: Int32): DataI16I16I16
foreign func PassInt64ToDataI16I16I16(v: Int64): DataI16I16I16
foreign func PassUInt8ToDataI16I16I16(v: UInt8): DataI16I16I16
foreign func PassUInt16ToDataI16I16I16(v: UInt16): DataI16I16I16
foreign func PassUInt32ToDataI16I16I16(v: UInt32): DataI16I16I16
foreign func PassUInt64ToDataI16I16I16(v: UInt64): DataI16I16I16
foreign func PassFloat32ToDataI16I16I16(v: Float32): DataI16I16I16
foreign func PassFloat64ToDataI16I16I16(v: Float64): DataI16I16I16
foreign func PassBoolToDataI16I16I16(v: Bool): DataI16I16I16
foreign func PassInt8ToDataI32I32I32(v: Int8): DataI32I32I32
foreign func PassInt16ToDataI32I32I32(v: Int16): DataI32I32I32
foreign func PassInt32ToDataI32I32I32(v: Int32): DataI32I32I32
foreign func PassInt64ToDataI32I32I32(v: Int64): DataI32I32I32
foreign func PassUInt8ToDataI32I32I32(v: UInt8): DataI32I32I32
foreign func PassUInt16ToDataI32I32I32(v: UInt16): DataI32I32I32
foreign func PassUInt32ToDataI32I32I32(v: UInt32): DataI32I32I32
foreign func PassUInt64ToDataI32I32I32(v: UInt64): DataI32I32I32
foreign func PassFloat32ToDataI32I32I32(v: Float32): DataI32I32I32
foreign func PassFloat64ToDataI32I32I32(v: Float64): DataI32I32I32
foreign func PassBoolToDataI32I32I32(v: Bool): DataI32I32I32
foreign func PassInt8ToDataI64I64I64(v: Int8): DataI64I64I64
foreign func PassInt16ToDataI64I64I64(v: Int16): DataI64I64I64
foreign func PassInt32ToDataI64I64I64(v: Int32): DataI64I64I64
foreign func PassInt64ToDataI64I64I64(v: Int64): DataI64I64I64
foreign func PassUInt8ToDataI64I64I64(v: UInt8): DataI64I64I64
foreign func PassUInt16ToDataI64I64I64(v: UInt16): DataI64I64I64
foreign func PassUInt32ToDataI64I64I64(v: UInt32): DataI64I64I64
foreign func PassUInt64ToDataI64I64I64(v: UInt64): DataI64I64I64
foreign func PassFloat32ToDataI64I64I64(v: Float32): DataI64I64I64
foreign func PassFloat64ToDataI64I64I64(v: Float64): DataI64I64I64
foreign func PassBoolToDataI64I64I64(v: Bool): DataI64I64I64
foreign func PassInt8ToDataI8I8I8I8(v: Int8): DataI8I8I8I8
foreign func PassInt16ToDataI8I8I8I8(v: Int16): DataI8I8I8I8
foreign func PassInt32ToDataI8I8I8I8(v: Int32): DataI8I8I8I8
foreign func PassInt64ToDataI8I8I8I8(v: Int64): DataI8I8I8I8
foreign func PassUInt8ToDataI8I8I8I8(v: UInt8): DataI8I8I8I8
foreign func PassUInt16ToDataI8I8I8I8(v: UInt16): DataI8I8I8I8
foreign func PassUInt32ToDataI8I8I8I8(v: UInt32): DataI8I8I8I8
foreign func PassUInt64ToDataI8I8I8I8(v: UInt64): DataI8I8I8I8
foreign func PassFloat32ToDataI8I8I8I8(v: Float32): DataI8I8I8I8
foreign func PassFloat64ToDataI8I8I8I8(v: Float64): DataI8I8I8I8
foreign func PassBoolToDataI8I8I8I8(v: Bool): DataI8I8I8I8
foreign func PassInt8ToDataI16I16I16I16(v: Int8): DataI16I16I16I16
foreign func PassInt16ToDataI16I16I16I16(v: Int16): DataI16I16I16I16
foreign func PassInt32ToDataI16I16I16I16(v: Int32): DataI16I16I16I16
foreign func PassInt64ToDataI16I16I16I16(v: Int64): DataI16I16I16I16
foreign func PassUInt8ToDataI16I16I16I16(v: UInt8): DataI16I16I16I16
foreign func PassUInt16ToDataI16I16I16I16(v: UInt16): DataI16I16I16I16
foreign func PassUInt32ToDataI16I16I16I16(v: UInt32): DataI16I16I16I16
foreign func PassUInt64ToDataI16I16I16I16(v: UInt64): DataI16I16I16I16
foreign func PassFloat32ToDataI16I16I16I16(v: Float32): DataI16I16I16I16
foreign func PassFloat64ToDataI16I16I16I16(v: Float64): DataI16I16I16I16
foreign func PassBoolToDataI16I16I16I16(v: Bool): DataI16I16I16I16
foreign func PassInt8ToDataI32I32I32I32(v: Int8): DataI32I32I32I32
foreign func PassInt16ToDataI32I32I32I32(v: Int16): DataI32I32I32I32
foreign func PassInt32ToDataI32I32I32I32(v: Int32): DataI32I32I32I32
foreign func PassInt64ToDataI32I32I32I32(v: Int64): DataI32I32I32I32
foreign func PassUInt8ToDataI32I32I32I32(v: UInt8): DataI32I32I32I32
foreign func PassUInt16ToDataI32I32I32I32(v: UInt16): DataI32I32I32I32
foreign func PassUInt32ToDataI32I32I32I32(v: UInt32): DataI32I32I32I32
foreign func PassUInt64ToDataI32I32I32I32(v: UInt64): DataI32I32I32I32
foreign func PassFloat32ToDataI32I32I32I32(v: Float32): DataI32I32I32I32
foreign func PassFloat64ToDataI32I32I32I32(v: Float64): DataI32I32I32I32
foreign func PassBoolToDataI32I32I32I32(v: Bool): DataI32I32I32I32
foreign func PassInt8ToDataI64I64I64I64(v: Int8): DataI64I64I64I64
foreign func PassInt16ToDataI64I64I64I64(v: Int16): DataI64I64I64I64
foreign func PassInt32ToDataI64I64I64I64(v: Int32): DataI64I64I64I64
foreign func PassInt64ToDataI64I64I64I64(v: Int64): DataI64I64I64I64
foreign func PassUInt8ToDataI64I64I64I64(v: UInt8): DataI64I64I64I64
foreign func PassUInt16ToDataI64I64I64I64(v: UInt16): DataI64I64I64I64
foreign func PassUInt32ToDataI64I64I64I64(v: UInt32): DataI64I64I64I64
foreign func PassUInt64ToDataI64I64I64I64(v: UInt64): DataI64I64I64I64
foreign func PassFloat32ToDataI64I64I64I64(v: Float32): DataI64I64I64I64
foreign func PassFloat64ToDataI64I64I64I64(v: Float64): DataI64I64I64I64
foreign func PassBoolToDataI64I64I64I64(v: Bool): DataI64I64I64I64
foreign func PassInt8ToDataF32(v: Int8): DataF32
foreign func PassInt16ToDataF32(v: Int16): DataF32
foreign func PassInt32ToDataF32(v: Int32): DataF32
foreign func PassInt64ToDataF32(v: Int64): DataF32
foreign func PassUInt8ToDataF32(v: UInt8): DataF32
foreign func PassUInt16ToDataF32(v: UInt16): DataF32
foreign func PassUInt32ToDataF32(v: UInt32): DataF32
foreign func PassUInt64ToDataF32(v: UInt64): DataF32
foreign func PassFloat32ToDataF32(v: Float32): DataF32
foreign func PassFloat64ToDataF32(v: Float64): DataF32
foreign func PassBoolToDataF32(v: Bool): DataF32
foreign func PassInt8ToDataF64(v: Int8): DataF64
foreign func PassInt16ToDataF64(v: Int16): DataF64
foreign func PassInt32ToDataF64(v: Int32): DataF64
foreign func PassInt64ToDataF64(v: Int64): DataF64
foreign func PassUInt8ToDataF64(v: UInt8): DataF64
foreign func PassUInt16ToDataF64(v: UInt16): DataF64
foreign func PassUInt32ToDataF64(v: UInt32): DataF64
foreign func PassUInt64ToDataF64(v: UInt64): DataF64
foreign func PassFloat32ToDataF64(v: Float32): DataF64
foreign func PassFloat64ToDataF64(v: Float64): DataF64
foreign func PassBoolToDataF64(v: Bool): DataF64
foreign func PassInt8ToDataF32F32(v: Int8): DataF32F32
foreign func PassInt16ToDataF32F32(v: Int16): DataF32F32
foreign func PassInt32ToDataF32F32(v: Int32): DataF32F32
foreign func PassInt64ToDataF32F32(v: Int64): DataF32F32
foreign func PassUInt8ToDataF32F32(v: UInt8): DataF32F32
foreign func PassUInt16ToDataF32F32(v: UInt16): DataF32F32
foreign func PassUInt32ToDataF32F32(v: UInt32): DataF32F32
foreign func PassUInt64ToDataF32F32(v: UInt64): DataF32F32
foreign func PassFloat32ToDataF32F32(v: Float32): DataF32F32
foreign func PassFloat64ToDataF32F32(v: Float64): DataF32F32
foreign func PassBoolToDataF32F32(v: Bool): DataF32F32
foreign func PassInt8ToDataF64F64(v: Int8): DataF64F64
foreign func PassInt16ToDataF64F64(v: Int16): DataF64F64
foreign func PassInt32ToDataF64F64(v: Int32): DataF64F64
foreign func PassInt64ToDataF64F64(v: Int64): DataF64F64
foreign func PassUInt8ToDataF64F64(v: UInt8): DataF64F64
foreign func PassUInt16ToDataF64F64(v: UInt16): DataF64F64
foreign func PassUInt32ToDataF64F64(v: UInt32): DataF64F64
foreign func PassUInt64ToDataF64F64(v: UInt64): DataF64F64
foreign func PassFloat32ToDataF64F64(v: Float32): DataF64F64
foreign func PassFloat64ToDataF64F64(v: Float64): DataF64F64
foreign func PassBoolToDataF64F64(v: Bool): DataF64F64
foreign func PassInt8ToDataF32F32F32(v: Int8): DataF32F32F32
foreign func PassInt16ToDataF32F32F32(v: Int16): DataF32F32F32
foreign func PassInt32ToDataF32F32F32(v: Int32): DataF32F32F32
foreign func PassInt64ToDataF32F32F32(v: Int64): DataF32F32F32
foreign func PassUInt8ToDataF32F32F32(v: UInt8): DataF32F32F32
foreign func PassUInt16ToDataF32F32F32(v: UInt16): DataF32F32F32
foreign func PassUInt32ToDataF32F32F32(v: UInt32): DataF32F32F32
foreign func PassUInt64ToDataF32F32F32(v: UInt64): DataF32F32F32
foreign func PassFloat32ToDataF32F32F32(v: Float32): DataF32F32F32
foreign func PassFloat64ToDataF32F32F32(v: Float64): DataF32F32F32
foreign func PassBoolToDataF32F32F32(v: Bool): DataF32F32F32
foreign func PassInt8ToDataF64F64F64(v: Int8): DataF64F64F64
foreign func PassInt16ToDataF64F64F64(v: Int16): DataF64F64F64
foreign func PassInt32ToDataF64F64F64(v: Int32): DataF64F64F64
foreign func PassInt64ToDataF64F64F64(v: Int64): DataF64F64F64
foreign func PassUInt8ToDataF64F64F64(v: UInt8): DataF64F64F64
foreign func PassUInt16ToDataF64F64F64(v: UInt16): DataF64F64F64
foreign func PassUInt32ToDataF64F64F64(v: UInt32): DataF64F64F64
foreign func PassUInt64ToDataF64F64F64(v: UInt64): DataF64F64F64
foreign func PassFloat32ToDataF64F64F64(v: Float32): DataF64F64F64
foreign func PassFloat64ToDataF64F64F64(v: Float64): DataF64F64F64
foreign func PassBoolToDataF64F64F64(v: Bool): DataF64F64F64
foreign func PassInt8ToDataF32F32F32F32(v: Int8): DataF32F32F32F32
foreign func PassInt16ToDataF32F32F32F32(v: Int16): DataF32F32F32F32
foreign func PassInt32ToDataF32F32F32F32(v: Int32): DataF32F32F32F32
foreign func PassInt64ToDataF32F32F32F32(v: Int64): DataF32F32F32F32
foreign func PassUInt8ToDataF32F32F32F32(v: UInt8): DataF32F32F32F32
foreign func PassUInt16ToDataF32F32F32F32(v: UInt16): DataF32F32F32F32
foreign func PassUInt32ToDataF32F32F32F32(v: UInt32): DataF32F32F32F32
foreign func PassUInt64ToDataF32F32F32F32(v: UInt64): DataF32F32F32F32
foreign func PassFloat32ToDataF32F32F32F32(v: Float32): DataF32F32F32F32
foreign func PassFloat64ToDataF32F32F32F32(v: Float64): DataF32F32F32F32
foreign func PassBoolToDataF32F32F32F32(v: Bool): DataF32F32F32F32
foreign func PassInt8ToDataF32F32F32F32F32(v: Int8): DataF32F32F32F32F32
foreign func PassInt16ToDataF32F32F32F32F32(v: Int16): DataF32F32F32F32F32
foreign func PassInt32ToDataF32F32F32F32F32(v: Int32): DataF32F32F32F32F32
foreign func PassInt64ToDataF32F32F32F32F32(v: Int64): DataF32F32F32F32F32
foreign func PassUInt8ToDataF32F32F32F32F32(v: UInt8): DataF32F32F32F32F32
foreign func PassUInt16ToDataF32F32F32F32F32(v: UInt16): DataF32F32F32F32F32
foreign func PassUInt32ToDataF32F32F32F32F32(v: UInt32): DataF32F32F32F32F32
foreign func PassUInt64ToDataF32F32F32F32F32(v: UInt64): DataF32F32F32F32F32
foreign func PassFloat32ToDataF32F32F32F32F32(v: Float32): DataF32F32F32F32F32
foreign func PassFloat64ToDataF32F32F32F32F32(v: Float64): DataF32F32F32F32F32
foreign func PassBoolToDataF32F32F32F32F32(v: Bool): DataF32F32F32F32F32
foreign func PassInt8ToDataI8F32(v: Int8): DataI8F32
foreign func PassInt16ToDataI8F32(v: Int16): DataI8F32
foreign func PassInt32ToDataI8F32(v: Int32): DataI8F32
foreign func PassInt64ToDataI8F32(v: Int64): DataI8F32
foreign func PassUInt8ToDataI8F32(v: UInt8): DataI8F32
foreign func PassUInt16ToDataI8F32(v: UInt16): DataI8F32
foreign func PassUInt32ToDataI8F32(v: UInt32): DataI8F32
foreign func PassUInt64ToDataI8F32(v: UInt64): DataI8F32
foreign func PassFloat32ToDataI8F32(v: Float32): DataI8F32
foreign func PassFloat64ToDataI8F32(v: Float64): DataI8F32
foreign func PassBoolToDataI8F32(v: Bool): DataI8F32
foreign func PassInt8ToDataI32F32(v: Int8): DataI32F32
foreign func PassInt16ToDataI32F32(v: Int16): DataI32F32
foreign func PassInt32ToDataI32F32(v: Int32): DataI32F32
foreign func PassInt64ToDataI32F32(v: Int64): DataI32F32
foreign func PassUInt8ToDataI32F32(v: UInt8): DataI32F32
foreign func PassUInt16ToDataI32F32(v: UInt16): DataI32F32
foreign func PassUInt32ToDataI32F32(v: UInt32): DataI32F32
foreign func PassUInt64ToDataI32F32(v: UInt64): DataI32F32
foreign func PassFloat32ToDataI32F32(v: Float32): DataI32F32
foreign func PassFloat64ToDataI32F32(v: Float64): DataI32F32
foreign func PassBoolToDataI32F32(v: Bool): DataI32F32
foreign func PassInt8ToDataI8F64(v: Int8): DataI8F64
foreign func PassInt16ToDataI8F64(v: Int16): DataI8F64
foreign func PassInt32ToDataI8F64(v: Int32): DataI8F64
foreign func PassInt64ToDataI8F64(v: Int64): DataI8F64
foreign func PassUInt8ToDataI8F64(v: UInt8): DataI8F64
foreign func PassUInt16ToDataI8F64(v: UInt16): DataI8F64
foreign func PassUInt32ToDataI8F64(v: UInt32): DataI8F64
foreign func PassUInt64ToDataI8F64(v: UInt64): DataI8F64
foreign func PassFloat32ToDataI8F64(v: Float32): DataI8F64
foreign func PassFloat64ToDataI8F64(v: Float64): DataI8F64
foreign func PassBoolToDataI8F64(v: Bool): DataI8F64
foreign func PassInt8ToDataI32F64(v: Int8): DataI32F64
foreign func PassInt16ToDataI32F64(v: Int16): DataI32F64
foreign func PassInt32ToDataI32F64(v: Int32): DataI32F64
foreign func PassInt64ToDataI32F64(v: Int64): DataI32F64
foreign func PassUInt8ToDataI32F64(v: UInt8): DataI32F64
foreign func PassUInt16ToDataI32F64(v: UInt16): DataI32F64
foreign func PassUInt32ToDataI32F64(v: UInt32): DataI32F64
foreign func PassUInt64ToDataI32F64(v: UInt64): DataI32F64
foreign func PassFloat32ToDataI32F64(v: Float32): DataI32F64
foreign func PassFloat64ToDataI32F64(v: Float64): DataI32F64
foreign func PassBoolToDataI32F64(v: Bool): DataI32F64
foreign func PassInt8ToDataI8F32I8F32(v: Int8): DataI8F32I8F32
foreign func PassInt16ToDataI8F32I8F32(v: Int16): DataI8F32I8F32
foreign func PassInt32ToDataI8F32I8F32(v: Int32): DataI8F32I8F32
foreign func PassInt64ToDataI8F32I8F32(v: Int64): DataI8F32I8F32
foreign func PassUInt8ToDataI8F32I8F32(v: UInt8): DataI8F32I8F32
foreign func PassUInt16ToDataI8F32I8F32(v: UInt16): DataI8F32I8F32
foreign func PassUInt32ToDataI8F32I8F32(v: UInt32): DataI8F32I8F32
foreign func PassUInt64ToDataI8F32I8F32(v: UInt64): DataI8F32I8F32
foreign func PassFloat32ToDataI8F32I8F32(v: Float32): DataI8F32I8F32
foreign func PassFloat64ToDataI8F32I8F32(v: Float64): DataI8F32I8F32
foreign func PassBoolToDataI8F32I8F32(v: Bool): DataI8F32I8F32
foreign func PassInt8ToDataI32F32I32F32(v: Int8): DataI32F32I32F32
foreign func PassInt16ToDataI32F32I32F32(v: Int16): DataI32F32I32F32
foreign func PassInt32ToDataI32F32I32F32(v: Int32): DataI32F32I32F32
foreign func PassInt64ToDataI32F32I32F32(v: Int64): DataI32F32I32F32
foreign func PassUInt8ToDataI32F32I32F32(v: UInt8): DataI32F32I32F32
foreign func PassUInt16ToDataI32F32I32F32(v: UInt16): DataI32F32I32F32
foreign func PassUInt32ToDataI32F32I32F32(v: UInt32): DataI32F32I32F32
foreign func PassUInt64ToDataI32F32I32F32(v: UInt64): DataI32F32I32F32
foreign func PassFloat32ToDataI32F32I32F32(v: Float32): DataI32F32I32F32
foreign func PassFloat64ToDataI32F32I32F32(v: Float64): DataI32F32I32F32
foreign func PassBoolToDataI32F32I32F32(v: Bool): DataI32F32I32F32
foreign func PassInt8ToDataI8F64I8F64(v: Int8): DataI8F64I8F64
foreign func PassInt16ToDataI8F64I8F64(v: Int16): DataI8F64I8F64
foreign func PassInt32ToDataI8F64I8F64(v: Int32): DataI8F64I8F64
foreign func PassInt64ToDataI8F64I8F64(v: Int64): DataI8F64I8F64
foreign func PassUInt8ToDataI8F64I8F64(v: UInt8): DataI8F64I8F64
foreign func PassUInt16ToDataI8F64I8F64(v: UInt16): DataI8F64I8F64
foreign func PassUInt32ToDataI8F64I8F64(v: UInt32): DataI8F64I8F64
foreign func PassUInt64ToDataI8F64I8F64(v: UInt64): DataI8F64I8F64
foreign func PassFloat32ToDataI8F64I8F64(v: Float32): DataI8F64I8F64
foreign func PassFloat64ToDataI8F64I8F64(v: Float64): DataI8F64I8F64
foreign func PassBoolToDataI8F64I8F64(v: Bool): DataI8F64I8F64
foreign func PassInt8ToDataI32F64I32F64(v: Int8): DataI32F64I32F64
foreign func PassInt16ToDataI32F64I32F64(v: Int16): DataI32F64I32F64
foreign func PassInt32ToDataI32F64I32F64(v: Int32): DataI32F64I32F64
foreign func PassInt64ToDataI32F64I32F64(v: Int64): DataI32F64I32F64
foreign func PassUInt8ToDataI32F64I32F64(v: UInt8): DataI32F64I32F64
foreign func PassUInt16ToDataI32F64I32F64(v: UInt16): DataI32F64I32F64
foreign func PassUInt32ToDataI32F64I32F64(v: UInt32): DataI32F64I32F64
foreign func PassUInt64ToDataI32F64I32F64(v: UInt64): DataI32F64I32F64
foreign func PassFloat32ToDataI32F64I32F64(v: Float32): DataI32F64I32F64
foreign func PassFloat64ToDataI32F64I32F64(v: Float64): DataI32F64I32F64
foreign func PassBoolToDataI32F64I32F64(v: Bool): DataI32F64I32F64

@C
struct DataI8 {
    var a: Int8 = Int8(0)
}

@C
struct DataI16 {
    var a: Int16 = Int16(0)
}

@C
struct DataI32 {
    var a: Int32 = Int32(0)
}

@C
struct DataI64 {
    var a: Int64 = Int64(0)
}

@C
struct DataI8I8 {
    var a: Int8 = Int8(0)
    var b: Int8 = Int8(0)
}

@C
struct DataI16I16 {
    var a: Int16 = Int16(0)
    var b: Int16 = Int16(0)
}

@C
struct DataI32I32 {
    var a: Int32 = Int32(0)
    var b: Int32 = Int32(0)
}

@C
struct DataI64I64 {
    var a: Int64 = Int64(0)
    var b: Int64 = Int64(0)
}

@C
struct DataI8I16 {
    var a: Int8 = Int8(0)
    var b: Int16 = Int16(0)
}

@C
struct DataI8I32 {
    var a: Int8 = Int8(0)
    var b: Int32 = Int32(0)
}

@C
struct DataI8I64 {
    var a: Int8 = Int8(0)
    var b: Int64 = Int64(0)
}

@C
struct DataI16I32 {
    var a: Int16 = Int16(0)
    var b: Int32 = Int32(0)
}

@C
struct DataI16I64 {
    var a: Int16 = Int16(0)
    var b: Int64 = Int64(0)
}

@C
struct DataI32I64 {
    var a: Int32 = Int32(0)
    var b: Int64 = Int64(0)
}

@C
struct DataI8I8I8 {
    var a: Int8 = Int8(0)
    var b: Int8 = Int8(0)
    var c: Int8 = Int8(0)
}

@C
struct DataI16I16I16 {
    var a: Int16 = Int16(0)
    var b: Int16 = Int16(0)
    var c: Int16 = Int16(0)
}

@C
struct DataI32I32I32 {
    var a: Int32 = Int32(0)
    var b: Int32 = Int32(0)
    var c: Int32 = Int32(0)
}

@C
struct DataI64I64I64 {
    var a: Int64 = Int64(0)
    var b: Int64 = Int64(0)
    var c: Int64 = Int64(0)
}

@C
struct DataI8I8I8I8 {
    var a: Int8 = Int8(0)
    var b: Int8 = Int8(0)
    var c: Int8 = Int8(0)
    var d: Int8 = Int8(0)
}

@C
struct DataI16I16I16I16 {
    var a: Int16 = Int16(0)
    var b: Int16 = Int16(0)
    var c: Int16 = Int16(0)
    var d: Int16 = Int16(0)
}

@C
struct DataI32I32I32I32 {
    var a: Int32 = Int32(0)
    var b: Int32 = Int32(0)
    var c: Int32 = Int32(0)
    var d: Int32 = Int32(0)
}

@C
struct DataI64I64I64I64 {
    var a: Int64 = Int64(0)
    var b: Int64 = Int64(0)
    var c: Int64 = Int64(0)
    var d: Int64 = Int64(0)
}

@C
struct DataF32 {
    var a: Float32 = Float32(0)
}

@C
struct DataF64 {
    var a: Float64 = Float64(0)
}

@C
struct DataF32F32 {
    var a: Float32 = Float32(0)
    var b: Float32 = Float32(0)
}

@C
struct DataF64F64 {
    var a: Float64 = Float64(0)
    var b: Float64 = Float64(0)
}

@C
struct DataF32F32F32 {
    var a: Float32 = Float32(0)
    var b: Float32 = Float32(0)
    var c: Float32 = Float32(0)
}

@C
struct DataF64F64F64 {
    var a: Float64 = Float64(0)
    var b: Float64 = Float64(0)
    var c: Float64 = Float64(0)
}

@C
struct DataF32F32F32F32 {
    var a: Float32 = Float32(0)
    var b: Float32 = Float32(0)
    var c: Float32 = Float32(0)
    var d: Float32 = Float32(0)
}

@C
struct DataF32F32F32F32F32 {
    var a: Float32 = Float32(0)
    var b: Float32 = Float32(0)
    var c: Float32 = Float32(0)
    var d: Float32 = Float32(0)
    var e: Float32 = Float32(0)
}

@C
struct DataI8F32 {
    var a: Int8 = Int8(0)
    var b: Float32 = Float32(0)
}

@C
struct DataI32F32 {
    var a: Int32 = Int32(0)
    var b: Float32 = Float32(0)
}

@C
struct DataI8F64 {
    var a: Int8 = Int8(0)
    var b: Float64 = Float64(0)
}

@C
struct DataI32F64 {
    var a: Int32 = Int32(0)
    var b: Float64 = Float64(0)
}

@C
struct DataI8F32I8F32 {
    var a: Int8 = Int8(0)
    var b: Float32 = Float32(0)
    var c: Int8 = Int8(0)
    var d: Float32 = Float32(0)
}

@C
struct DataI32F32I32F32 {
    var a: Int32 = Int32(0)
    var b: Float32 = Float32(0)
    var c: Int32 = Int32(0)
    var d: Float32 = Float32(0)
}

@C
struct DataI8F64I8F64 {
    var a: Int8 = Int8(0)
    var b: Float64 = Float64(0)
    var c: Int8 = Int8(0)
    var d: Float64 = Float64(0)
}

@C
struct DataI32F64I32F64 {
    var a: Int32 = Int32(0)
    var b: Float64 = Float64(0)
    var c: Int32 = Int32(0)
    var d: Float64 = Float64(0)
}


unsafe main() {
    PassInt8ToDataI8(-10)
    PassInt16ToDataI8(-200)
    PassInt32ToDataI8(-3000)
    PassInt64ToDataI8(-40000)
    PassUInt8ToDataI8(10)
    PassUInt16ToDataI8(200)
    PassUInt32ToDataI8(3000)
    PassUInt64ToDataI8(40000)
    PassFloat32ToDataI8(12.34f)
    PassFloat64ToDataI8(56.78)
    PassBoolToDataI8(true)
    PassInt8ToDataI16(-10)
    PassInt16ToDataI16(-200)
    PassInt32ToDataI16(-3000)
    PassInt64ToDataI16(-40000)
    PassUInt8ToDataI16(10)
    PassUInt16ToDataI16(200)
    PassUInt32ToDataI16(3000)
    PassUInt64ToDataI16(40000)
    PassFloat32ToDataI16(12.34f)
    PassFloat64ToDataI16(56.78)
    PassBoolToDataI16(true)
    PassInt8ToDataI32(-10)
    PassInt16ToDataI32(-200)
    PassInt32ToDataI32(-3000)
    PassInt64ToDataI32(-40000)
    PassUInt8ToDataI32(10)
    PassUInt16ToDataI32(200)
    PassUInt32ToDataI32(3000)
    PassUInt64ToDataI32(40000)
    PassFloat32ToDataI32(12.34f)
    PassFloat64ToDataI32(56.78)
    PassBoolToDataI32(true)
    PassInt8ToDataI64(-10)
    PassInt16ToDataI64(-200)
    PassInt32ToDataI64(-3000)
    PassInt64ToDataI64(-40000)
    PassUInt8ToDataI64(10)
    PassUInt16ToDataI64(200)
    PassUInt32ToDataI64(3000)
    PassUInt64ToDataI64(40000)
    PassFloat32ToDataI64(12.34f)
    PassFloat64ToDataI64(56.78)
    PassBoolToDataI64(true)
    PassInt8ToDataI8I8(-10)
    PassInt16ToDataI8I8(-200)
    PassInt32ToDataI8I8(-3000)
    PassInt64ToDataI8I8(-40000)
    PassUInt8ToDataI8I8(10)
    PassUInt16ToDataI8I8(200)
    PassUInt32ToDataI8I8(3000)
    PassUInt64ToDataI8I8(40000)
    PassFloat32ToDataI8I8(12.34f)
    PassFloat64ToDataI8I8(56.78)
    PassBoolToDataI8I8(true)
    PassInt8ToDataI16I16(-10)
    PassInt16ToDataI16I16(-200)
    PassInt32ToDataI16I16(-3000)
    PassInt64ToDataI16I16(-40000)
    PassUInt8ToDataI16I16(10)
    PassUInt16ToDataI16I16(200)
    PassUInt32ToDataI16I16(3000)
    PassUInt64ToDataI16I16(40000)
    PassFloat32ToDataI16I16(12.34f)
    PassFloat64ToDataI16I16(56.78)
    PassBoolToDataI16I16(true)
    PassInt8ToDataI32I32(-10)
    PassInt16ToDataI32I32(-200)
    PassInt32ToDataI32I32(-3000)
    PassInt64ToDataI32I32(-40000)
    PassUInt8ToDataI32I32(10)
    PassUInt16ToDataI32I32(200)
    PassUInt32ToDataI32I32(3000)
    PassUInt64ToDataI32I32(40000)
    PassFloat32ToDataI32I32(12.34f)
    PassFloat64ToDataI32I32(56.78)
    PassBoolToDataI32I32(true)
    PassInt8ToDataI64I64(-10)
    PassInt16ToDataI64I64(-200)
    PassInt32ToDataI64I64(-3000)
    PassInt64ToDataI64I64(-40000)
    PassUInt8ToDataI64I64(10)
    PassUInt16ToDataI64I64(200)
    PassUInt32ToDataI64I64(3000)
    PassUInt64ToDataI64I64(40000)
    PassFloat32ToDataI64I64(12.34f)
    PassFloat64ToDataI64I64(56.78)
    PassBoolToDataI64I64(true)
    PassInt8ToDataI8I16(-10)
    PassInt16ToDataI8I16(-200)
    PassInt32ToDataI8I16(-3000)
    PassInt64ToDataI8I16(-40000)
    PassUInt8ToDataI8I16(10)
    PassUInt16ToDataI8I16(200)
    PassUInt32ToDataI8I16(3000)
    PassUInt64ToDataI8I16(40000)
    PassFloat32ToDataI8I16(12.34f)
    PassFloat64ToDataI8I16(56.78)
    PassBoolToDataI8I16(true)
    PassInt8ToDataI8I32(-10)
    PassInt16ToDataI8I32(-200)
    PassInt32ToDataI8I32(-3000)
    PassInt64ToDataI8I32(-40000)
    PassUInt8ToDataI8I32(10)
    PassUInt16ToDataI8I32(200)
    PassUInt32ToDataI8I32(3000)
    PassUInt64ToDataI8I32(40000)
    PassFloat32ToDataI8I32(12.34f)
    PassFloat64ToDataI8I32(56.78)
    PassBoolToDataI8I32(true)
    PassInt8ToDataI8I64(-10)
    PassInt16ToDataI8I64(-200)
    PassInt32ToDataI8I64(-3000)
    PassInt64ToDataI8I64(-40000)
    PassUInt8ToDataI8I64(10)
    PassUInt16ToDataI8I64(200)
    PassUInt32ToDataI8I64(3000)
    PassUInt64ToDataI8I64(40000)
    PassFloat32ToDataI8I64(12.34f)
    PassFloat64ToDataI8I64(56.78)
    PassBoolToDataI8I64(true)
    PassInt8ToDataI16I32(-10)
    PassInt16ToDataI16I32(-200)
    PassInt32ToDataI16I32(-3000)
    PassInt64ToDataI16I32(-40000)
    PassUInt8ToDataI16I32(10)
    PassUInt16ToDataI16I32(200)
    PassUInt32ToDataI16I32(3000)
    PassUInt64ToDataI16I32(40000)
    PassFloat32ToDataI16I32(12.34f)
    PassFloat64ToDataI16I32(56.78)
    PassBoolToDataI16I32(true)
    PassInt8ToDataI16I64(-10)
    PassInt16ToDataI16I64(-200)
    PassInt32ToDataI16I64(-3000)
    PassInt64ToDataI16I64(-40000)
    PassUInt8ToDataI16I64(10)
    PassUInt16ToDataI16I64(200)
    PassUInt32ToDataI16I64(3000)
    PassUInt64ToDataI16I64(40000)
    PassFloat32ToDataI16I64(12.34f)
    PassFloat64ToDataI16I64(56.78)
    PassBoolToDataI16I64(true)
    PassInt8ToDataI32I64(-10)
    PassInt16ToDataI32I64(-200)
    PassInt32ToDataI32I64(-3000)
    PassInt64ToDataI32I64(-40000)
    PassUInt8ToDataI32I64(10)
    PassUInt16ToDataI32I64(200)
    PassUInt32ToDataI32I64(3000)
    PassUInt64ToDataI32I64(40000)
    PassFloat32ToDataI32I64(12.34f)
    PassFloat64ToDataI32I64(56.78)
    PassBoolToDataI32I64(true)
    PassInt8ToDataI8I8I8(-10)
    PassInt16ToDataI8I8I8(-200)
    PassInt32ToDataI8I8I8(-3000)
    PassInt64ToDataI8I8I8(-40000)
    PassUInt8ToDataI8I8I8(10)
    PassUInt16ToDataI8I8I8(200)
    PassUInt32ToDataI8I8I8(3000)
    PassUInt64ToDataI8I8I8(40000)
    PassFloat32ToDataI8I8I8(12.34f)
    PassFloat64ToDataI8I8I8(56.78)
    PassBoolToDataI8I8I8(true)
    PassInt8ToDataI16I16I16(-10)
    PassInt16ToDataI16I16I16(-200)
    PassInt32ToDataI16I16I16(-3000)
    PassInt64ToDataI16I16I16(-40000)
    PassUInt8ToDataI16I16I16(10)
    PassUInt16ToDataI16I16I16(200)
    PassUInt32ToDataI16I16I16(3000)
    PassUInt64ToDataI16I16I16(40000)
    PassFloat32ToDataI16I16I16(12.34f)
    PassFloat64ToDataI16I16I16(56.78)
    PassBoolToDataI16I16I16(true)
    PassInt8ToDataI32I32I32(-10)
    PassInt16ToDataI32I32I32(-200)
    PassInt32ToDataI32I32I32(-3000)
    PassInt64ToDataI32I32I32(-40000)
    PassUInt8ToDataI32I32I32(10)
    PassUInt16ToDataI32I32I32(200)
    PassUInt32ToDataI32I32I32(3000)
    PassUInt64ToDataI32I32I32(40000)
    PassFloat32ToDataI32I32I32(12.34f)
    PassFloat64ToDataI32I32I32(56.78)
    PassBoolToDataI32I32I32(true)
    PassInt8ToDataI64I64I64(-10)
    PassInt16ToDataI64I64I64(-200)
    PassInt32ToDataI64I64I64(-3000)
    PassInt64ToDataI64I64I64(-40000)
    PassUInt8ToDataI64I64I64(10)
    PassUInt16ToDataI64I64I64(200)
    PassUInt32ToDataI64I64I64(3000)
    PassUInt64ToDataI64I64I64(40000)
    PassFloat32ToDataI64I64I64(12.34f)
    PassFloat64ToDataI64I64I64(56.78)
    PassBoolToDataI64I64I64(true)
    PassInt8ToDataI8I8I8I8(-10)
    PassInt16ToDataI8I8I8I8(-200)
    PassInt32ToDataI8I8I8I8(-3000)
    PassInt64ToDataI8I8I8I8(-40000)
    PassUInt8ToDataI8I8I8I8(10)
    PassUInt16ToDataI8I8I8I8(200)
    PassUInt32ToDataI8I8I8I8(3000)
    PassUInt64ToDataI8I8I8I8(40000)
    PassFloat32ToDataI8I8I8I8(12.34f)
    PassFloat64ToDataI8I8I8I8(56.78)
    PassBoolToDataI8I8I8I8(true)
    PassInt8ToDataI16I16I16I16(-10)
    PassInt16ToDataI16I16I16I16(-200)
    PassInt32ToDataI16I16I16I16(-3000)
    PassInt64ToDataI16I16I16I16(-40000)
    PassUInt8ToDataI16I16I16I16(10)
    PassUInt16ToDataI16I16I16I16(200)
    PassUInt32ToDataI16I16I16I16(3000)
    PassUInt64ToDataI16I16I16I16(40000)
    PassFloat32ToDataI16I16I16I16(12.34f)
    PassFloat64ToDataI16I16I16I16(56.78)
    PassBoolToDataI16I16I16I16(true)
    PassInt8ToDataI32I32I32I32(-10)
    PassInt16ToDataI32I32I32I32(-200)
    PassInt32ToDataI32I32I32I32(-3000)
    PassInt64ToDataI32I32I32I32(-40000)
    PassUInt8ToDataI32I32I32I32(10)
    PassUInt16ToDataI32I32I32I32(200)
    PassUInt32ToDataI32I32I32I32(3000)
    PassUInt64ToDataI32I32I32I32(40000)
    PassFloat32ToDataI32I32I32I32(12.34f)
    PassFloat64ToDataI32I32I32I32(56.78)
    PassBoolToDataI32I32I32I32(true)
    PassInt8ToDataI64I64I64I64(-10)
    PassInt16ToDataI64I64I64I64(-200)
    PassInt32ToDataI64I64I64I64(-3000)
    PassInt64ToDataI64I64I64I64(-40000)
    PassUInt8ToDataI64I64I64I64(10)
    PassUInt16ToDataI64I64I64I64(200)
    PassUInt32ToDataI64I64I64I64(3000)
    PassUInt64ToDataI64I64I64I64(40000)
    PassFloat32ToDataI64I64I64I64(12.34f)
    PassFloat64ToDataI64I64I64I64(56.78)
    PassBoolToDataI64I64I64I64(true)
    PassInt8ToDataF32(-10)
    PassInt16ToDataF32(-200)
    PassInt32ToDataF32(-3000)
    PassInt64ToDataF32(-40000)
    PassUInt8ToDataF32(10)
    PassUInt16ToDataF32(200)
    PassUInt32ToDataF32(3000)
    PassUInt64ToDataF32(40000)
    PassFloat32ToDataF32(12.34f)
    PassFloat64ToDataF32(56.78)
    PassBoolToDataF32(true)
    PassInt8ToDataF64(-10)
    PassInt16ToDataF64(-200)
    PassInt32ToDataF64(-3000)
    PassInt64ToDataF64(-40000)
    PassUInt8ToDataF64(10)
    PassUInt16ToDataF64(200)
    PassUInt32ToDataF64(3000)
    PassUInt64ToDataF64(40000)
    PassFloat32ToDataF64(12.34f)
    PassFloat64ToDataF64(56.78)
    PassBoolToDataF64(true)
    PassInt8ToDataF32F32(-10)
    PassInt16ToDataF32F32(-200)
    PassInt32ToDataF32F32(-3000)
    PassInt64ToDataF32F32(-40000)
    PassUInt8ToDataF32F32(10)
    PassUInt16ToDataF32F32(200)
    PassUInt32ToDataF32F32(3000)
    PassUInt64ToDataF32F32(40000)
    PassFloat32ToDataF32F32(12.34f)
    PassFloat64ToDataF32F32(56.78)
    PassBoolToDataF32F32(true)
    PassInt8ToDataF64F64(-10)
    PassInt16ToDataF64F64(-200)
    PassInt32ToDataF64F64(-3000)
    PassInt64ToDataF64F64(-40000)
    PassUInt8ToDataF64F64(10)
    PassUInt16ToDataF64F64(200)
    PassUInt32ToDataF64F64(3000)
    PassUInt64ToDataF64F64(40000)
    PassFloat32ToDataF64F64(12.34f)
    PassFloat64ToDataF64F64(56.78)
    PassBoolToDataF64F64(true)
    PassInt8ToDataF32F32F32(-10)
    PassInt16ToDataF32F32F32(-200)
    PassInt32ToDataF32F32F32(-3000)
    PassInt64ToDataF32F32F32(-40000)
    PassUInt8ToDataF32F32F32(10)
    PassUInt16ToDataF32F32F32(200)
    PassUInt32ToDataF32F32F32(3000)
    PassUInt64ToDataF32F32F32(40000)
    PassFloat32ToDataF32F32F32(12.34f)
    PassFloat64ToDataF32F32F32(56.78)
    PassBoolToDataF32F32F32(true)
    PassInt8ToDataF64F64F64(-10)
    PassInt16ToDataF64F64F64(-200)
    PassInt32ToDataF64F64F64(-3000)
    PassInt64ToDataF64F64F64(-40000)
    PassUInt8ToDataF64F64F64(10)
    PassUInt16ToDataF64F64F64(200)
    PassUInt32ToDataF64F64F64(3000)
    PassUInt64ToDataF64F64F64(40000)
    PassFloat32ToDataF64F64F64(12.34f)
    PassFloat64ToDataF64F64F64(56.78)
    PassBoolToDataF64F64F64(true)
    PassInt8ToDataF32F32F32F32(-10)
    PassInt16ToDataF32F32F32F32(-200)
    PassInt32ToDataF32F32F32F32(-3000)
    PassInt64ToDataF32F32F32F32(-40000)
    PassUInt8ToDataF32F32F32F32(10)
    PassUInt16ToDataF32F32F32F32(200)
    PassUInt32ToDataF32F32F32F32(3000)
    PassUInt64ToDataF32F32F32F32(40000)
    PassFloat32ToDataF32F32F32F32(12.34f)
    PassFloat64ToDataF32F32F32F32(56.78)
    PassBoolToDataF32F32F32F32(true)
    PassInt8ToDataF32F32F32F32F32(-10)
    PassInt16ToDataF32F32F32F32F32(-200)
    PassInt32ToDataF32F32F32F32F32(-3000)
    PassInt64ToDataF32F32F32F32F32(-40000)
    PassUInt8ToDataF32F32F32F32F32(10)
    PassUInt16ToDataF32F32F32F32F32(200)
    PassUInt32ToDataF32F32F32F32F32(3000)
    PassUInt64ToDataF32F32F32F32F32(40000)
    PassFloat32ToDataF32F32F32F32F32(12.34f)
    PassFloat64ToDataF32F32F32F32F32(56.78)
    PassBoolToDataF32F32F32F32F32(true)
    PassInt8ToDataI8F32(-10)
    PassInt16ToDataI8F32(-200)
    PassInt32ToDataI8F32(-3000)
    PassInt64ToDataI8F32(-40000)
    PassUInt8ToDataI8F32(10)
    PassUInt16ToDataI8F32(200)
    PassUInt32ToDataI8F32(3000)
    PassUInt64ToDataI8F32(40000)
    PassFloat32ToDataI8F32(12.34f)
    PassFloat64ToDataI8F32(56.78)
    PassBoolToDataI8F32(true)
    PassInt8ToDataI32F32(-10)
    PassInt16ToDataI32F32(-200)
    PassInt32ToDataI32F32(-3000)
    PassInt64ToDataI32F32(-40000)
    PassUInt8ToDataI32F32(10)
    PassUInt16ToDataI32F32(200)
    PassUInt32ToDataI32F32(3000)
    PassUInt64ToDataI32F32(40000)
    PassFloat32ToDataI32F32(12.34f)
    PassFloat64ToDataI32F32(56.78)
    PassBoolToDataI32F32(true)
    PassInt8ToDataI8F64(-10)
    PassInt16ToDataI8F64(-200)
    PassInt32ToDataI8F64(-3000)
    PassInt64ToDataI8F64(-40000)
    PassUInt8ToDataI8F64(10)
    PassUInt16ToDataI8F64(200)
    PassUInt32ToDataI8F64(3000)
    PassUInt64ToDataI8F64(40000)
    PassFloat32ToDataI8F64(12.34f)
    PassFloat64ToDataI8F64(56.78)
    PassBoolToDataI8F64(true)
    PassInt8ToDataI32F64(-10)
    PassInt16ToDataI32F64(-200)
    PassInt32ToDataI32F64(-3000)
    PassInt64ToDataI32F64(-40000)
    PassUInt8ToDataI32F64(10)
    PassUInt16ToDataI32F64(200)
    PassUInt32ToDataI32F64(3000)
    PassUInt64ToDataI32F64(40000)
    PassFloat32ToDataI32F64(12.34f)
    PassFloat64ToDataI32F64(56.78)
    PassBoolToDataI32F64(true)
    PassInt8ToDataI8F32I8F32(-10)
    PassInt16ToDataI8F32I8F32(-200)
    PassInt32ToDataI8F32I8F32(-3000)
    PassInt64ToDataI8F32I8F32(-40000)
    PassUInt8ToDataI8F32I8F32(10)
    PassUInt16ToDataI8F32I8F32(200)
    PassUInt32ToDataI8F32I8F32(3000)
    PassUInt64ToDataI8F32I8F32(40000)
    PassFloat32ToDataI8F32I8F32(12.34f)
    PassFloat64ToDataI8F32I8F32(56.78)
    PassBoolToDataI8F32I8F32(true)
    PassInt8ToDataI32F32I32F32(-10)
    PassInt16ToDataI32F32I32F32(-200)
    PassInt32ToDataI32F32I32F32(-3000)
    PassInt64ToDataI32F32I32F32(-40000)
    PassUInt8ToDataI32F32I32F32(10)
    PassUInt16ToDataI32F32I32F32(200)
    PassUInt32ToDataI32F32I32F32(3000)
    PassUInt64ToDataI32F32I32F32(40000)
    PassFloat32ToDataI32F32I32F32(12.34f)
    PassFloat64ToDataI32F32I32F32(56.78)
    PassBoolToDataI32F32I32F32(true)
    PassInt8ToDataI8F64I8F64(-10)
    PassInt16ToDataI8F64I8F64(-200)
    PassInt32ToDataI8F64I8F64(-3000)
    PassInt64ToDataI8F64I8F64(-40000)
    PassUInt8ToDataI8F64I8F64(10)
    PassUInt16ToDataI8F64I8F64(200)
    PassUInt32ToDataI8F64I8F64(3000)
    PassUInt64ToDataI8F64I8F64(40000)
    PassFloat32ToDataI8F64I8F64(12.34f)
    PassFloat64ToDataI8F64I8F64(56.78)
    PassBoolToDataI8F64I8F64(true)
    PassInt8ToDataI32F64I32F64(-10)
    PassInt16ToDataI32F64I32F64(-200)
    PassInt32ToDataI32F64I32F64(-3000)
    PassInt64ToDataI32F64I32F64(-40000)
    PassUInt8ToDataI32F64I32F64(10)
    PassUInt16ToDataI32F64I32F64(200)
    PassUInt32ToDataI32F64I32F64(3000)
    PassUInt64ToDataI32F64I32F64(40000)
    PassFloat32ToDataI32F64I32F64(12.34f)
    PassFloat64ToDataI32F64I32F64(56.78)
    PassBoolToDataI32F64I32F64(true)
    return 0
}
