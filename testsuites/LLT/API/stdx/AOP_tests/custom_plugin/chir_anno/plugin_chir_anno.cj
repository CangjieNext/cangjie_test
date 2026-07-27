/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package plugin_chir_anno

import stdx.chir.*
import stdx.plugin.*

/**
 * Inspect CHIR annotations / SourceExpr that the compiler serializes into the package.
 * chirAnno / SourceExpr cannot be set from public Cangjie API; coverage relies on real source lowering.
 * executeCHIRPlugins re-serializes the package after plugin run, exercising serialize.cj paths.
 */
@CHIRPlugin
class ChirAnnoDump {
    public override func run(pkg: Package): Bool {
        let dump = pkg.toString()

        println("has checkTypeCast: ${dump.contains("checkTypeCast")}")
        println("has GeneratedFromForIn: ${dump.contains("GeneratedFromForIn")}")
        println("has skip dce: ${dump.contains("skip: dce warning")}")
        println("has skip forin: ${dump.contains("skip: for-in exit")}")
        println("has linkType external: ${dump.contains("linkType: external")}")
        println("has linkType internal: ${dump.contains("linkType: internal")}")
        println("has linkType weak_odr: ${dump.contains("linkType: weak_odr")}")
        println("has warning loc: ${dump.contains("warning ")}")
        println("has sourceExpr IfExpr: ${dump.contains("sourceExpr: IfExpr")}")
        println("has sourceExpr WhileExpr: ${dump.contains("sourceExpr: WhileExpr")}")
        println("has sourceExpr MatchExpr: ${dump.contains("sourceExpr: MatchExpr")}")
        println("has sourceExpr ForInExpr: ${dump.contains("sourceExpr: ForInExpr")}")
        println("has sourceExpr Binary: ${dump.contains("sourceExpr: Binary")}")
        println("has sourceExpr Quest: ${dump.contains("sourceExpr: Quest")}")

        var ext = 0
        var nonExt = 0
        for (f in pkg.functions) {
            if (f.isImported() || f.isCompilerAdd()) {
                continue
            }
            if (f.isExternalLinkage()) {
                ext++
            } else {
                nonExt++
            }
        }
        println("user ext linkage: ${ext}")
        println("user non-ext linkage: ${nonExt}")

        var closureCnt = 0
        for (c in pkg.classDefs) {
            if (c.ty.isClosureType()) {
                closureCnt++
            }
        }
        println("closure types: ${closureCnt}")
        println("chir anno probe ok")
        return true
    }
}
