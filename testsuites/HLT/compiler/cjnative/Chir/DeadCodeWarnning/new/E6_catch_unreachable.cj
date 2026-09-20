// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [E6_catch_unreachable] catch 块不可达: 全部可捕获类型被前一 catch 覆盖
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: 规格 §12 异常和资源管理.md:41（当某个 catch 块可捕获的异常类型均可被它前面某个 catch 块捕获时报"catch 块不可达"warning; 1.3.0-alpha 落地为第 8 种 DiagKind sema_useless_exception_type, WarnGroup=unused, 锚于后一 catch 的 pattern 列; sema 层——-Woff unused 可抑制, 见 W1）
// EXEC-PIPE-0: %compiler --error-count-limit=all --diagnostic-format=noColor %ohos_opt --dy-std %f -o %output 2>&1 | compare %f


main() {
    try {
        throw Exception("x")
    } catch (e: Exception) {
        println("first")
    } catch (e: Exception) {
        println("second")
    }
}

/* SCAN-IN
warning: useless exception type
  ==> E6_catch_unreachable.cj:18:17:
   | 
18 |     } catch (e: Exception) {
   |                 ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
1 warning generated, 1 warning printed.
*/
