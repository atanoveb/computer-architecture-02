# 컴퓨터구조_과제_02 (RISC-V)
# 32202643
# 여지훈

    la   a0, arr  # 배열의 시작 주소를 a0에 로드한다.
    lw   a1, len  # 배열의 길이를 a1에 로드한다.

sort:
    add sp sp -48  # 6개의 레지스터 공간을 할당한다.

    sd ra, 40(sp)  # ra에 return address
    sd s3 0(sp)  # i로 사용될 s3
    sd s4 8(sp)  # j로 사용될 s4
    sd s5 16(sp)  # temp로 사용될 s5
    sd s6 24(sp)  # arr로 사용될 s6
    sd s7 32(sp)  # len으로 사용될 s7

    mv s6 a0  # s6에 arr를 할당한다.
    mv s7 a1  # s7에 len을 할당한다.
    li s3 1  # (for 반복문 조건 중) i = 1 부분

sort_for:
    bge s3, s7, for_done  # (for 반복문 조건 중) i < len 부분
    addi s3 s3 1  # (for 반복문 조건 중) i++ 부분

    subi s4 s3 1  # (for 반복문 내부 중) j = i - 1 부분

    slli t0 s3 8
    add t0 s6 t0
    ld t1 0(t0)  # t1에 temp (arr[i])
    
sort_while:
    blt s4 x0 while_done  # (while 반복문 조건 중) j < 0 부분
    
    slli t2 s4 8
    add t2 s6 t2
    ld t3 0(t0)  # t3에 arr[j]
    ld t4 8(t0)  # t4에 arr[j+1]

    ble t3 t1 while_done  # (while 반복문 조건 중) arr[j] < temp 부분

    ld t4 t3  # (while 반복문 내부 중) arr[j+1] = arr[j]
    subi s4 s4 1  # (while 반복문 내부 중) j--

while_done:
    addi s3 s3 1  # (for 반복문 조건 중) i++ 부분
    j for_done

for_done:
    ld s3, 0(sp)
    ld s4, 8(sp)
    ld s5, 16(sp)
    ld s6, 24(sp)
    ld s7, 32(sp)
    ld ra, 40(sp)
    addi sp, sp, 48
    ret
