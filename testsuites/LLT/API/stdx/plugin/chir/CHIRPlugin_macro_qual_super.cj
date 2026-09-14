/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// @CHIRPlugin 扫描 QualifiedType 父类型（as RefType 为 None），正向构造并运行

// DEPENDENCE: qual_marker
// EXEC-PIPE-0: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt %compile_shared_lib_opt %pkg_opt qual_marker -o libqual_marker.%dylib_suffix
// EXEC-PIPE-0: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt -Woff unused %f -L. -lqual_marker --import-path=. -o %output
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f

/* SCAN
name: QualSuper
ok: true
run: true
*/

import stdx.plugin.*
import stdx.chir.*
import qual_marker

@CHIRPlugin
class QualSuper <: qual_marker.Marker {
    public override func run(pkg: Package): Bool {
        let _ = pkg
        true
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let p = QualSuper()
    println("name: ${p.name}")
    println("ok: ${p is qual_marker.Marker}")
    println("run: ${p.run(pkg)}")
}
