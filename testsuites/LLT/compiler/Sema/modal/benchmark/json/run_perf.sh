#!/usr/bin/env bash
# One run each: wall-clock time and max RSS. Requires cjc in PATH, GNU /usr/bin/time.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
SCRIPT_FILE="${BASH_SOURCE[0]}"

need_build() {
    local target=$1 src=$2
    [[ ! -f "$target" ]] || [[ "$src" -nt "$target" ]] || [[ "$SCRIPT_FILE" -nt "$target" ]] || [[ "$(which cjc)" -nt "$src" ]]
}
run_one() {
    local binary_out time_f exitcode
    binary_out=$(mktemp)
    time_f=$(mktemp)
    set +e
    ( /usr/bin/time -f "%e %M" bash -c '"$1" 2>&1' _ "$1" ) 1>"$binary_out" 2>"$time_f"
    exitcode=$?
    set -e
    if [[ $exitcode -ne 0 ]]; then
        echo "run_perf.sh: $1 exited with code $exitcode" >&2
        cat "$binary_out" >&2
        rm -f "$binary_out" "$time_f"
        exit $exitcode
    fi
    cat "$binary_out"
    time_line=$(cat "$time_f")
    rm -f "$binary_out" "$time_f"
    read -r sec rss <<< "$time_line"
    printf "cjEnableLocalRegion=%s %s %.2fs %.1fMiB\n" $cjEnableLocalRegion "$(basename "$1")" "$sec" "$(echo "scale=1; $rss/1024" | bc)"
}

if need_build perf_old perf_old.cj; then
    cjc -o perf_old perf_old.cj -L$CANGJIE_STDX_PATH --import-path=$CANGJIE_STDX_PATH -lstdx.encoding.json -O2 --no-sub-pkg --int-overflow=wrapping -Woff all
fi
LD_LIBRARY_PATH=$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH run_one ./perf_old
# if need_build perf_new perf_new.cj || need_build perf_new json_region.cj; then
#     cjc -o perf_new json_region.cj perf_new.cj -L$CANGJIE_STDX_PATH --import-path="$SCRIPT_DIR:$CANGJIE_STDX_PATH" -O2 --no-sub-pkg --int-overflow=wrapping -Woff all
# fi
# export MCC_LOG_LOCAL_REGION=/root/rep/cj3/cangjie_compiler/.vscode/no.log && cjEnableLocalRegion=0 LD_LIBRARY_PATH=$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH run_one ./perf_new
# export MCC_LOG_LOCAL_REGION=/root/rep/cj3/cangjie_compiler/.vscode/region.log && cjEnableLocalRegion=1 LD_LIBRARY_PATH=$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH run_one ./perf_new
# if need_build perf3 perf3.cj || need_build perf3 json_region.cj; then
#     cjc -o perf3 json_region.cj perf3.cj -L$CANGJIE_STDX_PATH --import-path="$SCRIPT_DIR:$CANGJIE_STDX_PATH" -O2 --no-sub-pkg --int-overflow=wrapping -Woff all
# fi
# LD_LIBRARY_PATH=$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH run_one ./perf3
# if [[ -f tostring_old.txt && -f tostring_new.txt ]]; then
#     if diff tostring_old.txt tostring_new.txt; then
#         echo "toString match: OK (json_region produces same JSON as stdx)"
#     else
#         echo "toString MISMATCH: json_region vs stdx differ"
#         diff tostring_old.txt tostring_new.txt || true
#     fi
# fi
