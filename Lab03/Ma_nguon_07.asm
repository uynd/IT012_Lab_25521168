.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"

.text
.globl main
main:
    # --- 1. Nh?p ch? s? ??u tháng 1 (reading0) vào $s0 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s0, $v0

    # --- 2. Nh?p ch? s? ??u tháng 2 (reading1) vào $s1 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s1, $v0

    # --- 3. Nh?p ch? s? ??u tháng 3 (reading2) vào $s2 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s2, $v0

    # --- 4. Nh?p ch? s? cu?i tháng 3 (reading3) vào $s3 ---
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    move $s3, $v0

    # --- 5. Tính toán (dùng add, sub theo chu?n) ---
    sub  $t0, $s1, $s0      # usage1 = reading1 - reading0
    sub  $t1, $s2, $s1      # usage2 = reading2 - reading1
    sub  $t2, $s3, $s2      # usage3 = reading3 - reading2
    
    add  $t3, $t0, $t1      # T?ng t?m = usage1 + usage2
    add  $t3, $t3, $t2      # total = T?ng t?m + usage3

    # --- 6. In k?t qu? ra màn hình ---
    
    # In "Thang 1: " + usage1
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In "Thang 2: " + usage2
    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In "Thang 3: " + usage3
    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In "Tong:    " + total
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    move $a0, $t3
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # K?t thúc ch??ng trình
    li   $v0, 10
    syscall