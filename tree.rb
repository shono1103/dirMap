def buildDirTree(parentDir)
    childrenDirName = Dir.entries(parentDir.myPath).reject{|i| i == "." || i == ".."}
    childrenDirName.each do |childDirName|
        childDir = Directory.new(childDirName, parentDir.myPath + "/" + childDirName)
        parentDir.addChild(childDir)
        # パスがディレクトリを示していればその
        if childDir.isDirectory?
            buildDirTree(childDir)
        end
    end
end

def buildDirMap(parentDir, dirMap)
    parentDir.children.each do |childDir|
      
    end
end


class Directory
    attr_reader :myPath, :children
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