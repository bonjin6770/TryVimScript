"=============================================================================
" 文字列の表現
"=============================================================================
" 文字列はシングルクォートかダブルクォートで囲みます。
" ダブルクォートの中では\t(タブ)や\n(改行)などの特殊文字を使用できます。
" シングルクォート内ではシングルクォート自身を表現するのに、シングルクォートを２つ重ねます。それ以外の文字は一切展開されません。
let str = "abc"
echo str
let str = 'def'
echo str
let str = "abd\ndef"
echo str
let str = 'that''s right!'
echo str

" 各種文字列操作
" 1. 結合
let join1 = 'aaa' . 'bbb'
let join2 = join(['aaa', 'bbb', 'ccc'], ',')
echo 'join1 = ' . join1
echo 'join2 = ' . join2

" 2. 分割
let record = split('aaa,bbb,ccc', ',')
echo "record = "
echon record

" 3. 長さ
let length = strlen('abcdef')
echo 'strlen(abcdef) = ' . length

" 4. 切り出し
let substr = 'abcd'[1]      " b
echo 'substr = ' . substr

let substr = 'abcd'[0 : 1]  " ab
echo 'substr = ' . substr

let substr = 'abcd'[ : 1]   " ab
echo 'substr = ' . substr

let substr = 'abcd'[2 : ]   " cd
echo 'substr = ' . substr

let substr = 'abcd'[1 : -1] " bcd
echo 'substr = ' . substr

" 5. 検索
let result = stridx('abcd', 'cd')  " 見つかった場合はその位置、見つからなかった場合は-1が返る
echo 'result = '
echon result

