"=============================================================================
" 関数
"=============================================================================
" 関数は:functionコマンドで定義する。
" ユーザ定義の関数名は組み込み関数名と区別するために大文字で始める必要がある。

function! Sum(v1, v2)
  return a:v1 + a:v2
endfunction

" - function!の!は、同名の関数を再定義する際に既存の関数を上書きすることを示します。
"   スクリプトを再読み込みした時のために、基本的に付けておくおく。
" - 関数内で引数にアクセスするには、a:という接頭辞が必要です。
"
" 同一スクリプト内でのみ使える関数(スクリプトローカルな関数)を定義するには、関数名の先頭にs:をつけます。
" この場合s:以降の関数名は大文字で始める必要はありません。

function! s:sum(v1, v2)
  return a:v1 + a:v2
endfunction

" 可変長引数を使いたい場合は引数の最後を...にします。
" 可変長引数にアクセスするには以下のようにします。
" a:0
"     可変長部分の引数の数
" a:n
"     nは数字。n盤目の引数にアクセスする。a:1,a:2など。
" a:000
"     可変長部分を表すリスト。ぶっちゃけこれを使えば全社の２つはなくてもなんとかなる。
function! s:sum(v1, ...)
  let sum = a:v1
  for i in a:000
    let sum += i
  endfor
  return sum
endfunction

" 関数の呼び出し
" 関数を呼び出して、その戻り値を長い式の一部として使用するには、関数の名前を指定し、それに続けて【】で囲んだ引数リストを記述するだけのことです。

" 関数の戻り値を使用する。
let sum = s:sum(1,2)
echo sum
" ただし、注意する点として、CやPerlとは異なり、Vimスクリプトでは関数の戻り値を使用することなく破棄することはできません。
" したがって、関数をプロシージャやサブルーチンとして使用して、その戻り値を無視
" する場合には、callコマンドを先頭に付けて関数を呼び出す必要があります。

" その戻り値を使用しないで関数を使用する。
call s:sum(3,4)
" 関数の中で引数の値を使用する。
" このようにしないと、vimスクリプトは関数呼び出しが実際には組み込みVimコマンド
" であるという前提のもとに、そのようなコマンドは存在しないとしてエラーを出すことになります。
