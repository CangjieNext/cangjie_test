/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package stdx.aspect_cj.plugins.coverage_helper

import stdx.aspect_cj.*
import stdx.chir.*
import stdx.plugin.*

/**
 * Exercises protected helpers in stdx.aspect_cj that annotation usage alone does not hit:
 * - annotation class constructors
 * - getFuncOuterTypeName for global / custom-type / builtin-extend members
 * - mapArrayTo on empty and non-empty arrays
 */
@CHIRPlugin
class AspectCoverageHelper {
    public override func run(pkg: Package): Bool {
        let entry = InsertAtEntry(
            packageName: "default",
            className: "CA",
            methodName: "foo",
            isStatic: false,
            recursive: false,
            funcTypeStr: "()->Unit")
        let exitAnno = InsertAtExit(
            packageName: "default",
            className: "",
            methodName: "woven",
            isStatic: false,
            recursive: false,
            funcTypeStr: "()->Unit")
        let replace = ReplaceFuncBody(
            packageName: "default",
            className: "CA",
            methodName: "foo",
            isStatic: false,
            recursive: false)
        if (!(entry is InsertAtEntry) || !(exitAnno is InsertAtExit) || !(replace is ReplaceFuncBody)) {
            println("anno construct failed")
            return false
        }

        let insert = Insert("default", "mangled", 0, false, true)
        let to = To("default", "CA", "foo", "()->Unit", false, true)
        let info = OutputInfo("InsertAtEntry", insert, to)
        println("output info: ${info.annoClassName}")

        let emptyMapped = mapArrayTo(Array<Int64>(), {x: Int64 => x})
        let nonemptyMapped = mapArrayTo([1, 2, 3], {x: Int64 => x * 2})
        println("mapArrayTo empty: ${emptyMapped.size}")
        println("mapArrayTo nonempty: ${nonemptyMapped.size}")

        var hitGlobalOuter = false
        var hitCustomOuter = false
        var hitOtherOuter = false
        for (f in pkg.functions) {
            if (f.isImported() || f.isCompilerAdd()) {
                continue
            }
            let outer = getFuncOuterTypeName(f)
            if (outer.isEmpty()) {
                hitGlobalOuter = true
            } else if (outer == "CA") {
                hitCustomOuter = true
            } else {
                hitOtherOuter = true
                println("other outer: ${outer} func: ${f.srcCodeName}")
            }
        }
        println("hit global outer: ${hitGlobalOuter}")
        println("hit custom outer: ${hitCustomOuter}")
        println("hit other outer: ${hitOtherOuter}")
        println("aspect coverage plugin done")
        return true
    }
}
