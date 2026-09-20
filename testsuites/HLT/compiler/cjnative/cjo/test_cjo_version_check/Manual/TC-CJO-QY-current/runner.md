# TC-CJO-QY-current(组: Manual;执行域: manual)

- 用例意图: 加载 (0,1,0) 查询 (0,0)/(0,1)/(0,2) —— 对 (0,1) 三接口均 true;对 (0,0) 仅 AtMost;对 (0,2) 三接口均 false;patch 任意改变比较结果不变
- fixture: cjoVersion=(0,1,0) 的最小 CJO——由当前 cjc 编译最小包产出(flatc -t ./CjoFormat.fbs 核验字段),或以最小 JSON 经 ./flatc -b ./CjoFormat.fbs ./min.json 产出后改名 .cjo,或 UT 内直构 header 缓冲。
- 判据: cjo_version_check/whitebox/version_query/query_current
- 需求追溯: DT 设计补盲#9(分流接口);白盒:三接口×三目标+patch 扰动判定表;Exactly 语义锚

查询接口白盒 UT 规格(Manual:ASTLoader 单测挂载点)

装载 (0,1,0) 的 CJO → 对 required=(0,0)/(0,1)/(0,2) 分别调用三接口:
  (0,1):AtLeast=true, AtMost=true, Exactly=true
  (0,0):AtLeast=false, AtMost=true, Exactly=false
  (0,2):AtLeast=false, AtMost=false, Exactly=false
patch 扰动:required.patch 取 0/255 各一次 → 三接口结果均不变(patch 不参与比较)。
预言:9+6 个布尔值完全确定,逐项断言。