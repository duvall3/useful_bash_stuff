-- duvall3lib -- a collection of useful general-purpose Lua functions
-- ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2022 ~ --

--Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.


--SETTINGS

--for use with TIC80:
-- [[[ Choose one of the following two lines:
TIC80=false
-- TIC80=true
-- ]]]
if TIC80 then
  Print=trace
else
  Print=print
end


--FUNCTIONS

--Interface:
--cls() -- clear screen (mostly for interactive mode)
function cls()
  os.execute('clear')
end

--Simple Aliases and Shortcuts
--math.random:
rand = math.random
--simple Boolean test
function test(expr)
  if expr==true then
    Print('YES')
  elseif expr==false then
    Print('NO')
  else
    Print('NIL')
  end
  return expr
end

--Type Conversions:
--b2n() -- boolean2number
function b2n(b)
 if b then
        return 1
 else
        return 0
 end
end
--b2s() -- boolean2string
function b2s(b)
 if b then
        return "true"
 else
        return "false"
 end
end


--Table Operations:
--table.chain() -- chain (i.e., concatenate) a pair of tables
function table.chain(t1,t2)
  local T,k
  T=t1
  for k=1,#t2 do
    T[#t1+k] = t2[k]
  end
  return T
end
--Dump()
inspect = require 'inspect'
function Dump(o, d)
 Print(inspect.inspect(o, {depth=d}))
end
--PT() -- print table
function PT(t)
 for k,v in pairs(t) do
       Print(tostring(k)..'\t'..tostring(v))
 end   
end    
--TI() -- TableInvert
function TI(t)
   local s={}
   for k,v in pairs(t) do
     s[v]=k
   end
   return s
end
--TC() -- TableContains
function TC(t,o)
 if (not t) or (not o) then return nil end
 for k,v in pairs(t) do
        if v==o then return true end
 end
 return false
end
--TR() -- TableRemove (by object rather than index as in table.remove())
function TR(t,o)
 if (not t) or (not o) then return nil end
 for k,v in pairs(t) do
        if v==o then t[k]=nil end
 end
 return t
end
--TE() --TableEquiv -- table comparator
function TE(t1,t2)
 if t1 and t2 then
        if #t2~=#t1 then return false end
        local tot=0
        for k,v in pairs(t1) do
                if t2[k]==v then tot=tot+1 end
        end
        if tot==#t1 then
                return true
        else
                return false
        end
 elseif (t1==nil) and (t2==nil) then return true --this is lua's default handling of nil==nil
 else return false
 end
end
--PTP() -- PrintTableProperties
--   given a list of tables (L) and any sequence of (sub)properties,
--   print the final property
--   e.g., PTP(L,'a','b') will print L[1].a.b, L[2].a.b, L[3].a.b, etc.
function PTP(L,...)
  local N, level, props, item
  N = select('#',...) --length of ...
  for k,v in pairs(L) do
    item = v
    for level = 1,N do
      props = table.pack(select(level,...))
      item = item[props[1]]
    end
    if item then Print(tostring(item)) end
  end
end


--all pau!   )
