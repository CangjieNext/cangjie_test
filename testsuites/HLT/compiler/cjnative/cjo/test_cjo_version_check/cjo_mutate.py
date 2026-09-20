# cjo_mutate.py — CJO 版本检查 LLT fixture 手术工具(契约占位;ST 阶段落地)
# 先例:CHIROpt/ArrayLambda pick_defination.py(套件根共享工具,DEPENDENCE ../x.py)
# 契约(与 test_cjo_version_check 各用例头部一致):
#   --patch-cjo <file> --set-cjo-version M.m.p     跨包 cjo fixture:cjoVersion 三元组改写
#   --patch-cache --set-cache-cjo-version M.m.p    增量缓存:.cached 内 <hash>.cjo 的 cjoVersion 改写
#   --patch-cache --clear-cache-cjo-version        增量缓存:删 cjoVersion 字段(缺字段负向)
# 手术目标:CjoFormat.fbs cjoVersion 字段(勿混淆 .cachedast HashedPackage.version:
# 那是既有 CANGJIE_VERSION 门禁字段)。实现:flatc JSON 往返主路径 + 字节定点兜底。
# 权威命令 cjo→json: ./flatc -t ./CjoFormat.fbs -- ./<file>.cjo
# 权威命令 json→cjo: ./flatc -b ./CjoFormat.fbs ./<file>.json 产出 <file>.bin,mv 改名为 <file>.cjo
# 注:flatc 输出 relaxed JSON(键名不带引号);stderr 的 snake_case warning 可忽略
raise SystemExit('cjo_mutate.py: ST-stage tool not yet implemented (see header contract)')
