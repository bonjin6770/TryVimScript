"=============================================================================
" ファイル入出力
"=============================================================================
" vimのバッファを経由する方法もありますが、ここではVimの環境に影響を与えない方法を示す。
"
" - readfile()関数
"   ファイルの中身を行区切りのリストで取得する
"
let fname = 'test.txt'
for line in readfile(fname)
  if line =~ 'Date'
    " echo line
  endif
endfor


" writefile()関数
" 行区切りのリストをファイルに書き出します。
let fname = 'output.txt'
call writefile(['line1', 'line2', 'line3'], fname)
