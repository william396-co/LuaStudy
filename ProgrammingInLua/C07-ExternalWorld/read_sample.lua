t = io.read("a") -- read the whole file
t = string.gsub(t,"bad","good") -- do the job
io.write(t)
