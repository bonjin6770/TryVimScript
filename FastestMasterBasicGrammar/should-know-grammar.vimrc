"=============================================================================
" 知っておくと便利な文法
"=============================================================================
"
" - 真偽値
"
" :if :while や条件演算子等の真偽値が求められる場所では、値は数値に変換され、その値が０かそれ以上かで判定されます。
" ０のときは偽、それ以外の時は真です。
"
" - 値の交換
"
" 先ほどの真偽値や、文字列の連結、数値演算など特定の箇所では値は暗黙的な値に変換されます。
" 整数値が文字列になる場合は、リテラル表記と同様に解釈されます。文字列の末尾にゴミがあっても無視されます。
" 変換できない場合は０に変換されます。
" それ以外の暗黙的な変換行われません。整数値と小数値の変換も暗黙的には行われないので注意してください。
" 変換が必要な場面で型の変換ができない場合はエラーになります。
"
" - 値の再代入
"
" すでにある変数に値を代入する場合、元の値と新しい値が型変換可能な型でない場合は、エラーになります。
" その場合は、:unletコマンドを使って一旦変数を削除する必要があります。
"
unlet a
let a = [1,2,3]
" let a = 1 エラー
unlet a
let a = 1

" これは特に様々な値が入ったリストを:forで回す際に注意が必要です。

for i in [0, 1.1, ['list'], 'string']
  echo i
  unlet i " iは forの部分で再代入されるのでunletが必要
endfor

" - 変数が定義されているかどうかの判定

" exists()関数を使います
let e = exists('var')
echo e

" - 便利な関数
" * range()
"   連番のリストを生成します。:for と組み合わせると効果的です。
"   range(3) == [0,1,2]
"   range(1, 3) == [1,2,3]
"   range(1,5,2) == [1,3,5]
"
" * map(expr, string)
"   第一引数のリストの各要素をstringで渡した文字列を評価した値に変換します。v:valが要素として参照できます。
"   辞書も渡せます。辞書の場合は辞書の各地が変換されるほか、v:keyでキーを参照できます。
"   渡したリスト自体が書き換えられるので注意してください。コピーは作られません。
"   map(1,2,3],'v:val + 1') == [2,3,4]
" * filter(expr, string)
"   第一引数のリストの各要素をstringで渡した文字列を評価した結果が真になるもののみになるようにフィルタリングします。v:valが要素として参照できます。
"   辞書も渡せます。辞書の場合は辞書の各値が評価される他、v:keyでキーを参照できます。
"   渡したリスト自体が書き換えられるので注意してください。コピーは作られません。
"   filter([1,2,3],'v:val%2 ==1') == [1,3]
"
" - リスト代入
"
" リストを複数の変数にばらして代入できます。代入先の変数の数と代入元のリストの長さは同じである必要があります。

let [key, value] = ['key', 'value']
echo key
echo value
let [e1, e2; rest] = ['e1', 'e2', 'rest1', 'rest2']
echo e1
echo e2
echo rest

" - 例外処理
"
" 専用のコマンド群があります。

try
  throw "error"
catch /error/ " エラーメッセージにマッチする正規表現
  " ...例外処理...
  echo 'catch error'
catch         " 空の場合は必ずマッチする
  " ...例外処理...
  echo 'catch empty'
finally
  " 必ず行われる処理
endtry


