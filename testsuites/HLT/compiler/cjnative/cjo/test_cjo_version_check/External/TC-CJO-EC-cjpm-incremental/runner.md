# TC-CJO-EC-cjpm-incremental(组: External;执行域: manual)

- 用例意图: cjpm 包级增量账本 × cjc 版本门禁的可达路径——依赖 cjo 以 mtime 保持方式原位替换为不兼容版本(账本不察觉、不重编洗白),下游源码编辑触发重编译 → 门禁直面变异 cjo 拒绝(诊断透传);恢复兼容版本后重编成功
- fixture: 单模块双包 cjpm 工程(src/pkg_a 公共函数 + src/main 导入调用),cjo_mutate.py 现场手术,零 .cjo 预存
- 判据: cjo_version_check/ecosystem/toolchain/eco_cjpm_incremental
- 需求追溯: 增量编译分层实测推导(设计文档 test_design.md §二增量编译分层语义);DT:包级跳过×门禁直面;需求来源:产物被原位替换的存量场景

cjpm 工程级 runner 规格(External:cjpm 增量治具)

前置事实(2026-09-22 实测,cjpm 1.3.0-alpha.05):包级账本(target/release/incremental-cache.json)对输出 mtime 敏感,变异必改 mtime 会触发依赖包从源重编(变异被洗回当前版本 cjo);故本用例变异须保持 mtime。

步骤:
  1. 工程首次 `cjpm build -i` 成功;再跑一次确认包级跳过(无编译输出);
  2. 变异:python 包装执行 cjo_mutate.py --patch-cjo <pkg cjo> --set-cjo-version 0.2.0,随后 os.utime 恢复原 mtime;
  3. 编辑下游源码(main.cj 追加一行)→ `cjpm build -i` → 断言非零退出+输出含 `is incompatible: compiled with cjc`(依赖包未被重编洗白,门禁直面变异 cjo);
  4. 恢复:mtime 保持恢复 (0,1,0) → 再编辑下游源码 → `cjpm build -i` 成功 → 运行产物正确。

预言:账本对 mtime 保持的产物替换不敏感;门禁只在下游实际编译时执行且拒绝不兼容产物;恢复兼容版本后构建自愈。
