class TreeMaker

    def buildDirTree(parentDir)
        childrenDirName = Dir.entries(parentDir.getMyPath).reject{|i| i == "." || i == ".."}
        childrenDirName.each do |childDirName|
            childDir = Directory.new(childDirName, parentDir.getMyPath + "/" + childDirName)
            parentDir.addChild(childDir)
            # パスがディレクトリを示していればその
            if File.directory?(childDir.getMyPath)
                buildDirTree(childDir)
            end
        end
    end

    def getDirTree()
        @rootDir
    end
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
    
    def getMyPath
        @myPath
    end
    def getChildren
        @children
    end
end