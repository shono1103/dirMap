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
    
end


class Directory
    def initialize(dirName, path)
    @myDirName = dirName
    @myPath = path
    @children = []
    end
    def addChild(childDir)
        @children.push(childDir)
    end
    # getter
    def myPath
        @myPath
    end
    # getter
    def children
        @children
    end

    def isDirectory?
      File.directory?(@myPath)
    end
end