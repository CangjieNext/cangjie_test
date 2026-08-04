/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: inputs.cj utils.cj visitors.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f inputs.cj utils.cj visitors.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.ast.*
import std.collection.*

@Test
@Measure[TimeNow(Nanos)]
class TestVarDeclsTypeNodeTokensToString {
    let genericSingleResourceInput1: Tokens = Tokens()
    let internalGenericListResourceInput1: Tokens = Tokens()
  
    let watchAttrOuterInput1: Tokens
    let storagePropAttrInput1: Tokens
    let customDialogInput1: ArrayList<Tokens> = ArrayList<Tokens>()
    let componentInput1: ArrayList<Tokens> = ArrayList<Tokens>()
    let componentInput2: ArrayList<Tokens> = ArrayList<Tokens>()
    let componentInput3: ArrayList<Tokens> = ArrayList<Tokens>()
    let componentInput4: ArrayList<Tokens> = ArrayList<Tokens>()
    let componentInput5: ArrayList<Tokens> = ArrayList<Tokens>()
    let componentInput6: ArrayList<Tokens> = ArrayList<Tokens>()

    TestVarDeclsTypeNodeTokensToString() {
        let vd1 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(genericSingleResourceStr1)) as ClassDecl).getOrThrow())
        let vd2 = getVarDeclsFromClassDecl((parseDecl(cangjieLex(internalGenericListResourceStr1)) as ClassDecl).getOrThrow())
        for (valDecl in vd1) {
            genericSingleResourceInput1.append(valDecl.declType.toTokens())
        }
        for (valDecl in vd2) {
            internalGenericListResourceInput1.append(valDecl.declType.toTokens())
        }

        this.watchAttrOuterInput1 = (parseDecl(cangjieLex(watchAttrOuterStr1)) as VarDecl).getOrThrow().declType.toTokens()
        this.storagePropAttrInput1 = (parseDecl(cangjieLex(storagePropAttrStr1)) as VarDecl).getOrThrow().declType.toTokens()
        let vd3 = getVarDecls((parseDecl(cangjieLex(customDialogStr1)) as ClassDecl).getOrThrow())
        for (varDecl in vd3) {
            try {
                this.customDialogInput1.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
        let vd4 = getVarDecls((parseDecl(cangjieLex(componentStr1)) as ClassDecl).getOrThrow())
        for (varDecl in vd4) {
            try {
                this.componentInput1.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
        let vd5 = getVarDecls((parseDecl(cangjieLex(componentStr2)) as ClassDecl).getOrThrow())
        for (varDecl in vd5) {
            try {
                this.componentInput2.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
        let vd6 = getVarDecls((parseDecl(cangjieLex(componentStr3)) as ClassDecl).getOrThrow())
        for (varDecl in vd6) {
            try {
                this.componentInput3.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
        let vd7 = getVarDecls((parseDecl(cangjieLex(componentStr4)) as ClassDecl).getOrThrow())
        for (varDecl in vd7) {
            try {
                this.componentInput4.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
        let vd8 = getVarDecls((parseDecl(cangjieLex(componentStr5)) as ClassDecl).getOrThrow())
        for (varDecl in vd8) {
            try {
                this.componentInput5.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
        let vd9 = getVarDecls((parseDecl(cangjieLex(componentStr6)) as ClassDecl).getOrThrow())
        for (varDecl in vd9) {
            try {
                this.componentInput6.add(varDecl.declType.toTokens())
            } catch (e: Exception) {
                continue
            }
        }
    }

    @Bench
    func BenchmarkTokensToString2_VarDecl_declType_001():Unit {
        this.watchAttrOuterInput1.toString()
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecl_declType_002():Unit {
        this.storagePropAttrInput1.toString()
        ()
    }  


    @Bench 
    func BenchmarkTokensToString2_VarDecls_type_001(): Unit {
        let str = genericSingleResourceInput1.toString()
        ()
    }
    @Bench 
    func BenchmarkTokensToString2_VarDecls_type_002(): Unit {
        let str = internalGenericListResourceInput1.toString()
        ()
    }


    @Bench
    func BenchmarkTokensToString2_VarDecls_type_003():Unit {
        for (tokens in customDialogInput1) {
            tokens.toString()
        }
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecls_type_004():Unit {
        for (tokens in componentInput1) {
            tokens.toString()
        }
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecls_type_005():Unit {
        for (tokens in componentInput2) {
            tokens.toString()
        }
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecls_type_006():Unit {
        for (tokens in componentInput3) {
            tokens.toString()
        }
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecls_type_007():Unit {
        for (tokens in componentInput4) {
            tokens.toString()
        }
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecls_type_008():Unit {
        for (tokens in componentInput5) {
            tokens.toString()
        }
        ()
    }
    @Bench
    func BenchmarkTokensToString2_VarDecls_type_009():Unit {
        for (tokens in componentInput6) {
            tokens.toString()
        }
        ()
    }


}
