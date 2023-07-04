local pb = require 'pb'
local pbio = require 'pb.io'
local protoc = require "protoc"

-- pb example 

pbio.dump("abc.proto",[[
        syntax = "proto3";

        package abc;
        message Msg{
                int32 id = 1;
                string errmsg = 2;
        }
]])


local p = protoc.new()
p:loadfile("person.proto")

assert(p:loadfile("abc.proto"))


local data2 = {
                id = 1000,
                errmsg = "errdsads"
}


local res = pb.encode("abc.Msg",data2);
print(pb.tohex(res))
local dres = pb.decode("abc.Msg",res);
print(require "serpent".block(dres))

-- lua table data
local data = {
   name = "ilse",
   age  = 18,
   contacts = {
      { name = "alice", phonenumber = 12312341234 },
      { name = "bob",   phonenumber = 45645674567 }
   }
}

-- encode lua table data into binary format in lua string and return
local bytes = assert(pb.encode("Person", data))
print(pb.tohex(bytes))

-- and decode the binary data back into lua table
local data2 = assert(pb.decode("Person", bytes))
print(require "serpent".block(data2))
