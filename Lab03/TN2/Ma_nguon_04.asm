# Ma nguon 4 - chuyen cau lenh thanh lenh hop ngu

.text
.globl main
main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3

    # >>> cac lenh cho x1, x2, x3 va x4
    # 1. x1 = y + z + w -> $t0
    add  $t5, $s0, $s1       # $t5 = y + z
    add  $t0, $t5, $s2       # $t0 = (y + z) + w

    # 2. x2 = (y + z) - (w + 5) -> $t1
    add  $t5, $s0, $s1       # $t5 = y + z
    addi $t1, $s2, 5         # $t1 = w + 5
    sub  $t1, $t5, $t1       # $t1 = (y + z) - (w + 5)

    # 3. x3 = y -> $t2
    add  $t2, $zero, $s0     # $t2 = y

    # 4. x4 = z - y -> $t3
    sub  $t3, $s1, $s0       # $t3 = z - y

    li   $v0, 10
    syscall
