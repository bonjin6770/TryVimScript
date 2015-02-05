"=============================================================================
" リスト操作
"=============================================================================
" リストの表現
let list = [1, 2, 3]
" echo list

" リスト要素の参照と代入
let list = [1, 2, 3]
let e0 = list[0]
" echo e0

let e2 = list[2]
" echo e2

let e1_2 = list[1 : 2]
" echo e1_2

let e_1 = list[ : 1]
" echo e_1

let list[0] = 10
let list[1] = 20
" echo list

" リスト操作
let list = [1, 2, 3]

" len:リストの長さ
let length = len(list)
" echo length

" remove:任意の要素を取り出す
let first = remove(list, 0)
" echo first
let last = remove(list, -1)
" echo last
" echo list

" insert:任意の位置に要素を追加
" （単純な関数の呼び出しには:callコマンドを使います。）
call insert(list, 5, 0)
" echo list

" add:末尾に要素を追加
call add(list, 9)
echo list
