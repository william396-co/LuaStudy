function createDir(dirname)
    os.execute("mkdir "..dirname) -- after mkdir need space
end

createDir(io.read())
