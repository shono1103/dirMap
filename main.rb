require "ruby-graphviz"
require "./tree.rb"

# パスからディレクトリ(ファイル)名を取得する
def getDirNameFromPath path
    splitedPath = path.split("/")
    dirName = splitedPath.last
end

arguments = ARGV
targetPath = ""
outputPath = ""
# 引数からターゲットのパスを取得
if arguments.length == 2
    targetPath = arguments[0]
    outputPath = arguments[1]
elsif arguments.length == 0
    targetPath = Dir.pwd
    outputPath = Dir.pwd
else
    puts "形式が正しくありません"
    exit 1
end

puts "root = #{targetPath} #{targetPath.class}, output = #{outputPath} #{outputPath.class}"

# ターゲットのディレクトリの存在確認
unless File.directory?(targetPath) 
    puts "ターゲットのディレクトリが存在しません"
    exit 1
end
# ディレクトリ名の取得
dirName = getDirNameFromPath(targetPath)

# ディレクトリ構造のtreeデータ作成
targetDir = Directory.new(dirName, targetPath)
buildDirTree(targetDir)

dirMap = GraphViz.new(:G, type: :digraph)



p targetDir.children