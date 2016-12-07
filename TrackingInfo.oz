declare
fun{Counter InS}
   fun{Update LisofR Result}
      case LisofR of
	 nil then [Result#1]
      [] (K#V)|T then
	 if K == Result then (K#(V+1))|T
	 else (K#V)|{Update T Result}
	 end
      end
   end
   fun{Parcourir AVerif List}
      case AVerif of H|T then
	 local N in
	    N={Update List H}
	    N|{Parcourir T N}
	 end
      []nil then nil
      end
   end
in
   thread {Parcourir InS nil} end
end

local InS X in
   X={Counter InS}
   InS=a|b|a|c|_
   {Browse X}
end