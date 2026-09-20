# TC-CJO-QY-older-minor(组: Manual;执行域: manual)

- 用例意图: 加载 (0,0,255) 查询 (0,1) → AtMost=true、AtLeast/Exactly=false;读侧分流据此选择旧语义分支(design-spec §4.1 分流示例的矩阵位)
- fixture: fixture:cjoVersion=(0,0,255) 的最小 CJO。
- 判据: cjo_version_check/whitebox/version_query/query_older_minor
- 需求追溯: DT 设计补盲#9(分流接口);白盒:镜像位+patch 镜像锚;读侧分流语义

查询接口白盒 UT 规格(Manual)

装载 (0,0,255) 的 CJO → 对 required=(0,1) 调用三接口:
  AtMost=true, AtLeast=false, Exactly=false
分流意义:读侧据此选择旧语义分支 A 而非新分支 B(design-spec §4.1 分流示例的矩阵位);
patch=255 压满仍不改变结果(patch 不参与比较的镜像锚)。