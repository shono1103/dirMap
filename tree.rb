def buildDirTree(parentDir, graphviz, parentDirNode)
    # ディレクトリの内容取得
    childrenDirName = Dir.entries(parentDir.myPath).reject{|i| i == "." || i == ".."}
    # それぞれの子要素に対してtree構造を作成する
    childrenDirName.each do |childDirName|
        # Nodeオブジェクトの生成
        childDir = Directory.new(childDirName, parentDir.myPath + "/" + childDirName)
        # graphviz用のnode/edge生成
        childDirNode = graphviz.add_nodes(childDir.myDirName, shape: "box", color: childDir.isDirectory? ? "blue" : "red")
        graphviz.add_edges(parentDirNode, childDirNode)
        # 子に追加
        parentDir.addChild(childDir)
        # パスがディレクトリを示していればその
        if childDir.isDirectory?
            buildDirTree(childDir, graphviz, childDirNode)
        end
    end
end

def buildDirMap(parentDir, dirMap)
    parentDir.children.each do |childDir|
      
    end
end


class Directory
    attr_reader :myPath, :children, :myDirName
    def initialize(dirName, path)
    @myDirName = dirName
    @myPath = path
    @children = []
    end
    def addChild(childDir)
        @children.push(childDir)
    end

    def isDirectory?
      File.directory?(@myPath)
    end
end