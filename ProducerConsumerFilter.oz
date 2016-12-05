local
   fun {Producer N}
      local
	 fun {Prod A N}
	    if A==N then nil
	    else A|{Prod A+1 N}
	    end
	 end
      in
	 {Prod 1 N}
      end
   end
   fun {Consumer S}
      local
	 fun {Sum S1 Acc}
	    case S1 of nil then Acc
	    []H|T then {Sum T Acc+H}
	    end
	 end
      in
	 {Sum S 0}
      end
   end
   fun {Filter S}
      case S
      of nil then nil
      []H|T then
	 if {Int.isOdd H} then H|{Filter T}
	 else {Filter T}
	 end
      end
   end
   S
   S2
in
   thread S={Producer 20} end
   thread S2={Filter S} end
   thread {Browse {Consumer S2}} end
end