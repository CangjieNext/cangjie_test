// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

public struct Complex64 {
    public var real: Float64
    public var imag: Float64
    public init(real: Float64, imag: Float64) {
        this.real = real
        this.imag = imag
    }
}

public interface Number<T> {}

extend Complex64 <: Number<Complex64> {}

public class Tensor<T> where T <: Number<T> {
    public var ptr: CPointer<T> = CPointer<T>()
    public init() {}
}

main() {
    let a = Tensor<Complex64>()
    0
}

/* SCAN-IN
error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
  ==> generic_type_1.cj:17:30:
   | 
17 |     public var ptr: CPointer<T> = CPointer<T>()
   |                              ^ 
   | 
   # note: 'Generics-T' is not a subtype of 'Interface-CType'

error: generics type arguments do not match the constraint of 'CPointer<Generics-T>'
  ==> generic_type_1.cj:17:44:
   | 
17 |     public var ptr: CPointer<T> = CPointer<T>()
   |                                            ^ 
   | 
   # note: 'Generics-T' is not a subtype of 'Interface-CType'

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
