"=============================================================================
" 制御コマンド
"=============================================================================
" ifコマンド
" if 条件
" endif

" if ~ elseifコマンド
" 他の言語のようにelse if ではなくelseifであることに注意。
" if 条件
" elseif 条件
" endif
"
" whileコマンド
let i = 0
while i < 5
  " 処理
  echo i
  let i += 1
endwhile

" for コマンド
" forはリストの中身を操作するコマンド
for e in [1, 2, 3,]
  echo e
endfor
