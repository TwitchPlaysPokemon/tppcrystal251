; 0 mouth open
db 0, 0, 0, $c1, 0, 0, 0

; 1 mouth open some corruption
db $80, 4, 0, $c5, 0, $80, 0

; 2 mouth open more corruption
db $80, 6, 0, $c5, $50, $80, 0

; 3 mouth open all corruption
db $80, $16, 1, $e5, $50, $80, 0

; 4 mouth closed with some corruption
db $80, 4, 0, $44, 0, $80, 0