_dir=function() 
	local k,v,l print("---File ".."list START---")
	for k,v in pairs(file.list())
	do l = string.format("%-15s",k)
		print(l.." : "..v.." bytes")
	end
	print("--File ".."list END--")
end 
_dir()
_dir=nil

print("------------------------------------------\n")

r,u,t=file.fsinfo()
print("Total : "..t.." bytes\r\nUsed  : "..u.." bytes\r\nRemain: "..r.." bytes\r\n")
r=nil
u=nil
t=nil