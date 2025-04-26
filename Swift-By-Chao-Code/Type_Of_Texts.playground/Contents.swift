/*
 \n 换行
 \t 缩紧
 \u{} 使用 Unicode
 \" 双引号
 \\ 输入斜线
 */
var text: String = "hi"
let emoji: String = "😂"
text += emoji
print(text)
//启动 Unicode
print("\u{4F60}\u{597D}")
print("""
你好
\t你好
""")
