// DEPENDENCE: c p
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c

// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir main.cj --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f

package cmp
main(){
    let p1 = Point(2, 3)
    let p2 = -p1 
    let p3 = p1 + p2 
    let p4 = p1 * p2
    println(p1)
    println(p2)
    println(p3)
    println(p4)
}
/* SCAN
(2, 3)
(-2, -3)
(0, 0)
(-4, -9)
*/