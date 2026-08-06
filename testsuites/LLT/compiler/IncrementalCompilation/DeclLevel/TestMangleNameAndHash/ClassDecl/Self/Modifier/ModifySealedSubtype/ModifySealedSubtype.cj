// DEPENDENCE: template.cj %n.new.cj
// EXEC: %cpfile template.cj main.cj
// EXEC: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// EXEC: %cpfile %n.new.cj main.cj
// EXEC-PIPE-0: %compiler -Woff all %noStackInfo %incrementalCompile %cmp_opt main.cj -o %output 2>&1 && cat .cached/*.log | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan begin dump raw modified decls:
// ASSERT: scan C 7default1CC main.cj 2: srcuse
// ASSERT: scan Fallback info:
// ASSERT: scan changed subtype of sealed type: C 7default1CC main.cj 2
// ASSERT: scan incremental compile result kind: rollback
// ASSERT: scan full sema
// ASSERT: scan incremental cjo saving
