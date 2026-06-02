/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   6.1.1.1(18)
                // in package A
                package A
                public sealed class C1 {} // OK
                sealed class C2 {} // OK, 'public' is optional when 'sealed' is used

                class S1 <: C1 {} // OK
                public open class AuxA18 <: C1 {} // OK
                public sealed class S3 <: C1 {} // OK
                open class S4 <: C1 {} // OK

                // in package B
                package B
                import A.*

                class SS1 <: AuxA18 {} // OK
                class SS2 <: S3 {} // Error, S3 is sealed class, cannot be inherited here.
  @Description: Checks that declaration of SS2 is invalid.
  @Level:         1
  @Mode: compileonly
  @Negative: yes
  @Structure: complex-main
  @Dependencies: aux_a18.cj
  @CompileWarning: no
  @Issue: 6084
*/

package b
import a.*

class SS2 <: S3 {} // Error, S3 is sealed class, cannot be inherited here.

main() { }
