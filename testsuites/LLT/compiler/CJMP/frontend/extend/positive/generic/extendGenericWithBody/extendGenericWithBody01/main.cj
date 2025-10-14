// DEPENDENCE: c p
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c

// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir main.cj --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output

package cmp
main(){
    Foo().f1()
}
