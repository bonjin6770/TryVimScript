"=============================================================================
" functionsのcol({expr})を試す。
" 戻り値は数値。
" {expr}で与えられる位置の桁番号(バイトインデックス)が戻り値となる。
" 有効な位置
" . 現在の位置
" $ カレント行の末尾(カレント行のバイト数+1を返す)
" ,x マークxの位置(マークが設定されていない場合は0):現在のファイルのマークしか使えないことに注意。
" {expr}は[lnum, col]という行番号と桁番号のリストでもよい。
" colに"$"を指定して、ある行の最後の行を取得するのに便利。
" "lnum"か"col"が範囲外である場合は0を返す
"
" 行番号を取得するにはline()を使う。
" 行番号と桁バン行両方を取得するにはgetpos()を使う。
" 画面上の桁番号を使うにはvirtcol()を使う。
"
" 行の先頭の桁番号は1
" 戻り値が0はエラーの意味。
"
" 大文字のマークは他のバッファを指しているかもしれない。
"
" 'virtualedit'が有効なとき、カーソルが行末を超えていると、桁番号は行の長さより1大きい値を返す。
"
" コマンドで呼び出すとき
" :call col("'A")
"=============================================================================

" マークAの桁番号を取得
let a = col("'A")
echo a

let a = col("'" . "A")
echo a

" 現在カーソルの桁番号を取得
let b = col(".")
echo b

" [lnum,col]のリストを与える
" もし、空白行をlnumに与えると、戻り値は0になる。
let c = col([9,3])
echo c

"=============================================================================
"
"=============================================================================
"************************************************************
"
"************************************************************