// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 && cat .cached/*.log | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan S 7default1SC main.cj 1: srcuse
// ASSERT: scan Fallback info:
// ASSERT: scan changed subtype of sealed type: S 7default1SC main.cj 1
// ASSERT: scan incremental compile result kind: rollback
// ASSERT: scan full sema
// ASSERT: scan incremental cjo saving
